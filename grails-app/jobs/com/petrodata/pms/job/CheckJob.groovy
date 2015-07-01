package com.petrodata.pms.job

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.equipment.Equipment
import com.petrodata.pms.equipment.EquipmentCatagory
import com.petrodata.pms.order.JobItem
import com.petrodata.pms.order.JobOrder
import com.petrodata.pms.team.Position
import com.petrodata.pms.team.PositionBaseUser
import com.petrodata.pms.team.Rotation
//检查项及运行项的定时任务
class CheckJob {
    static triggers = {
        //半小时执行
        simple name: 'mySimpleTrigger', repeatCount:0,startDelay: 0, repeatInterval: 3*60*1000 // execute job once in 30 minutes  30*60*1000l
        //cron name: 'myTrigger', cronExpression: "0 0 6 * * ?"
        //custom name:'customTrigger', triggerClass:MyTriggerClass, myParam:myValue, myAnotherParam:myAnotherValue
    }
    def group = "OrderGroup"
    def description = "检查和运行工单的执行任务"

    def execute(){
        log.error "execute once=${new Date().time}"
        //遍历所有小队（isRunning）
        BaseDepartment.findAllByIsWorkingAndType(true,'小队节点').eachWithIndex{team,i->
            println "${team.name}"
            //下属班次遍历
            def equipmentCatagories=EquipmentCatagory.list();
            Rotation.findAllByBaseDepartment(team).each{rotation->
                  println "${rotation.name}"
                  Date serverTime=new Date();
                  String rotationDay=serverTime.format('yyyy-MM-dd',TimeZone.getTimeZone(rotation.timeZone));
                  Date  localTime=Date.parse('yyyy-MM-dd',rotationDay);
                  Date teamTime=Date.parse('yyyy-MM-dd HH:mm',serverTime.format('yyyy-MM-dd HH:mm',TimeZone.getTimeZone(rotation.timeZone)));
                  Date rotationTime=Date.parse('yyyy-MM-dd HH:mm',"${rotationDay} ${rotation.checkTime}");
                //当前时间（当地时差），与班次的工单生产时间匹配，若时差在半小时内并且工单表中无此工单
                  if((teamTime.time-rotationTime.time).abs()<1800000l){ //1000*60*30
                      //@todo 同步此操作
                      generateJobOrder(rotation,localTime,equipmentCatagories,team);
                  }
            }
        }
    }
    private synchronized static void generateJobOrder(Rotation rotation,Date localTime,List<EquipmentCatagory> equipmentCatagories,BaseDepartment team) {
        if(JobOrder.countByRotationAndJobDate(rotation,localTime)==0){
            //   则为此班次生成工单（本小队所有岗位一份）
            JobOrder.withTransaction {status ->
                try{
                    PositionBaseUser.executeQuery("select pb.position from PositionBaseUser pb where pb.baseUser.baseDepartment=?",[team]).each{position->
                        def jobOrder=new JobOrder(rotation: rotation,position:position,jobDate: localTime,type:'运行检查');
                        if(jobOrder.save(flush: true)){
                            def ecList=[];
                            position.eptCatas.each{ec->
                                def list=getSubChild(equipmentCatagories,ec,[]);
                                ecList=(ecList+list).unique().collect {EquipmentCatagory.get(it)};
                            }
                            //获取小队所有设备
                            def equipments=Equipment.findAllByBaseDepartmentAndEquipmentCatagoryInList(team,ecList);
                            equipments.each{equipment->
                                println "细化运行项"
                                //细化运行项
                                equipment.standard.standardItems.each{standardItem->
                                    println standardItem.name
/*                                    if(standardItem.type=='运行标准'){
                                         new JobItem(jobOrder:jobOrder,equipment: equipment,standardItem: standardItem).save(flush: true);
                                    }*/
                                    if(standardItem.type=='运行检查标准'){
                                        println standardItem.type
                                        if(standardItem.checkType=='班次'&& rotation.chargeDailyCheck){
                                            new JobItem(jobOrder:jobOrder,equipment: equipment,standardItem: standardItem).save(flush: true);
                                        }
                                        if(standardItem.checkType=='天数'&& standardItem.checkDays>0){
                                            if(JobItem.countByEquipmentAndStandardItem(equipment,standardItem)>0){
                                                if(JobItem.countByEquipmentAndStandardItemAndDateCreatedGreaterThan(equipment,standardItem,(new Date()-standardItem.checkDays))==0){
                                                    new JobItem(jobOrder:jobOrder,equipment: equipment,standardItem: standardItem).save(flush: true);
                                                }
                                            }else{
                                                if(team.workTime){
                                                    if((new Date())-standardItem.checkDays>team.workTime){
                                                        new JobItem(jobOrder:jobOrder,equipment: equipment,standardItem: standardItem).save(flush: true);
                                                    }
                                                }else{
                                                    new JobItem(jobOrder:jobOrder,equipment: equipment,standardItem: standardItem).save(flush: true);
                                                }
                                            }
                                        }
                                    }

                                }
                                //细化检查项
                            }

                        }else{
                            //@todo 保持事务一致
                            println jobOrder.errors.allErrors
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
