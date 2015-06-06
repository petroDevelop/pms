package com.petrodata.pms.core

import org.springframework.dao.DataIntegrityViolationException
import com.petrodata.poi.ExcelReadBuilder
import grails.converters.JSON


class BaseDepartmentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE","GET","POST"]]
    def springSecurityService
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max
        //[baseDepartmentInstanceList: BaseDepartment.list(params), baseDepartmentInstanceTotal: BaseDepartment.count()]
        return []
    }
    def json(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def allCount=BaseDepartment.createCriteria().count{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
        }
        def allList=BaseDepartment.createCriteria().list{
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
        [baseDepartmentInstance: new BaseDepartment(params)]
    }

    def save() {
        def baseDepartmentInstance = new BaseDepartment(params)
        if (!baseDepartmentInstance.save(flush: true)) {
            render(view: "create", model: [baseDepartmentInstance: baseDepartmentInstance,from:params.from])
            return
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), baseDepartmentInstance.id])
        redirect(action: params.from?:"list", id: baseDepartmentInstance.id)
    }

    def show(Long id) {
        def baseDepartmentInstance = BaseDepartment.get(id)
        if (!baseDepartmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), id])
            redirect(action: params.from?:"list")
            return
        }

        [baseDepartmentInstance: baseDepartmentInstance]
    }

    def edit(Long id) {
        def baseDepartmentInstance = BaseDepartment.get(id)
        if (!baseDepartmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), id])
            redirect(action: params.from?:"list")
            return
        }

        [baseDepartmentInstance: baseDepartmentInstance]
    }

    def update(Long id, Long version) {
        def baseDepartmentInstance = BaseDepartment.get(id)
        if (!baseDepartmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), id])
            redirect(action: params.from?:"list")
            return
        }

        if (version != null) {
            if (baseDepartmentInstance.version > version) {
                    baseDepartmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'baseDepartment.label', default: 'BaseDepartment')] as Object[],
                            "Another user has updated this BaseDepartment while you were editing")
                render(view: "edit", model: [baseDepartmentInstance: baseDepartmentInstance,from:params.from])
                return
            }
        }

        baseDepartmentInstance.properties = params

        if (!baseDepartmentInstance.save(flush: true)) {
            render(view: "edit", model: [baseDepartmentInstance: baseDepartmentInstance,from:params.from])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), baseDepartmentInstance.id])
        redirect(action: params.from?:"list", id: baseDepartmentInstance.id)
    }

    def delete(Long id) {
        def baseDepartmentInstance = BaseDepartment.get(id)
        if (!baseDepartmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), id])
            redirect(action: params.from?:"list")
            return
        }

        try {
            baseDepartmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), id])
            redirect(action: params.from?:"list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), id])
            redirect(action: "show", id: id,params:[from:params.from])
        }
    }
    def deleteAll ={
        def map=[:]
        def list=params.ids.tokenize(',');
        list.each{
            def oneInstance=BaseDepartment.get(it.toLong());
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), params.ids])
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


    //设备处角色的 项目部管理菜单
    def projectList(){
        params.max = Math.min(params.max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max
        //[baseDepartmentInstanceList: BaseDepartment.list(params), baseDepartmentInstanceTotal: BaseDepartment.count()]
        return []
    }
    def projectJson(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def allCount=BaseDepartment.createCriteria().count{
            eq('type','项目部节点')
            if(params.search){
                ilike('name',"%${params.search}%");
            }
        }
        def allList=BaseDepartment.createCriteria().list{
            eq('type','项目部节点')
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

    //设备处角色的 小队管理菜单
    def teamList(){
        params.max = Math.min(params.max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max
        //[baseDepartmentInstanceList: BaseDepartment.list(params), baseDepartmentInstanceTotal: BaseDepartment.count()]
        return []
    }
    def teamJson(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def allCount=BaseDepartment.createCriteria().count{
            eq('type','小队节点')
            if(params.search){
                ilike('name',"%${params.search}%");
            }
        }
        def allList=BaseDepartment.createCriteria().list{
            eq('type','小队节点')
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
    //项目部角色 下属小队
    def underTeamList={
        params.max = Math.min(params.max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max
        //[baseDepartmentInstanceList: BaseDepartment.list(params), baseDepartmentInstanceTotal: BaseDepartment.count()]
        return []
    }
    def underTeamJson={
        def currentUser=BaseUser.get(springSecurityService.currentUser.id)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def allCount=BaseDepartment.createCriteria().count{
            eq('type','小队节点')
            eq('parent',currentUser.baseDepartment)
            if(params.search){
                ilike('name',"%${params.search}%");
            }
        }
        def allList=BaseDepartment.createCriteria().list{
            eq('type','小队节点')
            eq('parent',currentUser.baseDepartment)
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
}
