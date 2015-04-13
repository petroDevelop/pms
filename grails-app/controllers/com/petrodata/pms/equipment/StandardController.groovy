package com.petrodata.pms.equipment

import org.springframework.dao.DataIntegrityViolationException

class StandardController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE", "GET", "POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [standardInstanceList: Standard.list(params), standardInstanceTotal: Standard.count()]
    }

    def create() {
        [standardInstance: new Standard(params)]
    }

    def save() {
        def standardInstance = new Standard(params)
        if (!standardInstance.save(flush: true)) {
            render(view: "create", model: [standardInstance: standardInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'standard.label', default: 'Standard'), standardInstance.id])
        redirect(action: "list", id: standardInstance.id)
    }

    def show(Long id) {
        def standardInstance = Standard.get(id)
        if (!standardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'standard.label', default: 'Standard'), id])
            redirect(action: "list")
            return
        }

        [standardInstance: standardInstance]
    }

    def edit(Long id) {
        def standardInstance = Standard.get(id)
        if (!standardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'standard.label', default: 'Standard'), id])
            redirect(action: "list")
            return
        }

        [standardInstance: standardInstance]
    }

    def update(Long id, Long version) {
        def standardInstance = Standard.get(id)
        if (!standardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'standard.label', default: 'Standard'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (standardInstance.version > version) {
                standardInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'standard.label', default: 'Standard')] as Object[],
                        "Another user has updated this Standard while you were editing")
                render(view: "edit", model: [standardInstance: standardInstance])
                return
            }
        }

        standardInstance.properties = params

        if (!standardInstance.save(flush: true)) {
            render(view: "edit", model: [standardInstance: standardInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'standard.label', default: 'Standard'), standardInstance.id])
        redirect(action: "list", id: standardInstance.id)
    }

    def delete(Long id) {
        def standardInstance = Standard.get(id)
        if (!standardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'standard.label', default: 'Standard'), id])
            redirect(action: "list")
            return
        }

        try {
            standardInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'standard.label', default: 'Standard'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'standard.label', default: 'Standard'), id])
            redirect(action: "show", id: id)
        }
    }
    def deleteAll = {
        def ids = request.getParameterValues("ids")
        ids.each {

            def oneInstance = Standard.get(it.toLong());

            oneInstance.delete(flush: true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'standard.label', default: 'Standard'), ids])
        redirect action: "index"
    }
}
