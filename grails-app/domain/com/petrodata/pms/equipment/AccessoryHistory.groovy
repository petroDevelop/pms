package com.petrodata.pms.equipment

import com.petrodata.pms.core.BaseUser

//配件历史表
class AccessoryHistory {
    //配件
    Accessory accessory
    //操作
    String operator
    //旧值
    String oldValue
    //新值
    String newValue
    //操作人
    BaseUser baseUser
    Date dateCreated
    Date lastUpdated
    static constraints = {
        accessory(nullable: true)
        operator(size: 0..50,inList: ['create','update','delete'])
        oldValue(size: 0..4000,nullable: true)
        newValue(size: 0..4000,nullable: true)
        baseUser(nullable: false)
    }
}
