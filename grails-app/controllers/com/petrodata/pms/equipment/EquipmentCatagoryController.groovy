package com.petrodata.pms.equipment

import com.petrodata.poi.ExcelReadBuilder
import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException


class EquipmentCatagoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE", "GET", "POST"]]
    def sessionFactory
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        //[equipmentCatagoryInstanceList: EquipmentCatagory.list(params), equipmentCatagoryInstanceTotal: EquipmentCatagory.count()]
        return [];
    }
    def json(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def ecCount=EquipmentCatagory.createCriteria().count{
            if(params.search){
              ilike('name',"%${params.search}%");
            }
        }
        def ecList=EquipmentCatagory.createCriteria().list{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
            order(params.sort,params.order)
            maxResults(params.max.toInteger())
            firstResult(params.offset.toInteger())
        }
        def map=[:];
        map.total=ecCount;
        map.rows=ecList;
        render map as JSON;
    }
    /*
    def create() {
        [equipmentCatagoryInstance: new EquipmentCatagory(params)]
    }
    */
    def serverSave(){
        def map=[:];
        if(!params.version){
            params.version=0l;
        }
        if(!params.id){
            map=this.save();
        }else{
           map=this.update(params.id?.toLong(),params.version?.toLong()?:0);
        }
        println map
        render "${(map as JSON).toString()}"   //此样式支持IE9
    }
    def save() {
        def map=[:];
        def equipmentCatagoryInstance = new EquipmentCatagory(params)
        if (!equipmentCatagoryInstance.save(flush: true)) {
            map.result=false;
            //@todo
            map.message=equipmentCatagoryInstance.errors.allErrors.toString();
            //render(view: "create", model: [equipmentCatagoryInstance: equipmentCatagoryInstance])
            //return
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), equipmentCatagoryInstance.id])
        map.result=true;
        map.message=flash.message;
        return map;
        //render map as JSON;
        //redirect(action: "list", id: equipmentCatagoryInstance.id)
    }
    /*
    def show(Long id) {
        def equipmentCatagoryInstance = EquipmentCatagory.get(id)
        if (!equipmentCatagoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), id])
            redirect(action: "list")
            return
        }

        [equipmentCatagoryInstance: equipmentCatagoryInstance]
    }

    def edit(Long id) {
        def equipmentCatagoryInstance = EquipmentCatagory.get(id)
        if (!equipmentCatagoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), id])
            redirect(action: "list")
            return
        }

        [equipmentCatagoryInstance: equipmentCatagoryInstance]
    }
        */
    def update(Long id, Long version) {
        def map=[:];
        def equipmentCatagoryInstance = EquipmentCatagory.get(id)
        if (!equipmentCatagoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), id])
            map.result=false;
            map.message=flash.message;
            //redirect(action: "list")
            //return
        }
        if (version != null) {
            if (equipmentCatagoryInstance.version > version) {
                equipmentCatagoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory')] as Object[],
                        "Another user has updated this EquipmentCatagory while you were editing")
                map.result=false;
                map.message=equipmentCatagoryInstance.errors.allErrors.toString();
                //render(view: "edit", model: [equipmentCatagoryInstance: equipmentCatagoryInstance])
                //return
            }
        }

        equipmentCatagoryInstance.properties = params

        if (!equipmentCatagoryInstance.save(flush: true)) {
            map.result=false;
            map.message=equipmentCatagoryInstance.errors.allErrors.toString();
            //render(view: "edit", model: [equipmentCatagoryInstance: equipmentCatagoryInstance])
            //return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), equipmentCatagoryInstance.id])
        map.result=true;
        map.message=flash.message;
        return map;
        //redirect(action: "list", id: equipmentCatagoryInstance.id)
    }

    def delete(Long id) {
        def map=[:]
        def equipmentCatagoryInstance = EquipmentCatagory.get(id)
        if (!equipmentCatagoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), id])
            map.result=false;
            map.message=flash.message;
            //redirect(action: "list")
            //return
        }

        try {
            equipmentCatagoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), id])
            map.result=true;
            map.message=flash.message;
            //redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), id])
            map.result=false;
            map.message=flash.message;
            //redirect(action: "show", id: id)
        }
        render map as JSON;
    }
    def deleteAll(){
        def map=[:]
        def list=params.ids.tokenize(',');
        list.each {
            def oneInstance = EquipmentCatagory.get(it.toLong());
            oneInstance.delete(flush: true);
        }
        flash.message = message(code: 'default.deleted.message')
        //redirect action: "list"
        map.result=true;
        map.message=flash.message;
        render map as JSON;
    }
    def importExel(){
        def map=[:];
        def file = request.getFile('file');
        if(file ||!file?.empty) {  //file.originalFilename
            try{
                def list1=[];
                def list2=[];
                new ExcelReadBuilder(2003,file.bytes).eachLine([sheet:'sheet1',labels:true]) {
                    if(it.rowNum>2){
                        list1<<[rowNum:(it.rowNum-2),name1:cell(0)?.toString(),name2:cell(1)?.toString(),name3:cell(2)?.toString()];
                    }
                }
                list2=list1.clone();
                list1.reverseEach{row->
                     if(row.name1){
                         list2.findAll{it.rowNum>=row.rowNum && !it.name1}.each{it.name1=row.name1};
                     }
                     if(row.name2){
                         list2.findAll{it.rowNum>=row.rowNum && !it.name2}.each{it.name2=row.name2};
                     }
                    if(row.name3){
                        list2.findAll{it.rowNum>=row.rowNum && !it.name3}.each{it.name3=row.name3};
                    }
                }
                list2.collect{it.name1}.unique().each{
                      if(it){ new EquipmentCatagory(name:it,code:it).save(flush: true);}
                }
                list2.collect{it.name2}.unique().each{one->
                    if(one){
                        def row=list2.find{it.name2==one};
                        new EquipmentCatagory(name:row.name2,code:row.name2,parent: EquipmentCatagory.findByName(row.name1?:'')).save(flush: true);
                    }
                }
                list2.eachWithIndex{row,i->
                    if(row.name3 && EquipmentCatagory.countByName(row.name3)==0){
                        new EquipmentCatagory(name:row.name3,code:row.name3,parent: EquipmentCatagory.findByName(row.name2?:'')).save(flush: true);
                    }
                    if(i % 100 == 0) {
                        sessionFactory.getCurrentSession().clear();
                    }
                }
                map.result=true;
            }catch(e){
                map.result=false;
                map.message=e.message;
            }
        }else{
            map.result=false;
            map.message="file is empty!";
        }
        render "${(map as JSON).toString()}"   //此样式支持IE9
    }
}
