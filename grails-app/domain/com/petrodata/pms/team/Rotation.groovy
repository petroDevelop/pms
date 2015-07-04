package com.petrodata.pms.team

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.core.BaseUser
//班次
class Rotation {
    //名称
    String name
    //录入人（小队队长）
    BaseUser creator
    //隶属小队   初始化时与录入者的部门id相同
    BaseDepartment baseDepartment
    //时区  演算成与服务器时区的小时差
    String timeZone
    //班次开始时间
    String beginTime
    //班次结束时间
    String endTime
    //检查工单生成时间
    String checkTime
    //本班工作时长
    Integer hours
    //说明
    String description
    //负责日检查工单
    boolean chargeDailyCheck = false
    //岗位包含人员
    static hasMany = [baseUsers:BaseUser]

    static constraints = {
        name(size:0..100)
        description(size:0..500,nullable: true)
        beginTime(size: 0..5)
        endTime(size: 0..5)
        checkTime(size: 0..5)
        timeZone(size: 0..200)
    }

    def beforeInsert() {
        baseDepartment=creator?.baseDepartment;
    }

    String toString(){
        return baseDepartment?.name+":"+name;
    }

    static listTimeZone() {
        return TimeZone.availableIDs.toList().sort{it};
/*        def lt = []
        (-12..12).each {
            lt << "UTC" + (it >= 0 ? "+"+it : it)
        }
        return lt*/
    }

    static listHours() {
        [6, 8, 12]
    }
}
