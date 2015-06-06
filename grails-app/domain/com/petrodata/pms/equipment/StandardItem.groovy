package com.petrodata.pms.equipment
 //标准项
class StandardItem {
    //关联标准
    Standard standard;
    //标准类型 //'运行检查标准','保养标准','大修标准'
    String type
    //执行依据  （时间 或 里程）【运行项时为缺省值】
    String aim='时间'
    //运转项（检查项-保养项描述）名称
    String name
    //运转项标准范围值
    String range
    //检查周期    检查周期      B （班次） 7天
    String checkType
     //间隔日期 (单位天)
    int checkDays
    //执行周期 【运行项时为缺省值0】   (单位小时) //保养周期
    long excuteCycle
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
        //运行检查标准，保养标准，大修标准  'InspectionStandard','MaintenanceStandard','OverhaulStandard'
        type(size:0..40,nullable: true,inList: ['运行检查标准','保养标准','大修标准'])
        aim(size: 0..40,nullable: true,inList: ['时间','里程']);
        checkType(size: 0..40,nullable: true,inList: ['班次','天数']);
        checkDays();
        name(size:0..50,nullable: false,blank: false);
        range(size:0..100,nullable: true,blank: true);
        sop(size:0..100,nullable: true,blank: true);
        sopCode(size:0..100,nullable: true,blank: true);
        accessory(size:0..100,nullable: true,blank: true);
    }
    String toString(){
        return name;
    }
}
