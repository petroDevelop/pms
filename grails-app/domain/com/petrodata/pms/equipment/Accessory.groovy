package com.petrodata.pms.equipment

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.core.BaseUser
import grails.converters.JSON

//配件表
class Accessory {
    //名称
    String name
    //描述
    String description
    //库存数量
    int number
    //报警数量
    int warningNum
    //创建者
    BaseUser creater
    //修改者
    BaseUser updater
    //隶属小队
    BaseDepartment baseDepartment
    Date dateCreated
    Date lastUpdated
    static constraints = {
        name(size: 0..500,nullable: false)
        description(size: 0..4000,nullable: false)
        number(max: 999999,min: 0)
        warningNum(max: 99999,min: 0)
        creater(nullable: false)
        updater(nullable: true)
        baseDepartment(nullable: false)
    }
    String toString(){
        return name;
    }
    def afterInsert() {
        AccessoryHistory.withNewSession {newsession->
            new AccessoryHistory(accessory: Accessory.get(this.id),operator: 'insert').save(flush: true);
        }
    }

    def beforeUpdate() {
        AccessoryHistory.withNewSession {newsession->
            def accessory=Accessory.get(this.id);
            new AccessoryHistory(accessory:accessory,operator: 'update',oldValue: (accessory as JSON).toString(),newValue: (this as JSON).toString()).save(flush: true);
        }
    }
    def beforeDelete(){
        AccessoryHistory.withNewSession {newsession->
            new AccessoryHistory(operator: 'delete',oldValue: (this as JSON).toString()).save(flush: true);
        }
    }
}
