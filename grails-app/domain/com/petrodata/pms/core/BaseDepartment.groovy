package com.petrodata.pms.core
   //部门表 可用于表示树形组织关系 （本系统中即为 小队）
class BaseDepartment {
    //名称
    String name
    //上级部门
    BaseDepartment parent
    //是否可以分配员工
    //boolean isContainer
    //是否小队
    //boolean isTeam
    //类型
    String type
    //是否作业 只记录当前状态
    boolean isWorking
    //开工开钻时间
    Date workTime
    //停工原因  只记录当前停工原因
    String reason
    static belongsTo =[parent:BaseDepartment]
    static hasMany = [children:BaseDepartment,baseUsers: BaseUser]
    static constraints = {
        name(size:0..50,blank: false,unique: true);
        parent(nullable:true)
        reason(size: 0..100,nullable: true,blank: true)
        type(size:0..50,nullable: true,inList: ['','公司节点','设备处节点','项目部节点','小队节点'])
        workTime(nullable: true)
    }
    String toString(){
        return name;
    }

    def beforeInsert() {
        if (isWorking && type=='小队节点') {
            workTime=new Date();
        }
    }

    def beforeUpdate() {
        if (isDirty('isWorking') && isWorking && type=='小队节点') {
            workTime=new Date();
        }
    }
}
