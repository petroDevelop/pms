package com.petrodata.pms.equipment
 //标准项
class StandardItem {
    //关联标准
    Standard standard;
    //标准类型
    String type
    //执行依据  （时间 或 里程数）【运行项时为缺省值】
    String aim='time'
    //执行周期 【运行项时为缺省值0】
    long excuteCycle
    //运转项名称
    String name
    //运转项标准范围值
    String range


    static constraints = {
        //运行标准，检查标准，保养标准，大修标准
        type(size:0..40,nullable: true,inList: ['OperationStandard','InspectionStandard','MaintenanceStandard','OverhaulStandard'])
        aim(size: 0..40,nullable: true,inList: ['time','milage']);
    }
}
