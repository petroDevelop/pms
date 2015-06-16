<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="luminoPro">
</head>

<body>

<div class="row">
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>

    </ol>
</div><!--/.row-->

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">首页</h1>
    </div>
</div><!--/.row-->
<div class="row">
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">New Orders</div>
            <div class="panel-body easypiechart-panel">
                <div class="easypiechart" id="easypiechart-blue" data-percent="92" ><span class="percent">92%</span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">Comments</div>
            <div class="panel-body easypiechart-panel">
                <div class="easypiechart" id="easypiechart-orange" data-percent="65" ><span class="percent">65%</span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">New Users</div>
            <div class="panel-body easypiechart-panel">
                <div class="easypiechart" id="easypiechart-teal" data-percent="56" ><span class="percent">56%</span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">Visitors</div>
            <div class="panel-body easypiechart-panel">
                <div class="easypiechart" id="easypiechart-red" data-percent="27" ><span class="percent">27%</span>
                </div>
            </div>
        </div>
    </div>
</div><!--/.row-->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Bar Chart</div>
            <div class="panel-body">
                <div class="canvas-wrapper">
                    <canvas class="main-chart" id="bar-chart" height="200" width="600"></canvas>
                </div>
            </div>
        </div>
    </div>
</div><!--/.row-->

<div class="row">
    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">Pie Chart</div>
            <div class="panel-body">
                <div class="canvas-wrapper">
                    <canvas class="chart" id="pie-chart" ></canvas>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">Doughnut Chart</div>
            <div class="panel-body">
                <div class="canvas-wrapper">
                    <canvas class="chart" id="doughnut-chart" ></canvas>
                </div>
            </div>
        </div>
    </div>
</div><!--/.row-->

<script>
    window.onload = function(){
        var chart2 = document.getElementById("bar-chart").getContext("2d");
        window.myBar = new Chart(chart2).Bar(barChartData, {
            responsive : true,
            scaleLineColor: "rgba(255,255,255,.2)",
            scaleGridLineColor: "rgba(255,255,255,.05)",
            scaleFontColor: "#ffffff"
        });
        var chart3 = document.getElementById("doughnut-chart").getContext("2d");
        window.myDoughnut = new Chart(chart3).Doughnut(doughnutData, {
            responsive : true,
            segmentShowStroke : false
        });
        var chart4 = document.getElementById("pie-chart").getContext("2d");
        window.myPie = new Chart(chart4).Pie(pieData, {
            responsive : true,
            segmentShowStroke : false
        });

    };
</script>
</body>
</html>