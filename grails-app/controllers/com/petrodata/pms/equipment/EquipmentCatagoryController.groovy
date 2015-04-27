package com.petrodata.pms.equipment

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class EquipmentCatagoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE", "GET", "POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [equipmentCatagoryInstanceList: EquipmentCatagory.list(params), equipmentCatagoryInstanceTotal: EquipmentCatagory.count()]
    }
    def json(){
        println params
        //
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def ecCount=EquipmentCatagory.createCriteria().count{
            if(params.search){
              ilike('name',"%${params.search}%");
            }
        }
        def ecList=EquipmentCatagory.createCriteria().list{
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
        [equipmentCatagoryInstance: new EquipmentCatagory(params)]
    }

    def save() {
        def equipmentCatagoryInstance = new EquipmentCatagory(params)
        if (!equipmentCatagoryInstance.save(flush: true)) {
            render(view: "create", model: [equipmentCatagoryInstance: equipmentCatagoryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), equipmentCatagoryInstance.id])
        redirect(action: "list", id: equipmentCatagoryInstance.id)
    }

    def show(Long id) {
        def equipmentCatagoryInstance = EquipmentCatagory.get(id)
        if (!equipmentCatagoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), id])
            redirect(action: "list")
            return
        }

        [equipmentCatagoryInstance: equipmentCatagoryInstance]
    }

    def edit(Long id) {
        def equipmentCatagoryInstance = EquipmentCatagory.get(id)
        if (!equipmentCatagoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), id])
            redirect(action: "list")
            return
        }

        [equipmentCatagoryInstance: equipmentCatagoryInstance]
    }

    def update(Long id, Long version) {
        def equipmentCatagoryInstance = EquipmentCatagory.get(id)
        if (!equipmentCatagoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (equipmentCatagoryInstance.version > version) {
                equipmentCatagoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory')] as Object[],
                        "Another user has updated this EquipmentCatagory while you were editing")
                render(view: "edit", model: [equipmentCatagoryInstance: equipmentCatagoryInstance])
                return
            }
        }

        equipmentCatagoryInstance.properties = params

        if (!equipmentCatagoryInstance.save(flush: true)) {
            render(view: "edit", model: [equipmentCatagoryInstance: equipmentCatagoryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), equipmentCatagoryInstance.id])
        redirect(action: "list", id: equipmentCatagoryInstance.id)
    }

    def delete(Long id) {
        def equipmentCatagoryInstance = EquipmentCatagory.get(id)
        if (!equipmentCatagoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), id])
            redirect(action: "list")
            return
        }

        try {
            equipmentCatagoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), id])
            redirect(action: "show", id: id)
        }
    }
    def deleteAll = {
        def ids = request.getParameterValues("ids")
        ids.each {

            def oneInstance = EquipmentCatagory.get(it.toLong());

            oneInstance.delete(flush: true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory'), ids])
        redirect action: "index"
    }
}
