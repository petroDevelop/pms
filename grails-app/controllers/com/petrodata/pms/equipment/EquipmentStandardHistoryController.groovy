package com.petrodata.pms.equipment


import org.springframework.dao.DataIntegrityViolationException
import com.petrodata.poi.ExcelReadBuilder
import grails.converters.JSON


class EquipmentStandardHistoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE","GET","POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max
        //[equipmentStandardHistoryInstanceList: EquipmentStandardHistory.list(params), equipmentStandardHistoryInstanceTotal: EquipmentStandardHistory.count()]
        return []
    }
    def json(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def allCount=EquipmentStandardHistory.createCriteria().count{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
        }
        def allList=EquipmentStandardHistory.createCriteria().list{
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
        render (map as JSON).toString();
    }
    def save() {
        def equipmentStandardHistoryInstance = new EquipmentStandardHistory(params)
        if (!equipmentStandardHistoryInstance.save(flush: true)) {
            map.result=false;
            //@todo
            map.message=equipmentStandardHistoryInstance.errors.allErrors.toString();
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), equipmentStandardHistoryInstance.id])
        map.result=true;
        map.message=flash.message;
        return map;
    }
    def update(Long id, Long version) {
        def equipmentStandardHistoryInstance = EquipmentStandardHistory.get(id)
        if (!equipmentStandardHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), id])
            map.result=false;
            map.message=flash.message;
        }
        if (version != null) {
            if (equipmentStandardHistoryInstance.version > version) {
                    equipmentStandardHistoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory')] as Object[],
                            "Another user has updated this EquipmentStandardHistory while you were editing")
                map.result=false;
                map.message=equipmentStandardHistoryInstance.errors.allErrors.toString();
            }
        }
        equipmentStandardHistoryInstance.properties = params

        if (!equipmentStandardHistoryInstance.save(flush: true)) {
            map.result=false;
            map.message=equipmentStandardHistoryInstance.errors.allErrors.toString();
        }
        flash.message = message(code: 'default.updated.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), equipmentStandardHistoryInstance.id])
        map.result=true;
        map.message=flash.message;
        return map;
    }

    def delete(Long id) {
        def equipmentStandardHistoryInstance = EquipmentStandardHistory.get(id)
        if (!equipmentStandardHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), id])
            map.result=false;
            map.message=flash.message;
        }
        try {
            equipmentStandardHistoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), id])
            map.result=true;
            map.message=flash.message;
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), id])
            map.result=false;
            map.message=flash.message;
        }
        render map as JSON;
    }
    def deleteAll ={
        def map=[:]
        def list=params.ids.tokenize(',');
        list.each{
            
                def oneInstance=EquipmentStandardHistory.get(it.toLong());
            
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), params.ids])
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
        render((map as JSON).toString());
    }
}
