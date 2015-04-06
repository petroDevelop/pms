package com.petrodata.pms.equipment
//设备类型
class EquipmentCatagory {
    //类型名称
    String name
    //统一编码
    String code
    //上级类型
    EquipmentCatagory parent
    //是否特种设备
    boolean isSpecial
    /*
    boolean hasOperationCheck
    boolean hasInspectionCheck
    boolean hasMaintenanceCheck
    boolean hasOverhaulCheck
    */
    static belongsTo =[parent:EquipmentCatagory]
    static hasMany = [children:EquipmentCatagory,equipments: Equipment]
    static constraints = {
    }
}
