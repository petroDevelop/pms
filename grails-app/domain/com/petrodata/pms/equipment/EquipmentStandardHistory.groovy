package com.petrodata.pms.equipment
 //设备执行标准历史记录
class EquipmentStandardHistory {
    Equipment equipment
    Standard standard
    Date beginDate
    Date endDate
    static constraints = {
        beginDate(nullable: false);
        endDate(nullable: true);
    }
}
