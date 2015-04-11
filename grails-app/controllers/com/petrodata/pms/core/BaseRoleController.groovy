package com.petrodata.pms.core

import org.springframework.dao.DataIntegrityViolationException

class BaseRoleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE", "GET", "POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [baseRoleInstanceList: BaseRole.list(params), baseRoleInstanceTotal: BaseRole.count()]
    }

    def create() {
        [baseRoleInstance: new BaseRole(params)]
    }

    def save() {
        def baseRoleInstance = new BaseRole(params)
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
    def deleteAll = {
        def ids = request.getParameterValues("ids")
        ids.each {

            def oneInstance = BaseRole.get(it);

            oneInstance.delete(flush: true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'baseRole.label', default: 'BaseRole'), ids])
        redirect action: "index"
    }
}
