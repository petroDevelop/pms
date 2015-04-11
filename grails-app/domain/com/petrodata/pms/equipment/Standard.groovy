package com.petrodata.pms.equipment
 //标准
class Standard {
    //标准名称
    String name
    //设备类型
    EquipmentCatagory equipmentCatagory
    //参考标准
    String reference
    //注意事项
    String attention
    static hasMany = [standardItems:StandardItem]
    static constraints = {
    }
}
