package com.petrodata.pms.job

import com.petrodata.pms.order.JobItem
import com.petrodata.pms.order.JobOrder

//保养项及大修项的定时任务
class RepairJob {
    static triggers = {
        //半小时执行
        simple name: 'mySimpleTrigger', repeatCount:-1 ,startDelay: 600, repeatInterval: 5000l // execute job once in 5 seconds
        //cron name: 'myTrigger', cronExpression: "0 0 6 * * ?"
        //custom name:'customTrigger', triggerClass:MyTriggerClass, myParam:myValue, myAnotherParam:myAnotherValue
    }
    def group = "MyGroup"
    def description = "Example job with Simple Trigger"

    def execute(){

    }
    def repair(){
        //保养工单需要先判断是否存在设备保养，再生产jobOrder和item
        //遍历所有小队（isRunning）

        //下属班次遍历
        //当前时间（当地时差），与班次的工单生产时间匹配，若时差在半小时内并且工单表中无此工单
        //   则为此班次生成工单（本小队所有岗位一份）
        //细化保养项
        //细化大修项

        /*
1. 计算运行时间
   1.1 从上次本设备的保养时间，若无则从开工时间算起，至当前时间，算每天的班次的工单数（若有本班次工单（工单数>0）,增加本班次的小时数）
   再减去维修时间，为本设备的运行时间
2. 运行时间 与 保养周期
        当运行时间大于等于保养周期时，取模，若值小于x小时，则生成保养工单。
* */
    /*
        if(standardItem.type=='保养标准'){


            def last=JobItem.findByStandardItemAndEquipment(standardItem,equipment,['sort':'id','order':'desc']);
            if(last){
                //以时间判断，可能会多增加小队停工、收工后的时间，出现误差
                //if(((new Date().time-last.dateCreated.time)/(1000*60*60)).intValue()>=standardItem.excuteCycle){
                //new JobItem(jobOrder:jobOrder,equipment: equipment,standardItem: standardItem).save(flush: true);
                //}
                // 数工单数
                def count=JobOrder.countByRotationAndPositionAndDateCreatedBetween(rotation,position,last.jobOrder.dateCreated,new Date());
                if(count*24>=standardItem.excuteCycle){  //设备运行信息
                    new JobItem(jobOrder:jobOrder,equipment: equipment,standardItem: standardItem,type:'保养').save(flush: true);
                }
            }else{
                //if(((new Date().time-team.workTime.time)/(1000*60*60)).intValue()>=standardItem.excuteCycle){}
                def count=JobOrder.countByRotationAndPositionAndDateCreatedBetween(rotation,position,team.workTime,new Date());
                if(count*24>=standardItem.excuteCycle){  //设备运行信息
                    new JobItem(jobOrder:jobOrder,equipment: equipment,standardItem: standardItem,type:'保养').save(flush: true);
                }
            }
        }

        */
    }
}
