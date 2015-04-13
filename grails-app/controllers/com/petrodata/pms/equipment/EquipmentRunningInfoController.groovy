package com.petrodata.pms.equipment

import org.springframework.dao.DataIntegrityViolationException

class EquipmentRunningInfoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE", "GET", "POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [equipmentRunningInfoInstanceList: EquipmentRunningInfo.list(params), equipmentRunningInfoInstanceTotal: EquipmentRunningInfo.count()]
    }

    def create() {
        [equipmentRunningInfoInstance: new EquipmentRunningInfo(params)]
    }

    def save() {
        def equipmentRunningInfoInstance = new EquipmentRunningInfo(params)
        if (!equipmentRunningInfoInstance.save(flush: true)) {
            render(view: "create", model: [equipmentRunningInfoInstance: equipmentRunningInfoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), equipmentRunningInfoInstance.id])
        redirect(action: "list", id: equipmentRunningInfoInstance.id)
    }

    def show(Long id) {
        def equipmentRunningInfoInstance = EquipmentRunningInfo.get(id)
        if (!equipmentRunningInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), id])
            redirect(action: "list")
            return
        }

        [equipmentRunningInfoInstance: equipmentRunningInfoInstance]
    }

    def edit(Long id) {
        def equipmentRunningInfoInstance = EquipmentRunningInfo.get(id)
        if (!equipmentRunningInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), id])
            redirect(action: "list")
            return
        }

        [equipmentRunningInfoInstance: equipmentRunningInfoInstance]
    }

    def update(Long id, Long version) {
        def equipmentRunningInfoInstance = EquipmentRunningInfo.get(id)
        if (!equipmentRunningInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (equipmentRunningInfoInstance.version > version) {
                equipmentRunningInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo')] as Object[],
                        "Another user has updated this EquipmentRunningInfo while you were editing")
                render(view: "edit", model: [equipmentRunningInfoInstance: equipmentRunningInfoInstance])
                return
            }
        }

        equipmentRunningInfoInstance.properties = params

        if (!equipmentRunningInfoInstance.save(flush: true)) {
            render(view: "edit", model: [equipmentRunningInfoInstance: equipmentRunningInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), equipmentRunningInfoInstance.id])
        redirect(action: "list", id: equipmentRunningInfoInstance.id)
    }

    def delete(Long id) {
        def equipmentRunningInfoInstance = EquipmentRunningInfo.get(id)
        if (!equipmentRunningInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), id])
            redirect(action: "list")
            return
        }

        try {
            equipmentRunningInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), id])
            redirect(action: "show", id: id)
        }
    }
    def deleteAll = {
        def ids = request.getParameterValues("ids")
        ids.each {

            def oneInstance = EquipmentRunningInfo.get(it.toLong());

            oneInstance.delete(flush: true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo'), ids])
        redirect action: "index"
    }
}
