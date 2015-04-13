package com.petrodata.pms.equipment

import org.springframework.dao.DataIntegrityViolationException

class EquipmentStandardHistoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE", "GET", "POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [equipmentStandardHistoryInstanceList: EquipmentStandardHistory.list(params), equipmentStandardHistoryInstanceTotal: EquipmentStandardHistory.count()]
    }

    def create() {
        [equipmentStandardHistoryInstance: new EquipmentStandardHistory(params)]
    }

    def save() {
        def equipmentStandardHistoryInstance = new EquipmentStandardHistory(params)
        if (!equipmentStandardHistoryInstance.save(flush: true)) {
            render(view: "create", model: [equipmentStandardHistoryInstance: equipmentStandardHistoryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), equipmentStandardHistoryInstance.id])
        redirect(action: "list", id: equipmentStandardHistoryInstance.id)
    }

    def show(Long id) {
        def equipmentStandardHistoryInstance = EquipmentStandardHistory.get(id)
        if (!equipmentStandardHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), id])
            redirect(action: "list")
            return
        }

        [equipmentStandardHistoryInstance: equipmentStandardHistoryInstance]
    }

    def edit(Long id) {
        def equipmentStandardHistoryInstance = EquipmentStandardHistory.get(id)
        if (!equipmentStandardHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), id])
            redirect(action: "list")
            return
        }

        [equipmentStandardHistoryInstance: equipmentStandardHistoryInstance]
    }

    def update(Long id, Long version) {
        def equipmentStandardHistoryInstance = EquipmentStandardHistory.get(id)
        if (!equipmentStandardHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (equipmentStandardHistoryInstance.version > version) {
                equipmentStandardHistoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory')] as Object[],
                        "Another user has updated this EquipmentStandardHistory while you were editing")
                render(view: "edit", model: [equipmentStandardHistoryInstance: equipmentStandardHistoryInstance])
                return
            }
        }

        equipmentStandardHistoryInstance.properties = params

        if (!equipmentStandardHistoryInstance.save(flush: true)) {
            render(view: "edit", model: [equipmentStandardHistoryInstance: equipmentStandardHistoryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), equipmentStandardHistoryInstance.id])
        redirect(action: "list", id: equipmentStandardHistoryInstance.id)
    }

    def delete(Long id) {
        def equipmentStandardHistoryInstance = EquipmentStandardHistory.get(id)
        if (!equipmentStandardHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), id])
            redirect(action: "list")
            return
        }

        try {
            equipmentStandardHistoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), id])
            redirect(action: "show", id: id)
        }
    }
    def deleteAll = {
        def ids = request.getParameterValues("ids")
        ids.each {

            def oneInstance = EquipmentStandardHistory.get(it.toLong());

            oneInstance.delete(flush: true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory'), ids])
        redirect action: "index"
    }
}
