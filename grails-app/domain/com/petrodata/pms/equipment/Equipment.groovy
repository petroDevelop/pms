package com.petrodata.pms.equipment

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.core.BaseUser

//设备
class Equipment {
    //类型名称
    String name
    //统一编码
    String code
    //隶属类型
    EquipmentCatagory equipmentCatagory
    //对应标准
    Standard standard
    //录入人
    BaseUser creater;
    //设备所在小队 （在调剂和调配中起作用，初始化时与录入者的部门id相同）
    BaseDepartment baseDepartment;
    //关联运行信息
    EquipmentRunningInfo equipmentRunningInfo
    static constraints = {
        standard(nullable: true);
        equipmentRunningInfo(nullable: true);
    }
    def beforeInsert() {
        baseDepartment=creater?.baseDepartment;
    }
}
