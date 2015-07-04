package com.petrodata.pms

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.core.BaseUser
import com.petrodata.pms.order.JobItem
import com.petrodata.pms.order.JobOrder
import com.petrodata.pms.team.Position
import com.petrodata.pms.team.PositionBaseUser
import com.petrodata.pms.team.Rotation
import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
class WorkspaceController {
    def springSecurityService
    def index() {
        if(SpringSecurityUtils.ifAnyGranted("ROLE_MEMBER")){
            redirect(action:'myTask')
        }
    }
    def index1() {}
    def myTask(){
        def currentUser= BaseUser.get(springSecurityService.currentUser.id)
        def baseDepartment=currentUser.baseDepartment;
        if(SpringSecurityUtils.ifAnyGranted("ROLE_MEMBER")){
            def myPostions=PositionBaseUser.findAllByBaseUser(currentUser)?.position;
            def rotations=Rotation.findAllByBaseDepartment(baseDepartment);
            def myRotations=rotations?.findAll{it.baseUsers?.contains(currentUser)} ;
            if(myRotations.size()>0){
                Date serverTime=new Date();
                String rotationDay=serverTime.format('yyyy-MM-dd',TimeZone.getTimeZone(myRotations[0].timeZone));
                Date  localTime=Date.parse('yyyy-MM-dd',rotationDay);
                def jobOrders=JobOrder.findAllByPositionInListAndRotationInListAndJobDate(myPostions,myRotations,localTime);
                return [jobOrders:jobOrders.sort{it.id}]
            }else{
                return [jobOrders:[]]
                //render '尚未分配班次'
            }


        }else{
            render '不是小队队员角色'
        }
    }
    def getJobItemJson(){
        def list=[];
        def jobItems=JobItem.findAllByJobOrder(JobOrder.get(params.id),['sort':'id','order':'asc']);
        jobItems.each{
            def map=[:]
            map.id=it?.id;
            map.equipment=it?.equipment?.name;
            map.standardItem=it?.standardItem?.name;
            map.checker=it?.checker?.username;
            map.checkDate=it?.checkDate?.format('yyyy-MM-dd',TimeZone.getTimeZone(it?.jobOrder?.rotation?.timeZone));
            map.status=it?.status;
            map.isWrong=it?.isWrong;
            map.checkResult=it?.checkResult;
            map.remark=it?.remark;
            list<<map;
        }
        def map=[:]
        map.total=list.size();
        map.rows=list;
        render map as JSON;
    }
    def jobItemProcess(){
        def jobItem=JobItem.get(params.id);
        def map=[:]
        try{
           if(jobItem.status=='已查'){
               map.result=false;
               map.message="该工单项已被处理";
           }else{
               JobItem.withTransaction {status->
                   try{
                       def currentUser= BaseUser.get(springSecurityService.currentUser.id)
                       jobItem.status='已查';
                       jobItem.isWrong=params.isWrong;
                       jobItem.checker=currentUser;
                       jobItem.checkDate=new Date();
                       jobItem.save(flush: true);
                       def jobOrder=jobItem.jobOrder;
                       map.parentId=jobOrder.id;
                       map.allFinish=false;
                       if(JobItem.countByJobOrderAndStatus(jobOrder,'未查')==0){
                           jobOrder.isFinish=true;
                           jobOrder.save(flush: true)
                           map.allFinish=true;
                       }
                       map.result=true;
                   }catch (e){
                       status.setRollbackOnly()
                   }
               }
           }
        }catch (e){
            map.result=false;
            map.message=false;
        }
        render map as JSON;
    }
    def changeSkin(){
        if(params.skin){
            def currentUser= BaseUser.get(springSecurityService.currentUser.id)
            currentUser.skin=params.skin;
            currentUser.save(flush: true);
        }
        def map=[:]
        map.result=true;
        render map as JSON;
    }
    def finishAllItem(){
        def map=[:]
        map.result=false;
        def jobOrder=JobOrder.get(params.id);
        def currentUser= BaseUser.get(springSecurityService.currentUser.id)
        JobOrder.withTransaction {status->
           try{
               JobItem.findAllByJobOrder(jobOrder).each{
                   if(it.status=='未查'){
                       it.status='已查';
                       it.checker=currentUser;
                       it.checkDate=new Date();
                       it.save(flush: true);
                   }
               }
               jobOrder.isFinish=true;
               map.result=true;
           }catch (e){
               status.setRollbackOnly()
           }
        }
        render map as JSON;
    }

    def mapDataJson(){

        [
                {
                    "abbrev":"AL",
                    "parentState":"Alabama",
                    "capital":"Montgomery",
                    "lat":32.380120,
                    "lon":-86.300629,
                    "z":10
                },
                {
                    "abbrev":"AK",
                    "parentState":"Alaska",
                    "capital":"Juneau",
                    "lat":58.299740,
                    "lon":-134.406794,
                    "z":10
                },
                {
                    "abbrev":"AZ",
                    "parentState":"Arizona",
                    "capital":"Phoenix",
                    "lat":33.448260,
                    "lon":-112.075774,
                    "z":10
                },
                {
                    "abbrev":"AR",
                    "parentState":"Arkansas",
                    "capital":"Little Rock",
                    "lat":34.748655,
                    "lon":-92.274494,
                    "z":10
                },
                {
                    "capital":"no where",
                    "z":100
                }
        ]
    }
}
