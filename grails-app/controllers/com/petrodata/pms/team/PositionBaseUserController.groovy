package com.petrodata.pms.team

import com.petrodata.pms.core.BaseUser
import org.springframework.dao.DataIntegrityViolationException
import com.petrodata.poi.ExcelReadBuilder
import grails.converters.JSON


class PositionBaseUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE", "GET", "POST"]]

    def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit = params.max
        //[positionBaseUserInstanceList: PositionBaseUser.list(params), positionBaseUserInstanceTotal: PositionBaseUser.count()]
        return []
    }

    def json() {
        BaseUser loginUser = springSecurityService.getCurrentUser();
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit = params.max;
        if (!params.offset) params.offset = '0'
        if (!params.sort) params.sort = 'id'
        if (!params.order) params.order = 'desc'
        def list=BaseUser.findAllByBaseDepartmentAndIdNotEqual(loginUser?.baseDepartment,loginUser.id);
        def allCount = PositionBaseUser.createCriteria().count {
            createAlias("baseUser","bu")
            createAlias("bu.baseDepartment","bd")
            eq("bd.id",loginUser.baseDepartment.id)
            'in'("bu.id",list.collect{it.id})
            if (params.search) {
                ilike('bu.username', "%${params.search}%");
            }
        }

        def allList = PositionBaseUser.createCriteria().list {
            createAlias("baseUser","bu")
            createAlias("bu.baseDepartment","bd")
            eq("bd.id",loginUser.baseDepartment.id)
            'in'("bu.id",list.collect{it.id})
            if (params.search) {
                ilike('bu.username', "%${params.search}%");
            }
            order(params.sort, params.order)
            maxResults(params.max.toInteger())
            firstResult(params.offset.toInteger())
        }
        def map = [:];
        map.total = allCount;
        map.rows = allList;
        render map as JSON;
    }

    def create() {
        [positionBaseUserInstance: new PositionBaseUser(params)]
    }

    def save() {
        def positionBaseUserInstance = new PositionBaseUser(params)
        if (!positionBaseUserInstance.save(flush: true)) {
            render(view: "create", model: [positionBaseUserInstance: positionBaseUserInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'positionBaseUser.label', default: 'PositionBaseUser'), positionBaseUserInstance.id])
        redirect(action: "list", id: positionBaseUserInstance.id)
    }

    def show(Long id) {
        def positionBaseUserInstance = PositionBaseUser.get(id)
        if (!positionBaseUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'positionBaseUser.label', default: 'PositionBaseUser'), id])
            redirect(action: "list")
            return
        }

        [positionBaseUserInstance: positionBaseUserInstance]
    }

    def edit(Long id) {
        def positionBaseUserInstance = PositionBaseUser.get(id)
        if (!positionBaseUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'positionBaseUser.label', default: 'PositionBaseUser'), id])
            redirect(action: "list")
            return
        }

        [positionBaseUserInstance: positionBaseUserInstance]
    }

    def update(Long id, Long version) {
        def positionBaseUserInstance = PositionBaseUser.get(id)
        if (!positionBaseUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'positionBaseUser.label', default: 'PositionBaseUser'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (positionBaseUserInstance.version > version) {
                positionBaseUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'positionBaseUser.label', default: 'PositionBaseUser')] as Object[],
                        "Another user has updated this PositionBaseUser while you were editing")
                render(view: "edit", model: [positionBaseUserInstance: positionBaseUserInstance])
                return
            }
        }

        positionBaseUserInstance.properties = params

        if (!positionBaseUserInstance.save(flush: true)) {
            render(view: "edit", model: [positionBaseUserInstance: positionBaseUserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'positionBaseUser.label', default: 'PositionBaseUser'), positionBaseUserInstance.id])
        redirect(action: "list", id: positionBaseUserInstance.id)
    }

    def delete(Long id) {
        def positionBaseUserInstance = PositionBaseUser.get(id)
        if (!positionBaseUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'positionBaseUser.label', default: 'PositionBaseUser'), id])
            redirect(action: "list")
            return
        }

        try {
            positionBaseUserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'positionBaseUser.label', default: 'PositionBaseUser'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'positionBaseUser.label', default: 'PositionBaseUser'), id])
            redirect(action: "show", id: id)
        }
    }
    def deleteAll = {
        def map = [:]
        def list = params.ids.tokenize(',');
        list.each {

            def oneInstance = PositionBaseUser.get(it.toLong());

            oneInstance.delete(flush: true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'positionBaseUser.label', default: 'PositionBaseUser'), params.ids])
        map.result = true;
        map.message = flash.message;
        render map as JSON;
    }

    def importExel() {
        def map = [:];
        def file = request.getFile('file');
        if (file || !file?.empty) {  //file.originalFilename
            try {
                new ExcelReadBuilder(2003, file.bytes).eachLine([sheet: 'sheet1', labels: true]) {
                    println "${it.rowNum},${cell[0]},${cell[1]},${cell[2]},${cell[3]}......"
                }
                map.result = true;
            } catch (e) {
                map.result = false;
                map.message = e.message;
            }
        } else {
            map.result = false;
            map.message = "file is empty!";
        }
        render((map as JSON).toString());
    }

    def userList = {
        def loginUser = springSecurityService.getCurrentUser();
        def list = BaseUser.findAllByBaseDepartment(loginUser.baseDepartment);
        return list;
    }
}
