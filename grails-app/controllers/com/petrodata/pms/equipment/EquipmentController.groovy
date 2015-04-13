package com.petrodata.pms.equipment

import org.springframework.dao.DataIntegrityViolationException

class EquipmentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE","GET","POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [equipmentInstanceList: Equipment.list(params), equipmentInstanceTotal: Equipment.count()]
    }

    def create() {
        [equipmentInstance: new Equipment(params)]
    }

    def save() {
        def equipmentInstance = new Equipment(params)
        if (!equipmentInstance.save(flush: true)) {
            render(view: "create", model: [equipmentInstance: equipmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'equipment.label', default: 'Equipment'), equipmentInstance.id])
        redirect(action: "list", id: equipmentInstance.id)
    }

    def show(Long id) {
        def equipmentInstance = Equipment.get(id)
        if (!equipmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipment.label', default: 'Equipment'), id])
            redirect(action: "list")
            return
        }

        [equipmentInstance: equipmentInstance]
    }

    def edit(Long id) {
        def equipmentInstance = Equipment.get(id)
        if (!equipmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipment.label', default: 'Equipment'), id])
            redirect(action: "list")
            return
        }

        [equipmentInstance: equipmentInstance]
    }

    def update(Long id, Long version) {
        def equipmentInstance = Equipment.get(id)
        if (!equipmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipment.label', default: 'Equipment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (equipmentInstance.version > version) {
                    equipmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'equipment.label', default: 'Equipment')] as Object[],
                            "Another user has updated this Equipment while you were editing")
                render(view: "edit", model: [equipmentInstance: equipmentInstance])
                return
            }
        }

        equipmentInstance.properties = params

        if (!equipmentInstance.save(flush: true)) {
            render(view: "edit", model: [equipmentInstance: equipmentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'equipment.label', default: 'Equipment'), equipmentInstance.id])
        redirect(action: "list", id: equipmentInstance.id)
    }

    def delete(Long id) {
        def equipmentInstance = Equipment.get(id)
        if (!equipmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipment.label', default: 'Equipment'), id])
            redirect(action: "list")
            return
        }

        try {
            equipmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipment.label', default: 'Equipment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'equipment.label', default: 'Equipment'), id])
            redirect(action: "show", id: id)
        }
    }
    def deleteAll ={
        def ids=request.getParameterValues("ids")
        ids.each{
            
                def oneInstance=Equipment.get(it.toLong());
            
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipment.label', default: 'Equipment'), ids])
        redirect action:"index"
    }
}
