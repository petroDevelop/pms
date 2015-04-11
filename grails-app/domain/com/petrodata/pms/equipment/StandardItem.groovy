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
    //运转项（检查项-保养项描述）名称
    String name
    //运转项标准范围值
    String range
    //预警(时)
    int warningHour
    // SOP
    String sop
    //sop code
    String sopCode
    // 人工时（H）
    int manhour
    // 配件
    String accessory
    static constraints = {
        //运行标准，检查标准，保养标准，大修标准  'OperationStandard','InspectionStandard','MaintenanceStandard','OverhaulStandard'
        type(size:0..40,nullable: true,inList: ['运行标准','检查标准','保养标准','大修标准'])
        aim(size: 0..40,nullable: true,inList: ['time','milage']);
        name(size:0..50,nullable: false,blank: false);
        range(size:0..100,nullable: true,blank: true);
        sop(size:0..100,nullable: true,blank: true);
        sopCode(size:0..100,nullable: true,blank: true);
        accessory(size:0..100,nullable: true,blank: true);
    }
}
