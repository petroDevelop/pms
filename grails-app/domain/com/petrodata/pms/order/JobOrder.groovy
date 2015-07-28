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
    Date jobDate     //只记录年月日，时分不记录
    //工单类型
    String type
    //是否完结
    boolean isFinish

    Date dateCreated
    Date lastUpdated
    static constraints = {
        rotation(nullable: false)
        position(nullable: false)
        jobDate(nullable: false)
        type(size: 0..50,nullable: true,inList: ['运行检查','保养','大修'])
    }
    String toString(){
        return "${jobDate.format('yyyy-MM-dd')} ${rotation.name} ${position.name} ${type}类工单"
    }
}
