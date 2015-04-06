package com.petrodata.pms.team

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.core.BaseUser

//岗位
class Position {
    //名称
    String name
    //录入人（小队队长）
    BaseUser creater;
    //隶属小队   初始化时与录入者的部门id相同
    BaseDepartment baseDepartment;
     //岗位包含人员
    static hasMany = [baseUsers:BaseUser]
    static constraints = {
    }
    def beforeInsert() {
        baseDepartment=creater?.baseDepartment;
    }
}
