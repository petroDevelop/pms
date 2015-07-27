package com.petrodata.pms.equipment

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.core.BaseUser
import org.springframework.dao.DataIntegrityViolationException
import com.petrodata.poi.ExcelReadBuilder
import grails.converters.JSON


class EquipmentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE","GET","POST"]]
    def springSecurityService
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max
        //[equipmentInstanceList: Equipment.list(params), equipmentInstanceTotal: Equipment.count()]
        return []
    }
    def json(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def allCount=Equipment.createCriteria().count{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
        }
        def allList=Equipment.createCriteria().list{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
            order(params.sort,params.order)
            maxResults(params.max.toInteger())
            firstResult(params.offset.toInteger())
        }
        def map=[:];
        map.total=allCount;
        map.rows=allList;
        render map as JSON;
    }
    def serverSave(){
        def currentUser=BaseUser.get(springSecurityService.currentUser.id);
        def map=[:];
        if(!params.version){
            params.version=0l;
        }
        if(params.factoryDate){
            params.factoryDate=java.util.Date.parse('yyyy-MM-dd',params.factoryDate);
        }
        if(params.arrivalDate){
            params.arrivalDate=java.util.Date.parse('yyyy-MM-dd',params.arrivalDate);
        }
        if(params.acceptDate){
            params.acceptDate=java.util.Date.parse('yyyy-MM-dd',params.acceptDate);
        }
        if(params.operationDate){
            params.operationDate=java.util.Date.parse('yyyy-MM-dd',params.operationDate);
        }
        if(!params.id){
            map=this.save();
        }else{
            map=this.update(params.id?.toLong(),params.version?.toLong()?:0);
        }
        render "${(map as JSON).toString()}";
    }
    def save() {
        def currentUser=BaseUser.get(springSecurityService.currentUser.id);
        def map=[:]
        def equipmentInstance = new Equipment(params)
        equipmentInstance.creater=currentUser;
        if (!equipmentInstance.save(flush: true)) {
            map.result=false;
            //@todo
            map.message=equipmentInstance.errors.allErrors.toString();
        }else{
            flash.message = message(code: 'default.created.message', args: [message(code: 'equipment.label', default: 'Equipment'), equipmentInstance.id])
            map.result=true;
            map.message=flash.message;
        }

        return map;
    }
    def update(Long id, Long version) {
        def currentUser=BaseUser.get(springSecurityService.currentUser.id);
        def map=[:]
        def equipmentInstance = Equipment.get(id)
        if (!equipmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipment.label', default: 'Equipment'), id])
            map.result=false;
            map.message=flash.message;
        }
        if (version != null) {
            if (equipmentInstance.version > version) {
                    equipmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'equipment.label', default: 'Equipment')] as Object[],
                            "Another user has updated this Equipment while you were editing")
                map.result=false;
                map.message=equipmentInstance.errors.allErrors.toString();
            }
        }
        equipmentInstance.properties = params
        //equipmentInstance.creater=currentUser;
        if (!equipmentInstance.save(flush: true)) {
            map.result=false;
            map.message=equipmentInstance.errors.allErrors.toString();
        }else{
            flash.message = message(code: 'default.updated.message', args: [message(code: 'equipment.label', default: 'Equipment'), equipmentInstance.id])
            map.result=true;
            map.message=flash.message;
        }

        return map;
    }

    def delete(Long id) {
        def map=[:]
        def equipmentInstance = Equipment.get(id)
        if (!equipmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipment.label', default: 'Equipment'), id])
            map.result=false;
            map.message=flash.message;
        }
        try {
            equipmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipment.label', default: 'Equipment'), id])
            map.result=true;
            map.message=flash.message;
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'equipment.label', default: 'Equipment'), id])
            map.result=false;
            map.message=flash.message;
        }
        render map as JSON;
    }

    def deleteAll ={
        def map=[:]
        def list=params.ids.tokenize(',');
        list.each{
            
                def oneInstance=Equipment.get(it.toLong());
            
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipment.label', default: 'Equipment'), params.ids])
        map.result=true;
        map.message=flash.message;
        render map as JSON;
    }
    def importExel(){
        def map=[:];
        def file = request.getFile('file');
        if(file ||!file?.empty) {  //file.originalFilename
            try{
                def dp=BaseDepartment.findByName('101');
                new ExcelReadBuilder(2003,file.bytes).eachLine([sheet:'sheet1',labels:true]) {
                    if(it.rowNum>0){
                        def name=cell(1)?.toString()?.trim();
                        if(name ){
                            def ec=EquipmentCatagory.findByName(cell(2).toString().trim());
                            def st=Standard.findByName(cell(2).toString().trim()+"标准");

                            if(ec&&st){
                                def eq=new Equipment(name:name,alias: name,code:cell(3).toString(),equipmentCatagory:ec,standard: st,creater:springSecurityService.currentUser,
                                        belongDepartment: dp,inDepartment:dp,country: '中国',techState:'完好',serviceState:'在用',feature:'主体设备',operationDate:new Date()
                                );
                                eq.save(flush: true);
                                println eq.errors.allErrors
                            }

                        }

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
        render "${(map as JSON).toString()}";
    }

    //项目部角色 下属设备
    def projectList(){
        params.max = Math.min(params.max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max
        return []
    }
    def projectListJson(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def currentUser=BaseUser.get(springSecurityService.currentUser.id)
        def departments=BaseDepartment.findAllByParent(currentUser.baseDepartment);
        if(!departments){departments=[]}
        //departments<<currentUser.baseDepartment;
        def allCount=Equipment.createCriteria().count{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
            'in'('baseDepartment',departments)
        }
        def allList=BaseUser.createCriteria().list{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
            'in'('baseDepartment',departments)
            order(params.sort,params.order)
            maxResults(params.max.toInteger())
            firstResult(params.offset.toInteger())
        }
        def map=[:];
        map.total=allCount;
        map.rows=allList;
        render map as JSON;
    }

    //队长角色 下属设备
    def teamList(){
        params.max = Math.min(params.max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max
        return []
    }
    def teamListJson(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def currentUser=BaseUser.get(springSecurityService.currentUser.id)
        def allCount=Equipment.createCriteria().count{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
            eq('baseDepartment',currentUser.baseDepartment)
        }
        def allList=BaseUser.createCriteria().list{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
            eq('baseDepartment',currentUser.baseDepartment)
            order(params.sort,params.order)
            maxResults(params.max.toInteger())
            firstResult(params.offset.toInteger())
        }
        def map=[:];
        map.total=allCount;
        map.rows=allList;
        render map as JSON;
    }
}
