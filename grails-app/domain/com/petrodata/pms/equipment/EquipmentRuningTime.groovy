package com.petrodata.pms.equipment
//设备时时运行信息
class EquipmentRuningTime {
    Equipment equipment
    //时长 ？小时
    long hour
    Date dateCreated
    Date lastUpdated
    static constraints = {
        equipment()
    }
}
