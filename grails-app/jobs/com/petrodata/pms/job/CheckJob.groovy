package com.petrodata.pms.job



class CheckJob {
    static triggers = {
        simple name: 'mySimpleTrigger', repeatCount:-1 ,startDelay: 600, repeatInterval: 5000l // execute job once in 5 seconds
        //cron name: 'myTrigger', cronExpression: "0 0 6 * * ?"
        //custom name:'customTrigger', triggerClass:MyTriggerClass, myParam:myValue, myAnotherParam:myAnotherValue
    }
    def group = "MyGroup"
    def description = "Example job with Simple Trigger"

    def execute(){
        //print "Job run!"
    }
}
