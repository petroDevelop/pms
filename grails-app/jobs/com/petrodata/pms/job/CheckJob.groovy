package com.petrodata.pms.job

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.core.BaseDepartmentWorkingHistory
import com.petrodata.pms.equipment.Equipment
import com.petrodata.pms.equipment.EquipmentCatagory
import com.petrodata.pms.equipment.EquipmentRuningTime
import com.petrodata.pms.equipment.EquipmentRunningInfo
import com.petrodata.pms.order.JobItem
import com.petrodata.pms.order.JobOrder
import com.petrodata.pms.team.Position
import com.petrodata.pms.team.PositionBaseUser
import com.petrodata.pms.team.Rotation
//检查项及运行项的定时任务
class CheckJob {
    static triggers = {
        //半小时执行
        //simple name: 'mySimpleTrigger', repeatCount:-1l,startDelay: 30*1000l, repeatInterval: 30*60*1000l // execute job once in 30 minutes  30*60*1000l
        cron name: '30MinuteTrigger', cronExpression: "0 0/30 * * * ?" // "0 0/30 * * * ?"
        //custom name:'customTrigger', triggerClass:MyTriggerClass, myParam:myValue, myAnotherParam:myAnotherValue
    }
    def group = "OrderGroup"
    def description = "检查和运行工单的执行任务"
    static int executeNumber;
    static long executeTime=System.currentTimeMillis();
    def execute(){
        //executeNumber++;
        //log.error "${executeNumber}=${System.currentTimeMillis()-executeTime}"
        //executeTime=System.currentTimeMillis();

        //遍历所有小队（isRunning）
        BaseDepartment.findAllByIsWorkingAndType(true,'小队节点').eachWithIndex{team,i->
            //下属班次遍历
            def equipmentCatagories=EquipmentCatagory.list();
            Rotation.findAllByBaseDepartment(team).each{rotation->
                  //服务器当前时间
                  Date serverTime=new Date();
                  String rotationDay=serverTime.format('yyyy-MM-dd',TimeZone.getTimeZone(rotation.timeZone));
                  Date  localTime=Date.parse('yyyy-MM-dd',rotationDay);
                  if(team.jobOrderInitDate==null || team.jobOrderInitDate<=localTime){
                      Date teamTime=Date.parse('yyyy-MM-dd HH:mm',serverTime.format('yyyy-MM-dd HH:mm',TimeZone.getTimeZone(rotation.timeZone)));
                      Date rotationTime=Date.parse('yyyy-MM-dd HH:mm',"${rotationDay} ${rotation.checkTime}");
                      //当前时间（当地时差），与班次的工单生产时间匹配，若时差在半小时内并且工单表中无此工单
                      if(Long.parseLong(teamTime.time-rotationTime.time+"").abs().longValue()<1800000l){ //1000*60*30
                          //同步此操作
                          generateJobOrder(rotation,localTime,equipmentCatagories,team);
                      }
                  }
            }
        }
    }
    private synchronized static void generateJobOrder(Rotation rotation,Date localTime,List<EquipmentCatagory> equipmentCatagories,BaseDepartment team) {
        if(JobOrder.countByRotationAndJobDate(rotation,localTime)==0){
            //   则为此班次生成工单（本小队所有岗位一份）
            JobOrder.withTransaction {status ->
                try{
                    //需要过滤是否在本班次人员的检查设备中
                    def users=rotation.baseUsers;
                    PositionBaseUser.executeQuery("select distinct pb.position from PositionBaseUser pb where pb.baseUser in :users",[users:users]).toList().unique().each{position->
                        def ecList=[];
                        position.eptCatas.each{ec->
                            def list=getSubChild(equipmentCatagories,ec,[]);
                            ecList=(ecList+list).unique();
                        }
                        ecList=ecList.collect {EquipmentCatagory.get(it)};
                        //获取小队所有设备
                        def equipments=Equipment.findAllByInDepartmentAndServiceStateAndEquipmentCatagoryInList(team,'在用',ecList);
                        if(equipments.size()>0){
                            //运行检查工单和保养工单是两个工单，所以分开。
                            def jobOrder;//=new JobOrder(rotation: rotation,position:position,jobDate: localTime,type:'运行检查');
                            def maintainJobOrder;
                            equipments.each{equipment->
                                //细化运行项
                                equipment.standard.standardItems.each{standardItem->
                                    if(standardItem.type=='运行检查标准'){
                                        if(standardItem.checkType=='班次'){
                                            if(!jobOrder){
                                                jobOrder=new JobOrder(rotation: rotation,position:position,jobDate: localTime,type:'运行检查');
                                                jobOrder.save(flush: true)
                                            }
                                            def jobItem=new JobItem(jobOrder:jobOrder,equipment: equipment,standardItem: standardItem);
                                            jobItem.save(flush: true);
                                        }
                                        if(standardItem.checkType=='天数'&& standardItem.checkDays>0 && rotation.chargeDailyCheck){
                                            //@todo 需要判断初次运行时与初始化数据比对 equipmentRunningInfo
                                            if(JobItem.countByEquipmentAndStandardItem(equipment,standardItem)>0){
                                                if(JobItem.countByEquipmentAndStandardItemAndDateCreatedGreaterThan(equipment,standardItem,(new Date()-standardItem.checkDays))==0){
                                                    if(!jobOrder){
                                                        jobOrder=new JobOrder(rotation: rotation,position:position,jobDate: localTime,type:'运行检查');
                                                        jobOrder.save(flush: true)
                                                    }
                                                    new JobItem(jobOrder:jobOrder,equipment: equipment,standardItem: standardItem).save(flush: true);
                                                }
                                            }else{
                                                if(team.workTime){
                                                    if((new Date())-standardItem.checkDays>team.workTime){
                                                        if(!jobOrder){
                                                            jobOrder=new JobOrder(rotation: rotation,position:position,jobDate: localTime,type:'运行检查');
                                                            jobOrder.save(flush: true)
                                                        }
                                                        new JobItem(jobOrder:jobOrder,equipment: equipment,standardItem: standardItem).save(flush: true);
                                                    }
                                                }else{
                                                    if(!jobOrder){
                                                        jobOrder=new JobOrder(rotation: rotation,position:position,jobDate: localTime,type:'运行检查');
                                                        jobOrder.save(flush: true)
                                                    }
                                                    new JobItem(jobOrder:jobOrder,equipment: equipment,standardItem: standardItem).save(flush: true);
                                                }
                                            }
                                        }
                                    }
                                    //
                                    if(standardItem.type=='保养标准'){
                                        def equipmentRunHour; //设备已经运行时长
                                        def jobItemCreateTime; //下次工单生产时间
                                        //判断本设备此条标准项下是否生成过工单
                                        //先去历史表中读取本小队的开工操作时间
                                        def historys=BaseDepartmentWorkingHistory.findAllByBaseDepartmentAndIsWorking(team,true,['sort':'id','order':'desc']);
                                        def lastTime=Date.parse("yyyy-MM-dd",'1900-01-01');
                                        if(historys && historys.size()>0){
                                            lastTime=historys[0].dateCreated;
                                        }

                                        if(JobItem.countByEquipmentAndStandardItemAndDateCreatedGreaterThan(equipment,standardItem,lastTime)>0){
                                            def previousItems = JobItem.findAllByEquipmentAndStandardItem(equipment,standardItem,['sort':'id','order':'desc']);
                                            def lastJobItem = previousItems[0];
                                            //@done: 改为从 EquipmentRuningTime表格中累加获取设备运行时间
                                            //equipmentRunHour = (localTime.getTime() - lastJobItem.dateCreated.getTime())/(1000*60*60);
                                            //jobItemCreateTime = new Date((lastJobItem.dateCreated.getTime() + standardItem.excuteCycle*1000*60*60).toLong());
                                            equipmentRunHour=EquipmentRuningTime.countByDateCreatedBetween(lastJobItem.dateCreated,localTime);
                                            //int fromLastItemHour= (localTime.getTime() - lastJobItem.dateCreated.getTime())/(1000*60*60);
                                        }else {
                                            def runningInfo = EquipmentRunningInfo.findByEquipment(equipment);
                                            if(team.workTime || team.jobOrderInitDate) {
                                                def teamStartDate = (team.jobOrderInitDate?:team.workTime);
                                                //@done: 改为从 EquipmentRuningTime表格中累加获取设备运行时间
                                                //设备的当前运转时间
                                                //equipmentRunHour = (localTime.getTime() - teamStartDate.time)/(1000*60*60);
                                                equipmentRunHour=EquipmentRuningTime.countByDateCreatedBetween(teamStartDate,localTime);
                                                if(runningInfo) {
                                                    equipmentRunHour += runningInfo?.maintenanceInitTime;
                                                }
                                                //jobItemCreateTime = new Date((localTime.getTime() + (standardItem.excuteCycle - equipmentRunHour)*1000*60*60).toLong());
                                            }
                                        }
                                        boolean ifCreateItemInRotation=false;
                                        if((standardItem.excuteCycle-equipmentRunHour).abs()<rotation.hours){
                                            ifCreateItemInRotation=true;
                                        }
                                        if(standardItem.warningHour > 0 && !ifCreateItemInRotation){
                                            //if((equipmentRunHour - standardItem.excuteCycle) <= standardItem.warningHour)
                                            //{
                                            //    equipment.warningMaintenanceDate = jobItemCreateTime;
                                            //}
                                            //@done:判断当前时间处在工单需要运行时间前的warningHours小时
                                            if((standardItem.excuteCycle-equipmentRunHour-standardItem.warningHour).abs()<rotation.hours){
                                                equipment.warningMaintenanceDate=new Date((new Date()).time+standardItem.warningHour*60*60*1000);
                                            }
                                        }
                                        Date rotationBeginTime=Date.parse('yyyy-MM-dd HH:mm',"${localTime.format('yyyy-MM-dd')} ${rotation.beginTime}");
                                        Date rotationEndTime=Date.parse('yyyy-MM-dd HH:mm',"${localTime.format('yyyy-MM-dd')} ${rotation.endTime}");
                                        //if(jobItemCreateTime >= rotationBeginTime && jobItemCreateTime < rotationEndTime)//检查时间在本班次内
                                        if(ifCreateItemInRotation)
                                        {
                                            equipment.warningMaintenanceDate = null;
                                            if(!maintainJobOrder){
                                                maintainJobOrder=new JobOrder(rotation: rotation,position:position,jobDate: localTime,type:'保养');
                                                maintainJobOrder.save(flush: true)
                                            }
                                            new JobItem(jobOrder:maintainJobOrder,equipment: equipment,standardItem: standardItem).save(flush: true);
                                        }
                                        equipment.save(flush: true);
                                          //@todo 1.取出上次保养工单item时间，
                                          // @todo     2。 若无查看从小队的初始化工单时间到当前时间的小时数，再加上EquipmentRunningInfo表中的maintenanceInitTime保养初始化时间
                                           //@todo  3与标准中的excuteCycle比较，若接近warningHour个小时，则修改设备的warningMaintenanceDate字为工单生产时间，便于自动预警
                                        //   @todo  4.若接近半个小时，则生成工单，同时修改设备的warningMaintenanceDate字段为null
                                        //excuteCycle
                                        //warningHour
                                    }
                                }
                                //细化检查项
                            }
                        }
                    }

                }catch(e){
                    status.setRollbackOnly();
                    e.printStackTrace()
                }
            }
        }
    }
    private  static List getSubChild(List<EquipmentCatagory> equipmentCatagories,EquipmentCatagory equipmentCatagory,List list){
            if(equipmentCatagories.count {it.parent?.id==equipmentCatagory.id}>0){
                def child=equipmentCatagories.findAll{it.parent?.id==equipmentCatagory.id};
                list=list+child.collect {it.id}
                child.each{one->
                    list=getSubChild(equipmentCatagories,one,list);
                }
            }
            return list;
    }
}
