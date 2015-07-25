package com.petrodata.pms.equipment


import org.springframework.dao.DataIntegrityViolationException
import com.petrodata.poi.ExcelReadBuilder
import grails.converters.JSON


class StandardController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["DELETE","GET","POST"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max
        //[standardInstanceList: Standard.list(params), standardInstanceTotal: Standard.count()]
        return []
    }
    //不同标准的列表
    def itemjson(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def standard=Standard.get(params.id);
        def allCount=StandardItem.countByStandardAndType(standard,params.type);
        def allList=StandardItem.createCriteria().list{
            eq('type',params.type)
            eq("standard.id",standard.id)
            order(params.sort,params.order)
            maxResults(params.max.toInteger())
            firstResult(params.offset.toInteger())
        }
        def map=[:];
        map.total=allCount;
        map.rows=allList;
        render map as JSON;
    }
    def json(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def allCount=Standard.createCriteria().count{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
        }
        def allList=Standard.createCriteria().list{
            if(params.search){
                ilike('name',"%${params.search}%");
            }
            order(params.sort,params.order)
            maxResults(params.max.toInteger())
            firstResult(params.offset.toInteger())
        }
        def map=[:];
        map.total=allCount;
        map.rows=allList;
        render map as JSON;
    }
    def serverSave(){
        def map=[:];
        if(!params.version){
            params.version=0l;
        }
        if(!params.id){
            map=this.save();
        }else{
            map=this.update(params.id?.toLong(),params.version?.toLong()?:0);
        }
        render "${(map as JSON).toString()}";
    }
    def save() {
        def map=[:]
        def standardInstance = new Standard(params)
        if (!standardInstance.save(flush: true)) {
            map.result=false;
            //@todo
            map.message=standardInstance.errors.allErrors.toString();
        }else{
            flash.message = message(code: 'default.created.message', args: [message(code: 'standard.label', default: 'Standard'), standardInstance.id])
            map.result=true;
            map.message=flash.message;
        }

        return map;
    }
    def update(Long id, Long version) {
        def map=[:]
        def standardInstance = Standard.get(id)
        if (!standardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'standard.label', default: 'Standard'), id])
            map.result=false;
            map.message=flash.message;
        }
        if (version != null) {
            if (standardInstance.version > version) {
                    standardInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'standard.label', default: 'Standard')] as Object[],
                            "Another user has updated this Standard while you were editing")
                map.result=false;
                map.message=standardInstance.errors.allErrors.toString();
            }
        }
        standardInstance.properties = params

        if (!standardInstance.save(flush: true)) {
            map.result=false;
            map.message=standardInstance.errors.allErrors.toString();
        }else{
            flash.message = message(code: 'default.updated.message', args: [message(code: 'standard.label', default: 'Standard'), standardInstance.id])
            map.result=true;
            map.message=flash.message;
        }

        return map;
    }

    def delete(Long id) {
        def map=[:]
        def standardInstance = Standard.get(id)
        if (!standardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'standard.label', default: 'Standard'), id])
            map.result=false;
            map.message=flash.message;
        }
        try {
            standardInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'standard.label', default: 'Standard'), id])
            map.result=true;
            map.message=flash.message;
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'standard.label', default: 'Standard'), id])
            map.result=false;
            map.message=flash.message;
        }
        render map as JSON;
    }

    def deleteAll(){
        def map=[:]
        def list=params.ids.tokenize(',');
        list.each{
            def oneInstance=Standard.get(it.toLong());
            Standard.withNewSession {session->
                StandardItem.findAllByStandard(oneInstance).each{item->
                     item.delete(flush: true);
                }
            }
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'standard.label', default: 'Standard'), params.ids])
        map.result=true;
        map.message=flash.message;
        render map as JSON;
    }
    def deleteAllItem(){
        def map=[:]
        def list=params.ids.tokenize(',');
        list.each{
            def oneInstance=StandardItem.get(it.toLong());
            oneInstance.delete(flush:true);
        }
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'standard.label', default: 'Standard'), params.ids])
        map.result=true;
        map.message=flash.message;
        render map as JSON;
    }

    def importExel(){
        def map=[:];
        def file = request.getFile('file');
        if(file ||!file?.empty) {  //file.originalFilename
            try{
                new ExcelReadBuilder(2003,file.bytes).eachLine([sheet:'sheet1',labels:true]) {
                    if(it.rowNum>2){
                        def ecs=cell(2)?.toString()?.trim();
                        def ctype=cell(3)?.toString()?.trim();
                        def title=cell(4)?.toString()?.trim();
                        if(ecs&&ctype&&title){
                            def ec=EquipmentCatagory.findByName(ecs);
                            def st=Standard.findByName(ecs+"标准")
                            if(ec){
                                if(!st){
                                    st=new Standard(name:ecs+"标准",equipmentCatagory:ec,reference:'无',attention:'无');
                                    st.save(flush: true);
                                }
                                println st.id
                                if(ctype=='B'||ctype=='b'){
                                    def sti=new StandardItem(standard: st,type:'运行检查标准',aim: '时间',checkType:'班次',name:title);
                                    sti.save(flush: true);
                                    //println sti.errors.allErrors
                                }
                                if(ctype.contains('天')){
                                    def sti=new StandardItem(standard: st,type:'运行检查标准',aim: '时间',checkType:'天数',name:title,checkDays:Integer.parseInt(ctype-'天'));
                                    sti.save(flush: true);
                                    //println sti.errors.allErrors
                                }
                            }

                        }
                     }
                }
                map.result=true;
            }catch(e){
                map.result=false;
                map.message=e.message;
            }
        }else{
            map.result=false;
            map.message="file is empty!";
        }
        render "${(map as JSON).toString()}";
    }
}
