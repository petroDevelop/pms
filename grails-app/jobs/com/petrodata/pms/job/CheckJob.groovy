package com.petrodata.pms.job

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.order.JobOrder
import com.petrodata.pms.team.Position
import com.petrodata.pms.team.PositionBaseUser
import com.petrodata.pms.team.Rotation


class CheckJob {
    static triggers = {
        //半小时执行
        simple name: 'mySimpleTrigger', repeatCount:-1 ,startDelay: 3000, repeatInterval: 1800000l // execute job once in 30 minutes  30*60*1000l
        //cron name: 'myTrigger', cronExpression: "0 0 6 * * ?"
        //custom name:'customTrigger', triggerClass:MyTriggerClass, myParam:myValue, myAnotherParam:myAnotherValue
    }
    def group = "OrderGroup"
    def description = "检查和运行工单的执行任务"

    def execute(){
        //遍历所有小队（isRunning）
        BaseDepartment.findAllByIsWorkingAndType(true,'小队节点').eachWithIndex{team,i->
            //下属班次遍历
            Rotation.findAllByBaseDepartment(team).each{rotation->
                  Date serverTime=new Date();
                  String rotationDay=serverTime.format('yyyy-MM-dd',TimeZone.getTimeZone(rotation.timeZone));
                  Date  localTime=Date.parse('yyyy-MM-dd',rotationDay);
                  Date teamTime=Date.parse('yyyy-MM-dd HH:mm',serverTime.format('yyyy-MM-dd HH:mm',TimeZone.getTimeZone(rotation.timeZone)));
                  Date rotationTime=Date.parse('yyyy-MM-dd HH:mm',"${rotationDay} ${rotation.checkTime}");
                //当前时间（当地时差），与班次的工单生产时间匹配，若时差在半小时内并且工单表中无此工单
                  if((teamTime.time-rotationTime.time).abs()<1800000l){
                      //@todo 同步此操作
                      generateJobOrder(rotation,localTime);
                  }
            }
        }
    }
    private synchronized void generateJobOrder(rotation,localTime) {
        if(JobOrder.countByRotationAndJobDate(rotation,localTime)==0){
            //   则为此班次生成工单（本小队所有岗位一份）
            JobOrder.withTransaction {status ->
                try{
                    PositionBaseUser.executeQuery("select pb.position from PositionBaseUser pb where pb.baseUser.baseDepartment=?",[team]).each{position->
                        def jobOrder=new JobOrder(rotation: rotation,position:position,jobDate: localTime);
                        if(jobOrder.save(flush: true)){
                            //获取所有设备
                            //细化运行项
                            //细化检查项
                        }else{
                            //@todo 保持事务一致
                        }
                    }

                }catch(e){
                    status.setRollbackOnly();
                }
            }
        }
    }
}
