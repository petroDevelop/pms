package com.petrodata.pms.equipment

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.core.BaseUser

//设备
class Equipment {
    //类型名称
    String name
    //设备别名
    String alias
    //统一编码
    String code
    //隶属类型
    EquipmentCatagory equipmentCatagory
    //对应标准
    Standard standard
    //录入人
    BaseUser creater;
    //设备所在小队 所在队伍（在调剂和调配中起作用）
    BaseDepartment baseDepartment;
    //关联运行信息
    EquipmentRunningInfo equipmentRunningInfo
    //
    //子设备
    //static belongsTo =[parent:Equipment]
    //static hasMany = [children:Equipment]

    //所属单位
    BaseDepartment belongDepartment
    //所在单位
    BaseDepartment inDepartment
    //所在国家
    String country
    //技术状况
    String techState
    //使用状况
    String serviceState
    //设备特点
    String feature
    //是否关键设备
    boolean isKey
    //是否安全设备
    boolean isSecurity
    //是否作业中设备
    boolean isWorking
    //是否HSE设备
    boolean isHSE
    //设备系列
    String series
    // 出厂编号：
    String factoryCode
    // 出厂日期：
    Date factoryDate
    //到货日期：
    Date arrivalDate
    //验收日期：
    Date acceptDate
    //投产日期：
    Date operationDate
   //资产属性：  固定资产  递延资产
    String assetsType
   // 购置合同号：
     String purchaseContractNo
    static constraints = {
        alias(nullable: true);
        standard(nullable: true);
        equipmentRunningInfo(nullable: true);
        techState(size:0..20,nullable: true,inList: ['完好','修理','待报废','报废']);
        serviceState(size:0..20,nullable: true,inList: ['待处理','在用','停运']);
        feature(size:0..20,nullable: true,inList: ['主体设备','辅助设备']);
        series(size:0..100,nullable: true);
        factoryCode(size:0..100,nullable: false);
        factoryDate(nullable: true);
        arrivalDate(nullable: true);
        acceptDate(nullable: true);
        assetsType(size:0..20,nullable: true,inList: ['固定资产','递延资产']);
        purchaseContractNo(size:0..100,nullable: true);
    }
    def beforeInsert() {
        //baseDepartment=creater?.baseDepartment;
    }
}
