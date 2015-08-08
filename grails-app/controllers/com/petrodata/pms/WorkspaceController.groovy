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
                Date sevenDayBefore = localTime-7;
                def finishJobOrders = JobOrder.findAllByIsFinishAndPositionInListAndRotationInListAndJobDateBetween(true,myPostions,myRotations,sevenDayBefore,localTime);
                def progressJobOrders = JobOrder.findAllByIsFinishAndPositionInListAndRotationInListAndJobDate(false,myPostions,myRotations,localTime);
                def oldProgressJobOrders = JobOrder.findAllByIsFinishAndPositionInListAndRotationInListAndJobDateLessThan(false,myPostions,myRotations,localTime);

                //def jobOrders=JobOrder.findAllByPositionInListAndRotationInListAndJobDate(myPostions,myRotations,localTime);
                def map = [:];
                map.finishJobOrders = finishJobOrders.sort {it.id};
                map.progressJobOrders = progressJobOrders.sort{it.id};
                map.oldProgressJobOrders = oldProgressJobOrders.sort {it.id};
                return map;
            }else{
                return [finishJobOrders:[],progressJobOrders:[],oldProgressJobOrders:[]]
                //render '尚未分配班次'
            }


        }else{
            render '不是小队队员角色'
        }
    }
    def getJobItemJson(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='asc'
        def list=[];
        def joborder=JobOrder.get(params.id);
        def jobItems=JobItem.findAllByJobOrder(joborder,params);
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
        map.total=JobItem.countByJobOrder(joborder);;
        map.rows=list;
        render map as JSON;
    }
/*    def jobItemProcess(){
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
    }*/
    def processJobItem(){
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
                        jobItem.checkResult=params.checkResult;
                        //@todo 处理附件
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
            map.message=e.message;
        }
        render "${map as JSON}"
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
    //
    def statusDataJson() {
        def map = [:];
        BaseUser loginUser = springSecurityService.getCurrentUser();
        //Set<BaseRole> roles = loginUser.getAuthorities();
        def teamCounts = BaseDepartment.createCriteria().list {
            projections {
                count('id')
                groupProperty('isWorking')
            }
            eq("type","小队节点");
            if(SpringSecurityUtils.ifAnyGranted('ROLE_MANAGER')){

            }
            if(SpringSecurityUtils.ifAnyGranted('ROLE_PROJECT')){
                eq("parent",loginUser.baseDepartment)
            }
            if(SpringSecurityUtils.ifAnyGranted('ROLE_CAPTAIN')){
                eq("id",loginUser.baseDepartment.id)
            }
        }

        def equipmentCounts = Equipment.createCriteria().list {
            projections {
                count('id')
                groupProperty("techState")
            }
            if(SpringSecurityUtils.ifAnyGranted('ROLE_MANAGER')){

            }
            if(SpringSecurityUtils.ifAnyGranted('ROLE_PROJECT')){
                createAlias("inDepartment","inde")
                createAlias("inde.parent","indp")
                eq("indp.id",loginUser.baseDepartment.id)
            }
            if(SpringSecurityUtils.ifAnyGranted('ROLE_CAPTAIN')){
                eq("inDepartment",loginUser.baseDepartment)
            }
        }

        def checkJobs = JobOrder.createCriteria().list {
            projections {
               count('id')
               groupProperty('isFinish')
               groupProperty('type')
            }
            eq('type',"运行检查")
            if(SpringSecurityUtils.ifAnyGranted('ROLE_MANAGER')){

            }
            if(SpringSecurityUtils.ifAnyGranted('ROLE_PROJECT')){
                createAlias("rotation","rt")
                createAlias("rt.baseDepartment",'rb')
                createAlias("rb.parent","rbp")
                eq("rbp.id",loginUser.baseDepartment.id)
            }
            if(SpringSecurityUtils.ifAnyGranted('ROLE_CAPTAIN')){
                createAlias("rotation","rt")
                createAlias("rt.baseDepartment",'rb')
                eq("rb.id",loginUser.baseDepartment.id)
            }
        }
        def techCount = equipmentCounts.findAll{it[1]=="完好"}?.sum{it[0]};
        map.equipmentPrecent=((techCount?:0)/(equipmentCounts.sum{it[0]}?:1)*100).round(new MathContext(2))?:0;

        def workTeamCount = teamCounts.findAll{it[1]==true}?.sum{it[0]};
        map.teamPrecent = ((workTeamCount?:0)/(teamCounts.sum{it[0]}?:1)*100).round(new MathContext(2))?:0;

        def checkJobFinishCount = checkJobs.findAll{it[1]==true && it[2]=='运行检查'}?.sum{it[0]};
        map.checkJobPrecent = ((checkJobFinishCount?:0) / (checkJobs.findAll{it[2]=='运行检查'}.sum{it[0]}?:1)*100).round(new MathContext(2))?:0;

        def maintainJobFinishCount = checkJobs.findAll{it[1]==true && it[2]=='保养'}?.sum{it[0]};
        map.maintainJobPrecent = ((maintainJobFinishCount?:0) / (checkJobs.findAll{it[2]=='保养'}.sum{it[0]}?:1)*100).round(new MathContext(2))?:0;

        render map as JSON;
    }

    def chartDataJson(){
        def map = [:];
        BaseUser loginUser = springSecurityService.getCurrentUser();
        def projectDepartments = BaseDepartment.findAllByType("项目部节点",['sort':'name','order':'name']);
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
                projections {
                    count('id')
                    groupProperty("isWorking")
                }
                eq("type","小队节点")
                eq("parent",teamDepartment)
            }

            def equipments = Equipment.createCriteria().list{
                projections {
                    count('id')
                    groupProperty("techState")
                }
                createAlias("inDepartment","inde")
                createAlias("inde.parent","indp")
                eq("indp.id",teamDepartment.id)
            }

            def checkJobs = JobOrder.createCriteria().list {
                projections {
                    count('id')
                    groupProperty("isFinish")
                }
                createAlias("rotation","rt")
                createAlias("rt.baseDepartment",'rb')
                createAlias("rb.parent","rbp")
                eq("rbp.id",teamDepartment.id)
                eq('type',"运行检查")
            }

            def maintainJobs = JobOrder.createCriteria().list {
                projections {
                    count('id')
                    groupProperty("isFinish")
                }
                createAlias("rotation","rt")
                createAlias("rt.baseDepartment",'rb')
                createAlias("rb.parent","rbp")
                eq("rbp.id",teamDepartment.id)
                eq('type',"保养")
            }
            def techCount = equipments.findAll{it[1] == "完好"}?.sum{it[0]}?:0;
            equipmentHealthSeries.data.add((techCount / (equipments.sum{it[0]}?:1)).round(new MathContext(3))?:0);

            def workTeamCount = teams.findAll{it[1]==true}?.sum{it[0]}?:0;
            workTeamSeries.data.add((workTeamCount / (teams.sum{it[0]}?:1)).round(new MathContext(3))?:0);

            def checkJobFinishCount = checkJobs.findAll{it[1] == true}?.sum{it[0]}?:0;
            checkJobSeries.data.add((checkJobFinishCount/(checkJobs.sum{it[0]}?:1)).round(new MathContext(3))?:0);

            def maintainJobFinishCount = maintainJobs.findAll{it[1] == true}?.sum{it[0]}?:0;
            maintainJobSeries.data.add((maintainJobFinishCount / (maintainJobs.sum{it[0]}?:1)).round(new MathContext(3))?:0);
        };
        map.categories = categories;
        series.add(workTeamSeries);
        series.add(checkJobSeries);
        series.add(maintainJobSeries);
        series.add(equipmentHealthSeries);
        map.series = series;

        render map as JSON;
    }
    def chartDataProjectJson(){
        def map = [:];
        BaseUser loginUser = springSecurityService.getCurrentUser();
        def projectDepartments = BaseDepartment.findAllByTypeAndParent("小队节点",loginUser.baseDepartment,['sort':'name','order':'name']);
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
                projections {
                    count('id')
                    groupProperty("isWorking")
                }
                eq("type","小队节点")
                eq("id",teamDepartment.id)
            }

            def equipments = Equipment.createCriteria().list{
                projections {
                    count('id')
                    groupProperty("techState")
                }
                createAlias("inDepartment","inde")
                eq("inde.id",teamDepartment.id)
            }

            def checkJobs = JobOrder.createCriteria().list {
                projections {
                    count('id')
                    groupProperty("isFinish")
                }
                createAlias("rotation","rt")
                createAlias("rt.baseDepartment",'rb')
                eq("rb.id",teamDepartment.id)
                eq('type',"运行检查")
            }

            def maintainJobs = JobOrder.createCriteria().list {
                projections {
                    count('id')
                    groupProperty("isFinish")
                }
                createAlias("rotation","rt")
                createAlias("rt.baseDepartment",'rb')
                eq("rb.id",teamDepartment.id)
                eq('type',"保养")
            }
            def techCount = equipments.findAll{it[1] == "完好"}?.sum{it[0]}?:0;
            equipmentHealthSeries.data.add((techCount / (equipments.sum{it[0]}?:1)).round(new MathContext(3))?:0);

            def workTeamCount = teams.findAll{it[1]==true}?.sum{it[0]}?:0;
            workTeamSeries.data.add((workTeamCount / (teams.sum{it[0]}?:1)).round(new MathContext(3))?:0);

            def checkJobFinishCount = checkJobs.findAll{it[1] == true}?.sum{it[0]}?:0;
            checkJobSeries.data.add((checkJobFinishCount/(checkJobs.sum{it[0]}?:1)).round(new MathContext(3))?:0);

            def maintainJobFinishCount = maintainJobs.findAll{it[1] == true}?.sum{it[0]}?:0;
            maintainJobSeries.data.add((maintainJobFinishCount / (maintainJobs.sum{it[0]}?:1)).round(new MathContext(3))?:0);
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
        BaseUser loginUser = springSecurityService.getCurrentUser();
        def teams=BaseDepartment.createCriteria().list{
            eq('type','小队节点')
            if(SpringSecurityUtils.ifAnyGranted('ROLE_MANAGER')){

            }
            if(SpringSecurityUtils.ifAnyGranted('ROLE_PROJECT')){
                eq("parent",loginUser.baseDepartment)
            }
            if(SpringSecurityUtils.ifAnyGranted('ROLE_CAPTAIN')){

            }
        }
        def map=[:]
        def well=[]
        def bad=[]
        teams.each{team->
            def one=[:]
            one.capital=team.name;
            one.lat=team.latitude?:60;
            one.lon=team.longtitude?:100;
            one.z=10;
            if(team.isWorking){
                one.lat=team.latitude?:60;
                one.lon=team.longtitude?:100;
                well<<one;
            }else{
                one.lat=team.latitude?:10;
                one.lon=team.longtitude?:20;
                bad<<one;
            }
        }
        def mapwhere=[:]
        mapwhere.captal="no where";
        mapwhere.z=20;
        well<<mapwhere
        bad<<mapwhere
        map.well=well;
        map.bad=bad;
        map.world=[["hc-key":"af", "value":"53"], ["hc-key":"al", "value":"117"], ["hc-key":"dz", "value":"15"], ["hc-key":"as", "value":"342"], ["hc-key":"ad", "value":"181"], ["hc-key":"ao", "value":"15"], ["hc-key":"ai", "value":"202"], ["hc-key":"ar", "value":"15"], ["hc-key":"am", "value":"109"], ["hc-key":"aw", "value":"597"], ["hc-key":"au", "value":"3"], ["hc-key":"at", "value":"102"],
                   ["hc-key":"az", "value":"110"], ["hc-key":"bs", "value":"34"], ["hc-key":"bh", "value":"1660"], ["hc-key":"bd", "value":"1142"], ["hc-key":"bb", "value":"636"], ["hc-key":"by", "value":"47"], ["hc-key":"be", "value":"359"], ["hc-key":"bz", "value":"15"], ["hc-key":"bj", "value":"80"], ["hc-key":"bm", "value":"1292"], ["hc-key":"bt", "value":"19"], ["hc-key":"bo", "value":"9"],
                   ["hc-key":"ba", "value":"73"], ["hc-key":"bw", "value":"4"], ["hc-key":"br", "value":"23"], ["hc-key":"bn", "value":"76"], ["hc-key":"bg", "value":"69"], ["hc-key":"bf", "value":"60"], ["hc-key":"bi", "value":"326"], ["hc-key":"kh", "value":"80"], ["hc-key":"cm", "value":"41"], ["hc-key":"ca", "value":"4"], ["hc-key":"cv", "value":"123"], ["hc-key":"ky", "value":"234"],
                   ["hc-key":"cf", "value":"7"], ["hc-key":"td", "value":"9"], ["hc-key":"cl", "value":"23"], ["hc-key":"cn", "value":"143"], ["hc-key":"co", "value":"42"], ["hc-key":"km", "value":"395"], ["hc-key":"cd", "value":"29"], ["hc-key":"cg", "value":"12"], ["hc-key":"cr", "value":"91"], ["hc-key":"ci", "value":"62"], ["hc-key":"hr", "value":"79"], ["hc-key":"cu", "value":"106"],
                   ["hc-key":"cw", "value":"321"], ["hc-key":"cy", "value":"119"], ["hc-key":"cz", "value":"136"], ["hc-key":"dk", "value":"131"], ["hc-key":"dj", "value":"38"], ["hc-key":"dm", "value":"90"], ["hc-key":"do", "value":"205"], ["hc-key":"ec", "value":"58"], ["hc-key":"eg", "value":"81"], ["hc-key":"sv", "value":"299"], ["hc-key":"gq", "value":"25"], ["hc-key":"er", "value":"52"],
                   ["hc-key":"ee", "value":"32"], ["hc-key":"et", "value":"83"], ["hc-key":"fo", "value":"35"], ["hc-key":"fj", "value":"47"], ["hc-key":"fi", "value":"18"], ["hc-key":"fr", "value":"118"], ["hc-key":"pf", "value":"74"], ["hc-key":"ga", "value":"6"], ["hc-key":"gm", "value":"173"], ["hc-key":"ge", "value":"78"], ["hc-key":"de", "value":"234"], ["hc-key":"gh", "value":"107"],
                   ["hc-key":"gr", "value":"88"], ["hc-key":"gl", "value":"0"], ["hc-key":"gd", "value":"307"], ["hc-key":"gu", "value":"333"], ["hc-key":"gt", "value":"134"], ["hc-key":"gn", "value":"41"], ["hc-key":"gw", "value":"54"], ["hc-key":"gy", "value":"4"], ["hc-key":"ht", "value":"363"], ["hc-key":"hn", "value":"68"], ["hc-key":"hk", "value":"6783"], ["hc-key":"hu", "value":"112"],
                   ["hc-key":"is", "value":"3"], ["hc-key":"in", "value":"394"], ["hc-key":"id", "value":"132"], ["hc-key":"ir", "value":"45"], ["hc-key":"iq", "value":"73"], ["hc-key":"ie", "value":"65"], ["hc-key":"im", "value":"145"], ["hc-key":"il", "value":"352"], ["hc-key":"it", "value":"206"], ["hc-key":"jm", "value":"250"], ["hc-key":"jp", "value":"350"], ["hc-key":"jo", "value":"69"],
                   ["hc-key":"kz", "value":"6"], ["hc-key":"ke", "value":"71"], ["hc-key":"ki", "value":"123"], ["hc-key":"kp", "value":"202"], ["hc-key":"kr", "value":"504"], ["hc-key":"xk", "value":"167"], ["hc-key":"kw", "value":"154"], ["hc-key":"kg", "value":"28"], ["hc-key":"la", "value":"27"], ["hc-key":"lv", "value":"36"], ["hc-key":"lb", "value":"413"], ["hc-key":"ls", "value":"72"],
                   ["hc-key":"lr", "value":"41"], ["hc-key":"ly", "value":"4"], ["hc-key":"li", "value":"225"], ["hc-key":"lt", "value":"53"], ["hc-key":"lu", "value":"195"], ["hc-key":"mo", "value":"19416"], ["hc-key":"mk", "value":"82"], ["hc-key":"mg", "value":"36"], ["hc-key":"mw", "value":"158"], ["hc-key":"my", "value":"86"], ["hc-key":"mv", "value":"1053"], ["hc-key":"ml", "value":"13"],
                   ["hc-key":"mt", "value":"1291"], ["hc-key":"mh", "value":"300"], ["hc-key":"mr", "value":"3"], ["hc-key":"mu", "value":"631"], ["hc-key":"yt", "value":"552"], ["hc-key":"mx", "value":"58"], ["hc-key":"fm", "value":"159"], ["hc-key":"md", "value":"124"], ["hc-key":"mc", "value":"17704"], ["hc-key":"mn", "value":"2"], ["hc-key":"me", "value":"47"], ["hc-key":"ma", "value":"72"],
                   ["hc-key":"mz", "value":"30"], ["hc-key":"mm", "value":"73"], ["hc-key":"na", "value":"3"], ["hc-key":"np", "value":"209"], ["hc-key":"nl", "value":"492"], ["hc-key":"nc", "value":"14"], ["hc-key":"nz", "value":"17"], ["hc-key":"ni", "value":"48"], ["hc-key":"ne", "value":"12"], ["hc-key":"ng", "value":"174"], ["hc-key":"mp", "value":"132"], ["hc-key":"no", "value":"16"],
                   ["hc-key":"om", "value":"9"], ["hc-key":"pk", "value":"225"], ["hc-key":"pw", "value":"45"], ["hc-key":"pa", "value":"47"], ["hc-key":"pg", "value":"15"], ["hc-key":"py", "value":"16"], ["hc-key":"pe", "value":"23"], ["hc-key":"ph", "value":"313"], ["hc-key":"pl", "value":"126"], ["hc-key":"pt", "value":"116"], ["hc-key":"pr", "value":"449"], ["hc-key":"wa", "value":"152"],
                   ["hc-key":"ro", "value":"93"], ["hc-key":"ru", "value":"9"], ["hc-key":"rw", "value":"431"], ["hc-key":"ws", "value":"65"], ["hc-key":"sm", "value":"526"], ["hc-key":"st", "value":"172"], ["hc-key":"sa", "value":"14"], ["hc-key":"sn", "value":"65"], ["hc-key":"rs", "value":"83"], ["hc-key":"sc", "value":"188"], ["hc-key":"sl", "value":"82"],
                   ["hc-key":"sg", "value":"7252"], ["hc-key":"sk", "value":"113"], ["hc-key":"si", "value":"102"], ["hc-key":"sb", "value":"19"], ["hc-key":"so", "value":"15"], ["hc-key":"za", "value":"41"], ["hc-key":"ss", "value":"0"], ["hc-key":"es", "value":"92"], ["hc-key":"lk", "value":"333"], ["hc-key":"kn", "value":"202"], ["hc-key":"lc", "value":"285"], ["hc-key":"mf", "value":"556"],
                   ["hc-key":"vc", "value":"280"], ["hc-key":"sd", "value":"18"], ["hc-key":"sr", "value":"3"], ["hc-key":"sz", "value":"69"], ["hc-key":"se", "value":"23"], ["hc-key":"ch", "value":"196"], ["hc-key":"sy", "value":"111"], ["hc-key":"tj", "value":"49"], ["hc-key":"tz", "value":"51"], ["hc-key":"th", "value":"135"], ["hc-key":"tp", "value":"76"], ["hc-key":"tg", "value":"111"],
                   ["hc-key":"to", "value":"145"], ["hc-key":"tt", "value":"261"], ["hc-key":"tn", "value":"68"], ["hc-key":"tr", "value":"95"], ["hc-key":"tm", "value":"11"], ["hc-key":"tc", "value":"40"], ["hc-key":"tv", "value":"328"], ["hc-key":"ug", "value":"170"], ["hc-key":"ua", "value":"79"], ["hc-key":"ae", "value":"90"], ["hc-key":"uk", "value":"257"], ["hc-key":"us", "value":"34"],
                   ["hc-key":"uy", "value":"19"], ["hc-key":"uz", "value":"66"], ["hc-key":"vu", "value":"20"], ["hc-key":"ve", "value":"33"], ["hc-key":"vn", "value":"280"], ["hc-key":"vi", "value":"314"], ["hc-key":"ps", "value":"690"], ["hc-key":"eh", "value":"2"], ["hc-key":"ye", "value":"46"], ["hc-key":"zm", "value":"17"], ["hc-key":"zw", "value":"32"]];
        render map as JSON;

    }
    def barChartJson(){
        BaseUser loginUser = springSecurityService.getCurrentUser();
        def map=[:]
        def jlist=JobOrder.createCriteria().list{
            projections {
                groupProperty("type")
                count('id')
            }
            if(SpringSecurityUtils.ifAnyGranted('ROLE_MANAGER')){

            }
            if(SpringSecurityUtils.ifAnyGranted('ROLE_PROJECT')){
                createAlias("rotation","rt")
                createAlias("rt.baseDepartment",'rb')
                createAlias("rb.parent","rbp")
                eq("rbp.id",loginUser.baseDepartment.id)
            }
        }
        def elist=Equipment.createCriteria().list{
            projections {
                groupProperty("techState")
                count('id')
            }
            if(SpringSecurityUtils.ifAnyGranted('ROLE_MANAGER')){

            }
            if(SpringSecurityUtils.ifAnyGranted('ROLE_PROJECT')){
                createAlias("inDepartment","inde")
                createAlias("inde.parent","indp")
                eq("indp.id",loginUser.baseDepartment.id)
            }
        }
        map.jobOrder=jlist;
        map.equipment=elist;
        render map as JSON;
    }

    def teamJobJson(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def map=[:]
        def currentUser= BaseUser.get(springSecurityService.currentUser.id)
        def baseDepartment=currentUser.baseDepartment;
        def rotations=Rotation.findAllByBaseDepartment(baseDepartment);
        Date serverTime=new Date();
        String rotationDay=serverTime.format('yyyy-MM-dd',TimeZone.getTimeZone(rotations[0].timeZone));
        Date  localTime=Date.parse('yyyy-MM-dd',rotationDay);
        def count=JobOrder.createCriteria().count {
           createAlias("rotation","rt")
           createAlias("rt.baseDepartment","rb")
           eq("rb.id",baseDepartment.id)
           eq("jobDate",localTime)
        }
        def list=JobOrder.createCriteria().list{
            createAlias("rotation","rt")
            createAlias("rt.baseDepartment","rb")
            eq("rb.id",baseDepartment.id)
            eq("jobDate",localTime)
            order(params.sort,params.order)
            maxResults(params.max.toInteger())
            firstResult(params.offset.toInteger())
        }
        def slist=[];
        list.each{
           def one=[:]
           one.id=it.id
           one.jobDate=it.jobDate.format("yyyy-MM-dd")
           one.rotation=it.rotation.name
            one.position=it.position.name
            one.type=it.type
            one.isFinish="未完成"
            if(it.isFinish){
                one.isFinish="完成"
            }
           slist<<one;
        }
        map.total=count;
        map.rows=slist;
        render map as JSON;
    }

    /**
     * 小队超期工单
     * @return
     */
    def teamOutDateJobJson(){
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def map=[:]
        def currentUser= BaseUser.get(springSecurityService.currentUser.id)
        def baseDepartment=currentUser.baseDepartment;
        def rotations=Rotation.findAllByBaseDepartment(baseDepartment);
        Date serverTime=new Date();
        String rotationDay=serverTime.format('yyyy-MM-dd',TimeZone.getTimeZone(rotations[0].timeZone));
        Date  localTime=Date.parse('yyyy-MM-dd',rotationDay);
        def count=JobOrder.createCriteria().count {
            createAlias("rotation","rt")
            createAlias("rt.baseDepartment","rb")
            eq("rb.id",baseDepartment.id)
            between("jobDate",localTime-7,localTime-1)
        }
        def list=JobOrder.createCriteria().list{
            createAlias("rotation","rt")
            createAlias("rt.baseDepartment","rb")
            eq("rb.id",baseDepartment.id)
            between("jobDate",localTime-7,localTime-1)
            order(params.sort,params.order)
            maxResults(params.max.toInteger())
            firstResult(params.offset.toInteger())
        }
        def slist=[];
        list.each{
            def one=[:]
            one.id=it.id
            one.jobDate=it.jobDate.format("yyyy-MM-dd")
            one.rotation=it.rotation.name
            one.position=it.position.name
            one.type=it.type
            one.isFinish="未完成"
            if(it.isFinish){
                one.isFinish="完成"
            }
            slist<<one;
        }
        map.total=count;
        map.rows=slist;
        render map as JSON;
    }
    //异常工单
    def teamExceptionJobJson()
    {
        params.max = Math.min(params.limit ? params.int('limit') : 10, 100);
        params.limit=params.max;
        if(!params.offset) params.offset ='0'
        if(!params.sort) params.sort ='id'
        if(!params.order) params.order ='desc'
        def map=[:]
        def currentUser= BaseUser.get(springSecurityService.currentUser.id)
        def baseDepartment=currentUser.baseDepartment;
        def rotations=Rotation.findAllByBaseDepartment(baseDepartment);
        def count=JobItem.createCriteria().count {
            createAlias("jobOrder","jo")
            createAlias("jo.rotation","rt")
            createAlias("rt.baseDepartment","rb")
            eq("rb.id",baseDepartment.id)
            eq('isWrong',true)
        }
        def list=JobItem.createCriteria().list{
            createAlias("jobOrder","jo")
            createAlias("jo.rotation","rt")
            createAlias("rt.baseDepartment","rb")
            eq("rb.id",baseDepartment.id)
            eq('isWrong',true)
            order(params.sort,params.order)
            maxResults(params.max.toInteger())
            firstResult(params.offset.toInteger())
        }
        def slist=[];
        list.each{
            def one=[:]
            one.id=it.id
            one.jobDate=it.jobOrder.jobDate.format("yyyy-MM-dd")
            one.rotation=it.jobOrder.rotation.name
            one.position=it.jobOrder.position.name
            one.equipment = it.equipment.name
            one.standardItem = it.standardItem.name;
            one.type=it.jobOrder.type
            one.isWrong = it.isWrong;
            one.checkResult = it.checkResult;
            slist<<one;
        }
        map.total=count;
        map.rows=slist;
        render map as JSON;
    }
    def catchOneJobOrderDetail(){
       def jobOrder=JobOrder.get(params.id);
       return [items:JobItem.findAllByJobOrder(jobOrder,['sort':'id','order':'asc'])]
    }
}
