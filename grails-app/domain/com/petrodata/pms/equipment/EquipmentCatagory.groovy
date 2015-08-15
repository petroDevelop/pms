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
        code(size: 0..200)
        specification(size:0..50,nullable: true);
    }
    public static String generatorTreeDiv(){
        String divHtml="<div class=\"easy-tree\"><ul>";
        EquipmentCatagory.findAllByParentIsNull(['sort':'id','order':'asc']).each{ec->
            divHtml=divHtml+"<li value='${ec.id}'>${ec.name}";
            divHtml=appendChild(ec,divHtml);
            divHtml=divHtml+"</li>";
        }
        divHtml=divHtml+"</ul></div>";
        return divHtml;
    }
    private static String appendChild(EquipmentCatagory equipmentCatagory,String html){
        def list=EquipmentCatagory.findAllByParent(equipmentCatagory,['sort':'id','order':'asc']);
        if(list?.size()>0){
            html=html+"<ul>";
            list?.each{ec->
                html=html+"<li value='${ec.id}'>${ec.name}";
                html=appendChild(ec,html);
                html=html+"</li>";
            }
            html=html+"</ul>"
        }
        return html;
    }

    def beforeInsert() {
        encodeCode()
    }

    def beforeUpdate() {
        encodeCode()
    }

    def encodeCode() {
        code = code.padRight(200," ")
    }
    String toString(){
        return name;
    }
}
