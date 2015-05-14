package com.petrodata.pms.equipment


import org.springframework.dao.DataIntegrityViolationException
import com.petrodata.poi.ExcelReadBuilder
import grails.converters.JSON


class EquipmentRunningInfoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE","GET","POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max
        //[equipmentRunningInfoInstanceList: EquipmentRunningInfo.list(params), equipmentRunningInfoInstanceTotal: EquipmentRunningInfo.count()]
        return []
    }
    def json(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def allCount=EquipmentRunningInfo.createCriteria().count{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
        }
        def allList=EquipmentRunningInfo.createCriteria().list{
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
        def map=[:];
        if(!params.version){
            params.version=0l;
        }
        if(!params.id){
            map=this.save();
        }else{
            map=this.update(params.id?.toLong(),params.version?.toLong()?:0);
        }
        render "${(map as JSON).toString()}";
    }
    def save() {
        def map=[:]
        def equipmentRunningInfoInstance = new EquipmentRunningInfo(params)
        if (!equipmentRunningInfoInstance.save(flush: true)) {
            map.result=false;
            //@todo
            map.message=equipmentRunningInfoInstance.errors.allErrors.toString();
        }else{
            flash.message = message(code: 'default.created.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), equipmentRunningInfoInstance.id])
            map.result=true;
            map.message=flash.message;
        }

        return map;
    }
    def update(Long id, Long version) {
        def map=[:]
        def equipmentRunningInfoInstance = EquipmentRunningInfo.get(id)
        if (!equipmentRunningInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), id])
            map.result=false;
            map.message=flash.message;
        }
        if (version != null) {
            if (equipmentRunningInfoInstance.version > version) {
                    equipmentRunningInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo')] as Object[],
                            "Another user has updated this EquipmentRunningInfo while you were editing")
                map.result=false;
                map.message=equipmentRunningInfoInstance.errors.allErrors.toString();
            }
        }
        equipmentRunningInfoInstance.properties = params

        if (!equipmentRunningInfoInstance.save(flush: true)) {
            map.result=false;
            map.message=equipmentRunningInfoInstance.errors.allErrors.toString();
        }else{
            flash.message = message(code: 'default.updated.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), equipmentRunningInfoInstance.id])
            map.result=true;
            map.message=flash.message;
        }

        return map;
    }

    def delete(Long id) {
        def map=[:]
        def equipmentRunningInfoInstance = EquipmentRunningInfo.get(id)
        if (!equipmentRunningInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), id])
            map.result=false;
            map.message=flash.message;
        }
        try {
            equipmentRunningInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), id])
            map.result=true;
            map.message=flash.message;
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), id])
            map.result=false;
            map.message=flash.message;
        }
        render map as JSON;
    }

    def deleteAll ={
        def map=[:]
        def list=params.ids.tokenize(',');
        list.each{
            
                def oneInstance=EquipmentRunningInfo.get(it.toLong());
            
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), params.ids])
        map.result=true;
        map.message=flash.message;
        render map as JSON;
    }
    def importExel(){
        def map=[:];
        def file = request.getFile('file');
        if(file ||!file?.empty) {  //file.originalFilename
            try{
                new ExcelReadBuilder(2003,file.bytes).eachLine([sheet:'sheet1',labels:true]) {
                   println "${it.rowNum},${cell[0]},${cell[1]},${cell[2]},${cell[3]}......"
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
}
