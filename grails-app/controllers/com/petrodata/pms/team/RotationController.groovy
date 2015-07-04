package com.petrodata.pms.team

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.core.BaseUser
import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class RotationController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE", "GET", "POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [rotationInstanceList: Rotation.list(params), rotationInstanceTotal: Rotation.count()]
    }

    def json(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100)
        params.limit=params.max
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        BaseUser loginUser = springSecurityService.getCurrentUser();
        def ecCount=Rotation.createCriteria().count{
            baseDepartment{
                eq("id",loginUser.baseDepartment.id)
            }
            if(params.search){
                ilike('name',"%${params.search}%")
            }
        }
        def ecList=Rotation.createCriteria().list{
            baseDepartment{
                eq("id",loginUser.baseDepartment.id)
            }
            if(params.search){
                ilike('name',"%${params.search}%")
            }
            order(params.sort,params.order)
            maxResults(params.max.toInteger())
            firstResult(params.offset.toInteger())
        }
        def map=[:]
        map.total=ecCount
        map.rows=ecList
        render map as JSON
    }

    def create() {
        BaseUser loginUser = springSecurityService?.currentUser;
        Rotation rotation = new Rotation(params);
        rotation.creator = loginUser;
        rotation.baseDepartment = loginUser?.baseDepartment;
        [rotationInstance: rotation]
    }

    def save() {
        //check the same rotation
        def roLt = Rotation.createCriteria().list {
            eq('baseDepartment', BaseDepartment.get(params.baseDepartment.id.toLong()))
        }

        def msg = '', bCreate = true
        if (roLt) {
            def hours = 0
            roLt.each {ro ->
                if (ro.name == params.name) {
                    msg = 'The Rotation exists'
                    bCreate = false
                    return
                }
                hours += ro.hours
            }
            if (hours >= 24) {
                msg = 'The Team has enough rotation'
                bCreate = true
            }
        }

        if (bCreate) {
            def rotationInstance = new Rotation(params)
            if (!rotationInstance.save(flush: true)) {
                render(view: "create", model: [rotationInstance: rotationInstance])
                return
            }
            flash.message = message(code: 'default.created.message', args: [message(code: 'rotation.label', default: 'Rotation'), rotationInstance.id])
            redirect(action: "list", id: rotationInstance.id)
        }else{
            flash.message = msg
            redirect(action: "list")
        }
    }

    def show(Long id) {
        def rotationInstance = Rotation.get(id)
        if (!rotationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rotation.label', default: 'Rotation'), id])
            redirect(action: "list")
            return
        }

        [rotationInstance: rotationInstance]
    }

    def edit(Long id) {
        def rotationInstance = Rotation.get(id)
        print(rotationInstance.baseUsers)
        if (!rotationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rotation.label', default: 'Rotation'), id])
            redirect(action: "list")
            return
        }

        [rotationInstance: rotationInstance]
    }

    def update(Long id, Long version) {
        def rotationInstance = Rotation.get(id)
        if (!rotationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rotation.label', default: 'Rotation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (rotationInstance.version > version) {
                rotationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'rotation.label', default: 'Rotation')] as Object[],
                        "Another user has updated this Rotation while you were editing")
                render(view: "edit", model: [rotationInstance: rotationInstance])
                return
            }
        }

        rotationInstance.properties = params

        if (!rotationInstance.save(flush: true)) {
            render(view: "edit", model: [rotationInstance: rotationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'rotation.label', default: 'Rotation'), rotationInstance.id])
        redirect(action: "list", id: rotationInstance.id)
    }

    def delete(Long id) {
        def rotationInstance = Rotation.get(id)
        if (!rotationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rotation.label', default: 'Rotation'), id])
            redirect(action: "list")
            return
        }

        try {
            rotationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'rotation.label', default: 'Rotation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'rotation.label', default: 'Rotation'), id])
            redirect(action: "show", id: id)
        }
    }

    def deleteAll = {
        def ids = request.getParameterValues("ids")
        ids.each {

            def oneInstance = Rotation.get(it.toLong());

            oneInstance.delete(flush: true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'rotation.label', default: 'Rotation'), ids])
        redirect action: "list"
    }
}
