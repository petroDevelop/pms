package com.petrodata.pms.team

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class PositionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE","GET","POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        //[positionInstanceList: Position.list(params), positionInstanceTotal: Position.count()]
        return []
    }

    def json(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def ecCount=Position.createCriteria().count{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
        }
        def ecList=Position.createCriteria().list{
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

    def create() {
        [positionInstance: new Position(params)]
    }

    def save() {
        def pos = Position.findByName(params.name)
        if (!pos) {
            def positionInstance = new Position(params)
            if (!positionInstance.save(flush: true)) {
                render(view: "create", model: [positionInstance: positionInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'position.label', default: 'Position'), positionInstance.id])
            redirect(action: "list", id: positionInstance.id)
        }else{
            flash.message = 'The [' + params.name + '] position exists'
            redirect(action: "list")
        }
    }

    def show(Long id) {
        def positionInstance = Position.get(id)
        if (!positionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'position.label', default: 'Position'), id])
            redirect(action: "list")
            return
        }

        [positionInstance: positionInstance]
    }

    def edit(Long id) {
        def positionInstance = Position.get(id)
        if (!positionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'position.label', default: 'Position'), id])
            redirect(action: "list")
            return
        }

        [positionInstance: positionInstance]
    }

    def update(Long id, Long version) {
        def positionInstance = Position.get(id)
        if (!positionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'position.label', default: 'Position'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (positionInstance.version > version) {
                    positionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'position.label', default: 'Position')] as Object[],
                            "Another user has updated this Position while you were editing")
                render(view: "edit", model: [positionInstance: positionInstance])
                return
            }
        }

        positionInstance.properties = params

        if (!positionInstance.save(flush: true)) {
            render(view: "edit", model: [positionInstance: positionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'position.label', default: 'Position'), positionInstance.id])
        redirect(action: "list", id: positionInstance.id)
    }

    def delete(Long id) {
        def positionInstance = Position.get(id)
        if (!positionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'position.label', default: 'Position'), id])
            redirect(action: "list")
            return
        }

        try {
            positionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'position.label', default: 'Position'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'position.label', default: 'Position'), id])
            redirect(action: "show", id: id)
        }
    }

    def deleteAll ={
        def ids=request.getParameterValues("ids")
        ids.each{
            
                def oneInstance=Position.get(it.toLong());
            
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'position.label', default: 'Position'), ids])
        redirect action:"index"
    }
}
