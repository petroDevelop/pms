package com.petrodata.pms.equipment
 //标准
class Standard {
    //标准名称
    String name
    //设备类型
    EquipmentCatagory equipmentCatagory
    //标准类型
    String type
    //执行依据  （时间 或 里程数）
    String aim='time'
    //执行周期
    long excuteCycle
    //参考标准
    String reference
    //注意事项
    String attention
    static hasMany = [standardItems:StandardItem]
    static constraints = {
        //运行标准，检查标准，保养标准，大修标准
        type(size:0..40,nullable: true,inList: ['OperationStandard','InspectionStandard','MaintenanceStandard','OverhaulStandard'])
        aim(size: 0..40,nullable: true,inList: ['time','milage'])
    }
}
