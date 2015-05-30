package com.petrodata.pms.job


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
        //print "Job run!"
        //遍历所有小队（isRunning）

            //下属班次遍历
              //当前时间（当地时差），与班次的工单生产时间匹配，若时差在半小时内并且工单表中无此工单
                      //   则为此班次生成工单（本小队所有岗位一份）
                           //细化保养项
                           //细化大修项


    }
}
