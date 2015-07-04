package com.petrodata.pms.team

import com.petrodata.pms.equipment.EquipmentCatagory
import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class PositionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE","GET","POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        //[positionInstanceList: Position.list(params), positionInstanceTotal: Position.count()]
        return []
    }

    def json(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def ecCount=Position.createCriteria().count{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
        }
        def ecList=Position.createCriteria().list{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
            order(params.sort,params.order)
            maxResults(params.max.toInteger())
            firstResult(params.offset.toInteger())
        }
        def map=[:];
        def list=[]
        ecList.each{
            def map1=[:]
            map1.id=it.id
            map1.name=it.name;
            map1.eptCatas=it.eptCatas?.collect{it.name}?.join(",")
            list<<map1;
        }
        map.total=ecCount;
        map.rows=list;
        render map as JSON;
    }

    def create() {
        [positionInstance: new Position(params)]
    }

    def save() {
        def pos = Position.findByName(params.name)
        if (!pos) {
            def positionInstance = new Position(params)
            def positionCatas=Position.list()?.collect{it.eptCatas}?.collect{it.id}?.collect {it[0]};
            boolean hasContain=false;
            long containEptcata=0;
            params.eptCatas.collect{it.toLong()}.each{one->
                if(positionCatas.contains(one)){
                    containEptcata=one;
                    hasContain=true;
                }
            }
            if(hasContain){
                flash.message="${EquipmentCatagory.get(containEptcata).name}已分配给其他岗位，请重新选择";
                render(view: "create", model: [positionInstance: positionInstance])
                return
            }

            //positionInstance.name=params.name;
            if (!positionInstance.save(flush: true)) {
                render(view: "create", model: [positionInstance: positionInstance])
                return
            }
            if(params.eptCatas){
                //println params.eptCatas.class.name
            }
            flash.message = message(code: 'default.created.message', args: [message(code: 'position.label', default: 'Position'), positionInstance.id])
            redirect(action: "list", id: positionInstance.id)
        }else{
            flash.message = 'The [' + params.name + '] position exists'
            redirect(action: "list")
        }
    }

    def show(Long id) {
        def positionInstance = Position.get(id)
        if (!positionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'position.label', default: 'Position'), id])
            redirect(action: "list")
            return
        }

        [positionInstance: positionInstance]
    }

    def edit(Long id) {
        def positionInstance = Position.get(id)
        if (!positionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'position.label', default: 'Position'), id])
            redirect(action: "list")
            return
        }

        [positionInstance: positionInstance]
    }

    def update(Long id, Long version) {
        def positionInstance = Position.get(id)
        if (!positionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'position.label', default: 'Position'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (positionInstance.version > version) {
                    positionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'position.label', default: 'Position')] as Object[],
                            "Another user has updated this Position while you were editing")
                render(view: "edit", model: [positionInstance: positionInstance])
                return
            }
        }
        positionInstance.properties = params
        def positionCatas=Position.findAllByIdNotEqual(positionInstance.id)?.collect{it.eptCatas}?.collect{it.id}?.collect {it[0]};
        boolean hasContain=false;
        long containEptcata=0;
        params.eptCatas.collect{it.toLong()}.each{one->
            if(positionCatas.contains(one)){
                containEptcata=one;
                hasContain=true;
            }
        }
        if(hasContain){
            flash.message="${EquipmentCatagory.get(containEptcata).name}已分配给其他岗位，请重新选择";
            render(view: "edit", model: [positionInstance: positionInstance])
            return
        }

        if (!positionInstance.save(flush: true)) {
            render(view: "edit", model: [positionInstance: positionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'position.label', default: 'Position'), positionInstance.id])
        redirect(action: "list", id: positionInstance.id)
    }

    def delete(Long id) {
        def positionInstance = Position.get(id)
        if (!positionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'position.label', default: 'Position'), id])
            redirect(action: "list")
            return
        }

        try {
            positionInstance.eptCatas=[];
            positionInstance.save(flush: true);
            positionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'position.label', default: 'Position'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'position.label', default: 'Position'), id])
            redirect(action: "show", id: id)
        }
    }

    def deleteAll ={
        def map=[:]
        def ids=params.ids?.toString().tokenize(",");
        ids.each{
            def oneInstance=Position.get(it.toLong());
            oneInstance.eptCatas=[];
            oneInstance.save(flush: true);
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'position.label', default: 'Position'), ids.join(",")])
        //redirect action:"index"
        map.result=true;
        map.message=flash.message;
        render map as JSON;
    }

    def autoCteate(){
        def map=[:]
        def list=EquipmentCatagory.findAllByParentIsNull(['sort':'name','order':'asc']);
        list.each{
            if(!Position.findByName(it.name)){
                def pos=new Position();
                pos.name=it.name;
                pos.eptCatas=[it]
                pos.save(flush: true);
            }
        }
        map.result=true;
        render map as JSON;
    }
}
