package com.petrodata.pms.core

import org.springframework.dao.DataIntegrityViolationException
import com.petrodata.poi.ExcelReadBuilder
import grails.converters.JSON


class BaseUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE","GET","POST"]]
    def springSecurityService
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max
        //[baseUserInstanceList: BaseUser.list(params), baseUserInstanceTotal: BaseUser.count()]
        return []
    }
    def json(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def allCount=BaseUser.createCriteria().count{
            if(params.search){
                ilike('username',"%${params.search}%");
            }
        }
        def allList=BaseUser.createCriteria().list{
            if(params.search){
                ilike('username',"%${params.search}%");
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
        [baseUserInstance: new BaseUser(params)]
    }

    def save() {
        def baseUserInstance = new BaseUser(params)
        if (!baseUserInstance.save(flush: true)) {
            render(view: "create", model: [baseUserInstance: baseUserInstance,from:params.from])
            return
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), baseUserInstance.id])
        redirect(action: params.from?:"list", id: baseUserInstance.id)
    }

    def show(String id) {
        def baseUserInstance = BaseUser.get(id)
        if (!baseUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), id])
            redirect(action: params.from?:"list")
            return
        }

        [baseUserInstance: baseUserInstance]
    }

    def edit(String id) {
        def baseUserInstance = BaseUser.get(id)
        if (!baseUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), id])
            redirect(action: params.from?:"list")
            return
        }

        [baseUserInstance: baseUserInstance]
    }

    def update(String id, Long version) {
        def baseUserInstance = BaseUser.get(id)
        if (!baseUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), id])
            redirect(action: params.from?:"list")
            return
        }

        if (version != null) {
            if (baseUserInstance.version > version) {
                    baseUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'baseUser.label', default: 'BaseUser')] as Object[],
                            "Another user has updated this BaseUser while you were editing")
                render(view: "edit", model: [baseUserInstance: baseUserInstance,from:params.from])
                return
            }
        }

        baseUserInstance.properties = params

        if (!baseUserInstance.save(flush: true)) {
            render(view: "edit", model: [baseUserInstance: baseUserInstance,from:params.from])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), baseUserInstance.id])
        redirect(action: params.from?:"list", id: baseUserInstance.id)
    }

    def delete(String id) {
        def baseUserInstance = BaseUser.get(id)
        if (!baseUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), id])
            redirect(action: params.from?:"list")
            return
        }

        try {
            baseUserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), id])
            redirect(action: params.from?:"list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), id])
            redirect(action: "show", id: id)
        }
    }
    def deleteAll ={
        def map=[:]
        def list=params.ids.tokenize(',');
        list.each{
            
                def oneInstance=BaseUser.get(it);
                
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), params.ids])
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
    //项目部角色 下属人员
    def projectList(){
        params.max = Math.min(params.max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max
        //[baseUserInstanceList: BaseUser.list(params), baseUserInstanceTotal: BaseUser.count()]
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
        departments<<currentUser.baseDepartment;
        def allCount=BaseUser.createCriteria().count{
            if(params.search){
                ilike('username',"%${params.search}%");
            }
            'in'('baseDepartment',departments)
        }
        def allList=BaseUser.createCriteria().list{
            if(params.search){
                ilike('username',"%${params.search}%");
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
}
