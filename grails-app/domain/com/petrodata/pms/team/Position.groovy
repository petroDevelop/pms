package com.petrodata.pms.team

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.core.BaseUser
import com.petrodata.pms.equipment.Equipment
import com.petrodata.pms.equipment.EquipmentCatagory

//岗位
class Position {
    //名称
    String name
    //关联设备类型
    EquipmentCatagory equipmentCatagory

    static constraints = {
        name(size:0..100);
    }
    String toString(){
        return name;
    }

}
