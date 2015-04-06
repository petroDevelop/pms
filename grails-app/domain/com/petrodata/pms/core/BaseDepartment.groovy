package com.petrodata.pms.core
   //部门表 可用于表示树形组织关系 （本系统中即为 小队）
class BaseDepartment {
    //名称
    String name
    //上级部门
    BaseDepartment parent
    //是否可以分配员工
    boolean isContainer
    //是否小队
    boolean isTeam

    static belongsTo =[parent:BaseDepartment]
    static hasMany = [children:BaseDepartment,baseUsers: BaseUser]
    static constraints = {
        name(size:0..50,blank: false,unique: true);
        parent(nullable:true)
    }
}
