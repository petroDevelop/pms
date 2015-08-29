package com.petrodata.pms.core
//小队表
class BaseDepartmentWorkingHistory {
    //小队
    BaseDepartment baseDepartment
    //是否作业 只记录当前状态
    boolean isWorking=true
    //开工开钻时间
    Date workTime
    //操作时间
    Date dateCreated
    Date lastUpdated
    static constraints = {
        baseDepartment(nullable: false)
        isWorking()
        workTime(nullable: true)
    }
}
