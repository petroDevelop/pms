package com.petrodata.pms.equipment

import com.petrodata.pms.core.BaseUser
import com.petrodata.pms.order.JobItem

//配件使用记录
class AccessoryUse {
    //配件
    Accessory accessory
    //操作用户
    BaseUser baseUser
    //工单项
    JobItem jobItem
    Date dateCreated
    Date lastUpdated
    static constraints = {
        accessory(nullable: false)
        baseUser(nullable: false)
        jobItem(nullable: true)
    }
}
