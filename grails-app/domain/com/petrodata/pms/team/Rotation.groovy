package com.petrodata.pms.team

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.core.BaseUser
//班次
class Rotation {
    //名称
    String name
    //录入人（小队队长）
    BaseUser creater;
    //隶属小队   初始化时与录入者的部门id相同
    BaseDepartment baseDepartment;
    //时区  演算成与服务器时区的小时差
    String timeZone
    //班次开始时间
    long beginTime
    //班次结束时间
    long endTime
    //检查工单生成时间
    long checkTime
    //说明
    String description
    //岗位包含人员
    static hasMany = [baseUsers:BaseUser]
    static constraints = {
        name(size:0..100);
        description(size:0..500,nullable: true);
    }
    def beforeInsert() {
        baseDepartment=creater?.baseDepartment;
    }
}
