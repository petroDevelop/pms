package com.petrodata.pms.order

import com.petrodata.pms.team.Position
import com.petrodata.pms.team.Rotation

//工单
class JobOrder {
    //班次
    Rotation rotation
    //班次检查时间
    long checkTime
    //岗位
    Position position
    //工单日期
    Date jobDate
    //是否完结
    boolean isFinish
    static constraints = {
        rotation(nullable: false)
        checkTime()
        position(nullable: false)
        jobDate(nullable: false)
    }
}
