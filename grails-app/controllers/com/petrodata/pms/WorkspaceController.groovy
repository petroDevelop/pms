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
    def index() {}
    def index1() {}
    def myTask(){
        def currentUser= BaseUser.get(springSecurityService.currentUser.id)
        def baseDepartment=currentUser.baseDepartment;
        if(SpringSecurityUtils.ifAnyGranted("ROLE_MEMBER")){
            def myPostions=PositionBaseUser.findAllByBaseUser(currentUser)?.position;
            def rotations=Rotation.findAllByBaseDepartment(baseDepartment);
            def myRotations=rotations?.findAll{it.baseUsers?.contains{currentUser}} ;
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
            map.checkDate=it?.checkDate?.format("yyyy-MM-dd");
            map.status=it?.status;
            map.isWrong=it?.isWrong;
            map.checkResult=it?.checkResult;
            map.remark=it?.remark;
            list<<map;
        }
        render list as JSON;
    }
    def processJobItemJson(){
        def jobItem=JobItem.get(params.id);
        def map=[:]
        try{
           if(jobItem.status=='已查'){
               map.result=false;
               map.message="该工单项已被处理";
           }
        }catch (e){
            map.result=false;
            map.message=false;
        }
        render map as JSON;
    }
}
