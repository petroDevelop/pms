package com.petrodata.pms.equipment
//设备类型
class EquipmentCatagory {
    //类型名称
    String name
    //统一编码
    String code
    //上级类型
    EquipmentCatagory parent
    //是否特种设备
    boolean isSpecial
    //规格型号
    String specification
    /*
    boolean hasOperationCheck
    boolean hasInspectionCheck
    boolean hasMaintenanceCheck
    boolean hasOverhaulCheck
    */
    static belongsTo =[parent:EquipmentCatagory]
    static hasMany = [children:EquipmentCatagory,equipments: Equipment]
    static constraints = {
        parent(nullable: true)
        specification(size:0..50,nullable: true);
    }
    static String generatorTreeDiv(){
        String divHtml="<div class=\"easy-tree\"><ul>";
        EquipmentCatagory.findAllByParentIsNull(['sort':'name','order':'asc']).each{ec->
            divHtml=divHtml+"<li value='${ec.id}'>${ec.name}";
            println divHtml;
            appendChild(ec,divHtml);
            println 'over'
            divHtml=divHtml+"</li>";
        }
        divHtml=divHtml+"</ul></div>";
        return divHtml;
    }
    private String appendChild(EquipmentCatagory equipmentCatagory,String html){
        println 'in appendChild'
        if(equipmentCatagory.children?.size()>0){
            html=html+"<ul>";
            equipmentCatagory.children.sort{it.name}.each{ec->
                html=html+"<li value='${ec.id}'>${ec.name}";
                appendChild(ec,html);
                html=html+"</li>";
            }
            html=html+"</ul>"
        }
    }
}
