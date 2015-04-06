package com.petrodata.pms.core

import org.springframework.dao.DataIntegrityViolationException

class BaseUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE","GET","POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [baseUserInstanceList: BaseUser.list(params), baseUserInstanceTotal: BaseUser.count()]
    }

    def create() {
        [baseUserInstance: new BaseUser(params)]
    }

    def save() {
        def baseUserInstance = new BaseUser(params)
        if (!baseUserInstance.save(flush: true)) {
            render(view: "create", model: [baseUserInstance: baseUserInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), baseUserInstance.id])
        redirect(action: "list", id: baseUserInstance.id)
    }

    def show(String id) {
        def baseUserInstance = BaseUser.get(id)
        if (!baseUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), id])
            redirect(action: "list")
            return
        }

        [baseUserInstance: baseUserInstance]
    }

    def edit(String id) {
        def baseUserInstance = BaseUser.get(id)
        if (!baseUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), id])
            redirect(action: "list")
            return
        }

        [baseUserInstance: baseUserInstance]
    }

    def update(String id, Long version) {
        def baseUserInstance = BaseUser.get(id)
        if (!baseUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (baseUserInstance.version > version) {
                    baseUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'baseUser.label', default: 'BaseUser')] as Object[],
                            "Another user has updated this BaseUser while you were editing")
                render(view: "edit", model: [baseUserInstance: baseUserInstance])
                return
            }
        }

        baseUserInstance.properties = params

        if (!baseUserInstance.save(flush: true)) {
            render(view: "edit", model: [baseUserInstance: baseUserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), baseUserInstance.id])
        redirect(action: "list", id: baseUserInstance.id)
    }

    def delete(String id) {
        def baseUserInstance = BaseUser.get(id)
        if (!baseUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), id])
            redirect(action: "list")
            return
        }

        try {
            baseUserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), id])
            redirect(action: "show", id: id)
        }
    }
    def deleteAll ={
        def ids=request.getParameterValues("ids")
        ids.each{
            
                def oneInstance=BaseUser.get(it);
                
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'baseUser.label', default: 'BaseUser'), ids])
        redirect action:"index"
    }
}
