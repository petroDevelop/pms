package com.petrodata.pms.order

import com.petrodata.pms.team.Position
import com.petrodata.pms.team.Rotation

//检查项及运行项的工单
class JobOrder {
    //班次
    Rotation rotation
    //岗位
    Position position
    //工单日期 (当地时区时间yyyy-MM-dd)
    Date jobDate
    //是否完结
    boolean isFinish
    Date dateCreated
    Date lastUpdated
    static constraints = {
        rotation(nullable: false)
        position(nullable: false)
        jobDate(nullable: false)
    }
}
