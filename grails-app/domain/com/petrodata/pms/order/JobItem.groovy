package com.petrodata.pms.order

import com.petrodata.pms.core.BaseUser
import com.petrodata.pms.equipment.Equipment
import com.petrodata.pms.equipment.StandardItem

//工单标准项
class JobItem {
    //工单
    JobOrder jobOrder
    //设备
    Equipment equipment
    //标准项
    StandardItem standardItem
    //检查人
    BaseUser checker
    //检查时间（转换为当地时间）
    Date checkDate
    //检查状态
    String status='未查'
    //设备状态
    Boolean isWrong
    //检查描述
    String checkResult
    //备注
    String remark
    Date dateCreated
    Date lastUpdated
    static constraints = {
        checker(nullable: true)
        checkDate(nullable: true)
        status(nullable: true,inList: ['未查','已查'])
        isWrong(nullable: true)
        checkResult(size:0..400,nullable: true)
        remark(size:0..400,nullable: true)
    }
}
