<script src="${request.contextPath}/js/Highcharts-4.1.6/js/highcharts.js"></script>
<!--<script src="${request.contextPath}/js/Highcharts-4.1.6/js/themes/dark-unica.js"></script>-->
<script src="${request.contextPath}/js/Highcharts-4.1.6/js/highcharts-3d.js"></script>
<script src="${request.contextPath}/js/Highcharts-4.1.6/js/highcharts-more.js"></script>
<script src="${request.contextPath}/js/Highcharts-4.1.6/js/modules/exporting.js"></script>

<script src="${request.contextPath}/js/Highmaps-1.1.6/js/modules/map.js"></script>
<script src="${request.contextPath}/js/Highmaps-1.1.6/mapData/world-highres.js"></script>
<script src="${request.contextPath}/js/Highmaps-1.1.6/relayJs/proj4.js"></script>
<script type="text/javascript">
    $(function () {
        /**
         * Dark theme for Highcharts JS
         * @author Torstein Honsi
         */
        $.post("${request.contextPath}/workspace/statusDataJson", null,
                function (data, textStatus) {
                    $('#easypiechart-blue').data('easyPieChart').update(data.teamPrecent);//小队开工率
                    $('#easypiechart-blue').find(".percent").text(data.teamPrecent + "%");

                    $('#easypiechart-orange').data('easyPieChart').update(data.checkJobPrecent);//检查工单执行率
                    $('#easypiechart-orange').find(".percent").text(data.checkJobPrecent + "%");

                    $('#easypiechart-teal').data('easyPieChart').update(data.maintainJobPrecent);//保养工单执行率
                    $('#easypiechart-teal').find(".percent").text(data.maintainJobPrecent + "%");

                    $('#easypiechart-red').data('easyPieChart').update(data.equipmentPrecent);//设备健康率
                    $('#easypiechart-red').find(".percent").text(data.equipmentPrecent + "%");
                }, "json");

/*
// Load the fonts
        Highcharts.createElement('link', {
            href: '//fonts.googleapis.com/css?family=Unica+One',
            rel: 'stylesheet',
            type: 'text/css'
        }, null, document.getElementsByTagName('head')[0]);
*/

        Highcharts.theme = {
            colors: ["#2b908f", "#90ee7e", "#f45b5b", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee",
                "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
            chart: {
                backgroundColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
                    stops: [
                        [0, '#2a2a2b'],
                        [1, '#3e3e40']
                    ]
                },
                style: {
                    fontFamily: "'Unica One', sans-serif"
                },
                plotBorderColor: '#606063'
            },
            title: {
                style: {
                    color: '#E0E0E3',
                    textTransform: 'uppercase',
                    fontSize: '20px'
                }
            },
            subtitle: {
                style: {
                    color: '#E0E0E3',
                    textTransform: 'uppercase'
                }
            },
            xAxis: {
                gridLineColor: '#707073',
                labels: {
                    style: {
                        color: '#E0E0E3'
                    }
                },
                lineColor: '#707073',
                minorGridLineColor: '#505053',
                tickColor: '#707073',
                title: {
                    style: {
                        color: '#A0A0A3'

                    }
                }
            },
            yAxis: {
                gridLineColor: '#707073',
                labels: {
                    style: {
                        color: '#E0E0E3'
                    }
                },
                lineColor: '#707073',
                minorGridLineColor: '#505053',
                tickColor: '#707073',
                tickWidth: 1,
                title: {
                    style: {
                        color: '#A0A0A3'
                    }
                }
            },
            tooltip: {
                backgroundColor: 'rgba(0, 0, 0, 0.85)',
                style: {
                    color: '#F0F0F0'
                }
            },
            plotOptions: {
                series: {
                    dataLabels: {
                        color: '#B0B0B3'
                    },
                    marker: {
                        lineColor: '#333'
                    }
                },
                boxplot: {
                    fillColor: '#505053'
                },
                candlestick: {
                    lineColor: 'white'
                },
                errorbar: {
                    color: 'white'
                }
            },
            legend: {
                itemStyle: {
                    color: '#E0E0E3'
                },
                itemHoverStyle: {
                    color: '#FFF'
                },
                itemHiddenStyle: {
                    color: '#606063'
                }
            },
            credits: {
                style: {
                    color: '#666'
                }
            },
            labels: {
                style: {
                    color: '#707073'
                }
            },

            drilldown: {
                activeAxisLabelStyle: {
                    color: '#F0F0F3'
                },
                activeDataLabelStyle: {
                    color: '#F0F0F3'
                }
            },

            navigation: {
                buttonOptions: {
                    symbolStroke: '#DDDDDD',
                    theme: {
                        fill: '#505053'
                    }
                }
            },

            // scroll charts
            rangeSelector: {
                buttonTheme: {
                    fill: '#505053',
                    stroke: '#000000',
                    style: {
                        color: '#CCC'
                    },
                    states: {
                        hover: {
                            fill: '#707073',
                            stroke: '#000000',
                            style: {
                                color: 'white'
                            }
                        },
                        select: {
                            fill: '#000003',
                            stroke: '#000000',
                            style: {
                                color: 'white'
                            }
                        }
                    }
                },
                inputBoxBorderColor: '#505053',
                inputStyle: {
                    backgroundColor: '#333',
                    color: 'silver'
                },
                labelStyle: {
                    color: 'silver'
                }
            },

            navigator: {
                handles: {
                    backgroundColor: '#666',
                    borderColor: '#AAA'
                },
                outlineColor: '#CCC',
                maskFill: 'rgba(255,255,255,0.1)',
                series: {
                    color: '#7798BF',
                    lineColor: '#A6C7ED'
                },
                xAxis: {
                    gridLineColor: '#505053'
                }
            },

            scrollbar: {
                barBackgroundColor: '#808083',
                barBorderColor: '#808083',
                buttonArrowColor: '#CCC',
                buttonBackgroundColor: '#606063',
                buttonBorderColor: '#606063',
                rifleColor: '#FFF',
                trackBackgroundColor: '#404043',
                trackBorderColor: '#404043'
            },

            // special colors for some of the
            legendBackgroundColor: 'rgba(0, 0, 0, 0.5)',
            background2: '#505053',
            dataLabelsColor: '#B0B0B3',
            textColor: '#C0C0C0',
            contrastTextColor: '#F0F0F3',
            maskColor: 'rgba(255,255,255,0.3)'
        };

// Apply the theme
        Highcharts.setOptions(Highcharts.theme);


        $.post("${request.contextPath}/workspace/mapDataJson", null,
                function (data, textStatus) {
                    // Initiate the chart
                    $('#containerMap').highcharts('Map', {
                        credits:{
                            enabled:false
                        },
                        exporting:{
                            enabled:false
                        },
                        chart: {
                            backgroundColor: 'rgba(0,0,0,0)'
                        },
                        title : {
                            text : ''
                            ,style:{color:'white'}
                        },
                        mapNavigation: {
                            enabled: true,
                            buttonOptions: {
                                verticalAlign: 'bottom'
                            }
                        },
                        legend:{
                            enabled: false,
                            style:{color:'white'}
                        },
                        colorAxis: {
                            min: 0
                        },

                        series : [{
                            data : data.world,
                            mapData: Highcharts.maps['custom/world-highres'],
                            joinBy: 'hc-key',
                            name: 'Country',
                            tooltip: {
                                pointFormat: '{point.name}'
                            },
                            states: {
                                hover: {
                                    color: '#BADA55'
                                }
                            },
                            dataLabels: {
                                enabled: false,
                                format: '{point.name}'
                            }
                        }, {

                            type: 'mapbubble',
                            dataLabels: {
                                enabled: true,
                                color:'white',
                                format: '<br/><p style="color: #ffcc00">{point.capital}</p>'
                            },
                            name: '<span style="color:white">开工小队</span>',
                            tooltip: {
                                pointFormat: '{point.capital}'
                            },
                            color: 'green',
                            maxSize: '12%',
                            data: data.well
                        }, {
                            type: 'mapbubble',
                            dataLabels: {
                                enabled: true,
                                color:'white',
                                format: '<br/><p style="color: #ffcc00">{point.capital}</p>'
                            },
                            name: '<span style="color:white">停工小队</span>',
                            tooltip: {
                                pointFormat: '{point.capital}'
                            },
                            color: 'red',
                            maxSize: '12%',
                            data: data.bad
                        }]
                    });
                }, "json");

        /**
         * 3D 柱状图
         *
         */
        $.post("${request.contextPath}/workspace/chartDataJson", null,
                function (data, textStatus) {
                    var chart = new Highcharts.Chart({
                        credits:{
                            enabled:false
                        },
                        exporting:{
                            enabled:false
                        },
                        chart: {
                            renderTo: 'container0',
                            backgroundColor: 'rgba(0,0,0,0)',
                            type: 'column',
                            margin: 75,
                            options3d: {
                                enabled: true,
                                alpha: 15,
                                beta: 15,
                                depth: 50,
                                viewDistance: 25
                            }
                        },
                        legend:{
                            backgroundColor:'white'
                        },
                        title: {
                            text: '项目部分类统计'
                            ,style:{color:'white'}
                        },
                        plotOptions: {
                            column: {
                                depth: 25
                            }
                        },
                        xAxis:{
                            categories: data.categories
                        },
                        series: data.series
                    });

                    // Add mouse events for rotation
                    $(chart.container).bind('mousedown.hc touchstart.hc', function (e) {
                        e = chart.pointer.normalize(e);

                        var posX = e.pageX,
                                posY = e.pageY,
                                alpha = chart.options.chart.options3d.alpha,
                                beta = chart.options.chart.options3d.beta,
                                newAlpha,
                                newBeta,
                                sensitivity = 5; // lower is more sensitive

                        $(document).bind({
                            'mousemove.hc touchdrag.hc': function (e) {
                                // Run beta
                                newBeta = beta + (posX - e.pageX) / sensitivity;
                                newBeta = Math.min(100, Math.max(-100, newBeta));
                                chart.options.chart.options3d.beta = newBeta;

                                // Run alpha
                                newAlpha = alpha + (e.pageY - posY) / sensitivity;
                                newAlpha = Math.min(100, Math.max(-100, newAlpha));
                                chart.options.chart.options3d.alpha = newAlpha;

                                chart.redraw(false);
                            },
                            'mouseup touchend': function () {
                                $(document).unbind('.hc');
                            }
                        });
                    });
                }, "json");



        $.post("${request.contextPath}/workspace/barChartJson", null,
                function (data, textStatus) {
                    $('#container1').highcharts({
                        credits:{
                            enabled:false
                        },
                        exporting:{
                            enabled:false
                        },
                        chart: {
                            type: 'pie',
                            backgroundColor: 'rgba(0,0,0,0)',
                            options3d: {
                                enabled: true,
                                alpha: 45,
                                beta: 0
                            }
                        },
                        legend:{
                            backgroundColor:'white'
                        },
                        title: {
                            text: ''
                            ,style:{color:'white'}
                        },
                        tooltip: {
                            pointFormat: '{series.name}: <b>{point.y:.1f}</b>(<b>{point.percentage:.1f}</b>%)'
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                depth: 35,
                                dataLabels: {
                                    enabled: true,
                                    format: '{point.name}'
                                }
                            }
                        },
                        series: [{
                            type: 'pie',
                            name: '工单数量',
                            data: data.jobOrder
                        }]
                    });

                    $('#container2').highcharts({
                        credits:{
                            enabled:false
                        },
                        exporting:{
                            enabled:false
                        },
                        chart: {
                            type: 'pie',
                            backgroundColor: 'rgba(0,0,0,0)',
                            options3d: {
                                enabled: true,
                                alpha: 45,
                                beta: 0
                            }
                        },
                        legend:{
                            backgroundColor:'white'
                        },
                        title: {
                            text: ''
                            ,style:{color:'white'}
                        },
                        tooltip: {
                            pointFormat: '{series.name}: <b>{point.y:.1f}</b>(<b>{point.percentage:.1f}</b>%)'
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                depth: 35,
                                dataLabels: {
                                    enabled: true,
                                    format: '{point.name}'
                                }
                            }
                        },
                        series: [{
                            type: 'pie',
                            name: '设备数量',
                            data: data.equipment
                        }]
                    });
                }, "json");
    });
</script>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="canvas-wrapper">
                    <div id="containerMap" ></div>
                </div>
            </div>
        </div>
    </div>
</div><!--/.row-->
<div class="row">
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">小队开工率</div>
            <div class="panel-body easypiechart-panel">
                <div class="easypiechart" id="easypiechart-blue" ><span class="percent"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">检查工单执行率</div>
            <div class="panel-body easypiechart-panel">
                <div class="easypiechart" id="easypiechart-orange" ><span class="percent"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">保养工单执行率</div>
            <div class="panel-body easypiechart-panel">
                <div class="easypiechart" id="easypiechart-teal" ><span class="percent"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">设备健康率</div>
            <div class="panel-body easypiechart-panel">
                <div class="easypiechart" id="easypiechart-red" ><span class="percent"></span>
                </div>
            </div>
        </div>
    </div>
</div><!--/.row-->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">分类统计</div>
            <div class="panel-body">
                <div class="canvas-wrapper">
                    <div id="container0" ></div>
                </div>
            </div>
        </div>
    </div>
</div><!--/.row-->

<div class="row">
    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">工单分类</div>
            <div class="panel-body">
                <div class="canvas-wrapper">
                    <div id="container1" ></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">设备状况</div>
            <div class="panel-body">
                <div class="canvas-wrapper">
                    <div id="container2" ></div>
                </div>
            </div>
        </div>
    </div>
</div><!--/.row-->