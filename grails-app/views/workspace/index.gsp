<%@ page import="com.petrodata.pms.equipment.Equipment; com.petrodata.pms.equipment.EquipmentCatagory" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="luminoPro">
    <%
        /*
        def dealChildren={ec1,code1->
            def list=EquipmentCatagory.findAllByParent(ec1,['sort':'id','order':'asc']);
            if(list?.size()>0){
                list.eachWithIndex{ec,i->
                    Integer code=100+i+1;
                    ec.code=code1+code;
                    ec.save(flush: true)
                    dealChildren(ec,code1+code);
                }
            }
        }


        com.petrodata.pms.equipment.EquipmentCatagory.findAllByParentIsNull(['sort':'id','order':'asc']).eachWithIndex{ec,i->
            Integer code=100+i+1;
            ec.code=code.toString();
            ec.save(flush: true);
            dealChildren(ec,code.toString());
        }
           */
        /*
        com.petrodata.pms.equipment.Equipment.list(['sort':'id','order':'asc']).eachWithIndex { Equipment entry, int i ->
            entry.code=' ';
            entry.save(flush: true);
        }
        com.petrodata.pms.equipment.Equipment.list(['sort':'id','order':'asc']).eachWithIndex { Equipment entry, int i ->
            def code=entry.equipmentCatagory.code.trim();
            boolean ok=false;
            for(int m=0;m<100;m++){
                def code1=(code.toString()+(101+i).toString()+((m+1).toString().padLeft(2,'0'))).padRight(200,' ');
                if(!ok){
                    if(Equipment.countByCode(code)==0){
                        entry.code=code1;
                        entry.save(flush: true);
                        ok=true;
                    }
                }
            }
        }
        */
    %>

</head>

<body>

<div class="row">
    <ol class="breadcrumb">

    </ol>
</div><!--/.row-->

<sec:ifAnyGranted roles="ROLE_MANAGER">
    <g:render template="manager"/>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_PROJECT">
    <g:render template="project"/>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_CAPTAIN">
    <g:render template="captain"/>
</sec:ifAnyGranted>


</body>
</html>