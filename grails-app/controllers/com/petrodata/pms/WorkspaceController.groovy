package com.petrodata.pms

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.core.BaseRole
import com.petrodata.pms.core.BaseUser
import com.petrodata.pms.equipment.Equipment
import com.petrodata.pms.order.JobItem
import com.petrodata.pms.order.JobOrder
import com.petrodata.pms.team.Position
import com.petrodata.pms.team.PositionBaseUser
import com.petrodata.pms.team.Rotation
import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

import java.math.MathContext

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

    def statusDataJson()
    {
        def map = [:];
        BaseUser loginUser = springSecurityService.getCurrentUser();
        Set<BaseRole> roles = loginUser.getAuthorities();

        def teams;
        def workTeamCount;

        def equipments;
        def techCount;

        def checkJobs;
        def checkJobFinishCount;

        def maintainJobs;
        def maintainJobFinishCount;

        if(roles.any {it.name =="ROLE_MANAGER"})//设备处
        {
            teams = BaseDepartment.createCriteria().list {
                eq("type","小队节点");
            }

            equipments = Equipment.list();

            checkJobs = JobOrder.createCriteria().list {
                eq('type',"运行检查")
            }

            maintainJobs = JobOrder.createCriteria().list {
                eq('type',"保养")
            }
        }
        else if(roles.any{it.name == "ROLE_PROJECT"})
        {
            teams = BaseDepartment.createCriteria().list{
                eq("type","小队节点")
                eq("parent",loginUser.baseDepartment)
            }

            equipments = Equipment.createCriteria().list{
                createAlias("inDepartment.parent","indp")
                eq("indp.id",loginUser.baseDepartment.id)
            }

            checkJobs = JobOrder.createCriteria().list {
                createAlias("rotation.baseDepartment.parent","rdp")
                eq("rdp.id",loginUser.baseDepartment.id)
                eq('type',"运行检查")
            }

            maintainJobs = JobOrder.createCriteria().list {
                createAlias("rotation.baseDepartment.parent","rdp")
                eq("rdp.id",loginUser.baseDepartment.id)
                eq('type',"保养")
            }
        }
        else if(roles.any {it.name == "ROLE_CAPTAIN"})
        {
            equipments = Equipment.createCriteria().list{
                eq("inDepartment",loginUser.baseDepartment)
            }

            checkJobs = JobOrder.createCriteria().list {
                createAlias("rotation.baseDepartment","rd")
                eq("rd.id",loginUser.baseDepartment.id)
                eq('type',"运行检查")
            }

            maintainJobs = JobOrder.createCriteria().list {
                createAlias("rotation.baseDepartment","rd")
                eq("rd.id",loginUser.baseDepartment.id)
                eq('type',"保养")
            }
        }
        techCount = equipments.count {it.techState == "完好"};
        map.equipmentPrecent = techCount>0?(techCount / equipments.size()*100).round(new MathContext(2)):0;

        workTeamCount = teams.count {it.isWorking == true};
        map.teamPrecent = workTeamCount>0?(workTeamCount / teams.size()*100).round(new MathContext(2)):0;

        checkJobFinishCount = checkJobs.count {it.isFinish == true};
        map.checkJobPrecent = checkJobFinishCount>0?(checkJobFinishCount / checkJobs.size()*100).round(new MathContext(2)):0;

        maintainJobFinishCount = maintainJobs.count {it.isFinish == true};
        map.maintainJobPrecent = maintainJobFinishCount>0?(maintainJobFinishCount / maintainJobs.size()*100).round(new MathContext(2)):0;

        render map as JSON;
    }

    def chartDataJson()
    {
        def map = [:];
        BaseUser loginUser = springSecurityService.getCurrentUser();
        def projectDepartments = BaseDepartment.findAllByType("项目部节点");
        def categories = [];
        def series = [];
        def workTeamSeries = [:];
        workTeamSeries.name = "小队开工率";
        workTeamSeries.data = [];
        def equipmentHealthSeries = [:];
        equipmentHealthSeries.name = "设备健康率";
        equipmentHealthSeries.data = [];
        def checkJobSeries = [:];
        checkJobSeries.name = "检查工单执行率";
        checkJobSeries.data = [];
        def maintainJobSeries = [:];
        maintainJobSeries.name = "保养工单执行率";
        maintainJobSeries.data = [];
        projectDepartments.each {teamDepartment->
            categories.add(teamDepartment.name)
            def teams = BaseDepartment.createCriteria().list{
                eq("type","小队节点")
                eq("parent",teamDepartment)
            }

            def equipments = Equipment.createCriteria().list{
                createAlias("inDepartment.parent","indp")
                eq("indp.id",teamDepartment.id)
            }

            def checkJobs = JobOrder.createCriteria().list {
                createAlias("rotation.baseDepartment.parent","rdp")
                eq("rdp.id",teamDepartment.id)
                eq('type',"运行检查")
            }

            def maintainJobs = JobOrder.createCriteria().list {
                createAlias("rotation.baseDepartment.parent","rdp")
                eq("rdp.id",it.id)
                eq('type',"保养")
            }
            def techCount = equipments.count {it.techState == "完好"};
            equipmentHealthSeries.data.add(techCount>0?(techCount / equipments.size()).round(new MathContext(3)):0);

            def workTeamCount = teams.count {it.isWorking == true};
            workTeamSeries.data.add(workTeamCount>0?(workTeamCount / teams.size()).round(new MathContext(3)):0);

            def checkJobFinishCount = checkJobs.count {it.isFinish == true};
            checkJobSeries.data.add(checkJobFinishCount>0?(checkJobFinishCount / checkJobs.size()).round(new MathContext(3)):0);

            def maintainJobFinishCount = maintainJobs.count {it.isFinish == true};
            maintainJobSeries.data.add(maintainJobFinishCount>0?(maintainJobFinishCount / maintainJobs.size()).round(new MathContext(3)):0);
        };
        map.categories = categories;
        series.add(workTeamSeries);
        series.add(checkJobSeries);
        series.add(maintainJobSeries);
        series.add(equipmentHealthSeries);
        map.series = series;

        render map as JSON;
    }
    def mapDataJson(){
        /*
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
        ]*/
    }
}
