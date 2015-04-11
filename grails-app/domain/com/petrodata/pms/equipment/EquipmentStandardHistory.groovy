package com.petrodata.pms.equipment
 //设备执行标准历史记录
class EquipmentStandardHistory {
    //设备
    Equipment equipment
    //标准
    Standard standard
    //起始日期
    Date beginDate
    //终止日期
    Date endDate
    static constraints = {
        beginDate(nullable: false);
        endDate(nullable: true);
    }
}
