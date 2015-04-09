package com.petrodata.pms.core

import org.springframework.dao.DataIntegrityViolationException

class BaseDepartmentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE", "GET", "POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [baseDepartmentInstanceList: BaseDepartment.list(params), baseDepartmentInstanceTotal: BaseDepartment.count()]
    }

    def create() {
        [baseDepartmentInstance: new BaseDepartment(params)]
    }

    def save() {
        def baseDepartmentInstance = new BaseDepartment(params)
        if (!baseDepartmentInstance.save(flush: true)) {
            render(view: "create", model: [baseDepartmentInstance: baseDepartmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), baseDepartmentInstance.id])
        redirect(action: "list", id: baseDepartmentInstance.id)
    }

    def show(Long id) {
        def baseDepartmentInstance = BaseDepartment.get(id)
        if (!baseDepartmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), id])
            redirect(action: "list")
            return
        }

        [baseDepartmentInstance: baseDepartmentInstance]
    }

    def edit(Long id) {
        def baseDepartmentInstance = BaseDepartment.get(id)
        if (!baseDepartmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), id])
            redirect(action: "list")
            return
        }

        [baseDepartmentInstance: baseDepartmentInstance]
    }

    def update(Long id, Long version) {
        def baseDepartmentInstance = BaseDepartment.get(id)
        if (!baseDepartmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (baseDepartmentInstance.version > version) {
                baseDepartmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'baseDepartment.label', default: 'BaseDepartment')] as Object[],
                        "Another user has updated this BaseDepartment while you were editing")
                render(view: "edit", model: [baseDepartmentInstance: baseDepartmentInstance])
                return
            }
        }

        baseDepartmentInstance.properties = params

        if (!baseDepartmentInstance.save(flush: true)) {
            render(view: "edit", model: [baseDepartmentInstance: baseDepartmentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), baseDepartmentInstance.id])
        redirect(action: "list", id: baseDepartmentInstance.id)
    }

    def delete(Long id) {
        def baseDepartmentInstance = BaseDepartment.get(id)
        if (!baseDepartmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), id])
            redirect(action: "list")
            return
        }

        try {
            baseDepartmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), id])
            redirect(action: "show", id: id)
        }
    }
    def deleteAll = {
        def ids = request.getParameterValues("ids")
        ids.each {

            def oneInstance = BaseDepartment.get(it.toLong());

            oneInstance.delete(flush: true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'baseDepartment.label', default: 'BaseDepartment'), ids])
        redirect action: "index"
    }
}
