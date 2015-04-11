package com.petrodata.pms.equipment
 //设备运行信息 （系统根据其属性值 与标准的规定 定时生产工单）
class EquipmentRunningInfo {
    //
    Equipment equipment
    //总运转时间 (整形时长)
    long totalTime
    //保养初始化时间 时
    long maintenanceInitTime
     //上次大修保养时间  时
    long lastOverhaulTime
    //检查初始化时间
    Date checkInitDate
    static constraints = {
    }
}
