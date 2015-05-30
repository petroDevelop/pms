package com.petrodata.pms.core

import org.springframework.dao.DataIntegrityViolationException
import com.petrodata.poi.ExcelReadBuilder
import grails.converters.JSON


class BaseRoleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE","GET","POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max
        //[baseRoleInstanceList: BaseRole.list(params), baseRoleInstanceTotal: BaseRole.count()]
        return []
    }
    def json(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def allCount=BaseRole.createCriteria().count{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
        }
        def allList=BaseRole.createCriteria().list{
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
    def create() {
        [baseRoleInstance: new BaseRole(params)]
    }

    def save() {
        def baseRoleInstance = new BaseRole(params)
        baseRoleInstance.id = baseRoleInstance.name
        if (!baseRoleInstance.save(flush: true)) {
            render(view: "create", model: [baseRoleInstance: baseRoleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'baseRole.label', default: 'BaseRole'), baseRoleInstance.id])
        redirect(action: "list", id: baseRoleInstance.id)
    }

    def show(String id) {
        def baseRoleInstance = BaseRole.get(id)
        if (!baseRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseRole.label', default: 'BaseRole'), id])
            redirect(action: "list")
            return
        }

        [baseRoleInstance: baseRoleInstance]
    }

    def edit(String id) {
        def baseRoleInstance = BaseRole.get(id)
        if (!baseRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseRole.label', default: 'BaseRole'), id])
            redirect(action: "list")
            return
        }

        [baseRoleInstance: baseRoleInstance]
    }

    def update(String id, Long version) {
        def baseRoleInstance = BaseRole.get(id)
        if (!baseRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseRole.label', default: 'BaseRole'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (baseRoleInstance.version > version) {
                    baseRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'baseRole.label', default: 'BaseRole')] as Object[],
                            "Another user has updated this BaseRole while you were editing")
                render(view: "edit", model: [baseRoleInstance: baseRoleInstance])
                return
            }
        }

        baseRoleInstance.properties = params

        if (!baseRoleInstance.save(flush: true)) {
            render(view: "edit", model: [baseRoleInstance: baseRoleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'baseRole.label', default: 'BaseRole'), baseRoleInstance.id])
        redirect(action: "list", id: baseRoleInstance.id)
    }

    def delete(String id) {
        def baseRoleInstance = BaseRole.get(id)
        if (!baseRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseRole.label', default: 'BaseRole'), id])
            redirect(action: "list")
            return
        }

        try {
            baseRoleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'baseRole.label', default: 'BaseRole'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'baseRole.label', default: 'BaseRole'), id])
            redirect(action: "show", id: id)
        }
    }
    def deleteAll ={
        def map=[:]
        def list=params.ids.tokenize(',');
        list.each{
            
                def oneInstance=BaseRole.get(it);
                
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'baseRole.label', default: 'BaseRole'), params.ids])
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
