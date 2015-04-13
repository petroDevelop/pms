package com.petrodata.pms.equipment

import org.springframework.dao.DataIntegrityViolationException

class StandardItemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE", "GET", "POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [standardItemInstanceList: StandardItem.list(params), standardItemInstanceTotal: StandardItem.count()]
    }

    def create() {
        [standardItemInstance: new StandardItem(params)]
    }

    def save() {
        def standardItemInstance = new StandardItem(params)
        if (!standardItemInstance.save(flush: true)) {
            render(view: "create", model: [standardItemInstance: standardItemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), standardItemInstance.id])
        redirect(action: "list", id: standardItemInstance.id)
    }

    def show(Long id) {
        def standardItemInstance = StandardItem.get(id)
        if (!standardItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), id])
            redirect(action: "list")
            return
        }

        [standardItemInstance: standardItemInstance]
    }

    def edit(Long id) {
        def standardItemInstance = StandardItem.get(id)
        if (!standardItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), id])
            redirect(action: "list")
            return
        }

        [standardItemInstance: standardItemInstance]
    }

    def update(Long id, Long version) {
        def standardItemInstance = StandardItem.get(id)
        if (!standardItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (standardItemInstance.version > version) {
                standardItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'standardItem.label', default: 'StandardItem')] as Object[],
                        "Another user has updated this StandardItem while you were editing")
                render(view: "edit", model: [standardItemInstance: standardItemInstance])
                return
            }
        }

        standardItemInstance.properties = params

        if (!standardItemInstance.save(flush: true)) {
            render(view: "edit", model: [standardItemInstance: standardItemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), standardItemInstance.id])
        redirect(action: "list", id: standardItemInstance.id)
    }

    def delete(Long id) {
        def standardItemInstance = StandardItem.get(id)
        if (!standardItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), id])
            redirect(action: "list")
            return
        }

        try {
            standardItemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), id])
            redirect(action: "show", id: id)
        }
    }
    def deleteAll = {
        def ids = request.getParameterValues("ids")
        ids.each {

            def oneInstance = StandardItem.get(it.toLong());

            oneInstance.delete(flush: true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'standardItem.label', default: 'StandardItem'), ids])
        redirect action: "index"
    }
}
