<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="luminoPro">
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