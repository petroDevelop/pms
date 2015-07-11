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
        // Prepare demo data
        var data = [
            {
                "hc-key": "dz",
                "value": 0
            },
            {
                "hc-key": "ao",
                "value": 1
            },
            {
                "hc-key": "eg",
                "value": 2
            },
            {
                "hc-key": "bd",
                "value": 3
            },
            {
                "hc-key": "ne",
                "value": 4
            },
            {
                "hc-key": "qa",
                "value": 5
            },
            {
                "hc-key": "na",
                "value": 6
            },
            {
                "hc-key": "bg",
                "value": 7
            },
            {
                "hc-key": "bo",
                "value": 8
            },
            {
                "hc-key": "gh",
                "value": 9
            },
            {
                "hc-key": "pk",
                "value": 10
            },
            {
                "hc-key": "pa",
                "value": 11
            },
            {
                "hc-key": "hn",
                "value": 12
            },
            {
                "hc-key": "jo",
                "value": 13
            },
            {
                "hc-key": "eh",
                "value": 14
            },
            {
                "hc-key": "ly",
                "value": 15
            },
            {
                "hc-key": "my",
                "value": 16
            },
            {
                "hc-key": "pr",
                "value": 17
            },
            {
                "hc-key": "kp",
                "value": 18
            },
            {
                "hc-key": "tz",
                "value": 19
            },
            {
                "hc-key": "pt",
                "value": 20
            },
            {
                "hc-key": "kh",
                "value": 21
            },
            {
                "hc-key": "py",
                "value": 22
            },
            {
                "hc-key": "sa",
                "value": 23
            },
            {
                "hc-key": "me",
                "value": 24
            },
            {
                "hc-key": "si",
                "value": 25
            },
            {
                "hc-key": "bf",
                "value": 26
            },
            {
                "hc-key": "ch",
                "value": 27
            },
            {
                "hc-key": "mr",
                "value": 28
            },
            {
                "hc-key": "hr",
                "value": 29
            },
            {
                "hc-key": "cl",
                "value": 30
            },
            {
                "hc-key": "cn",
                "value": 31
            },
            {
                "hc-key": "kn",
                "value": 32
            },
            {
                "hc-key": "jm",
                "value": 33
            },
            {
                "hc-key": "dj",
                "value": 34
            },
            {
                "hc-key": "gn",
                "value": 35
            },
            {
                "hc-key": "fi",
                "value": 36
            },
            {
                "hc-key": "uy",
                "value": 37
            },
            {
                "hc-key": "va",
                "value": 38
            },
            {
                "hc-key": "np",
                "value": 39
            },
            {
                "hc-key": "ma",
                "value": 40
            },
            {
                "hc-key": "ye",
                "value": 41
            },
            {
                "hc-key": "ph",
                "value": 42
            },
            {
                "hc-key": "za",
                "value": 43
            },
            {
                "hc-key": "ni",
                "value": 44
            },
            {
                "hc-key": "cyn",
                "value": 45
            },
            {
                "hc-key": "vi",
                "value": 46
            },
            {
                "hc-key": "sy",
                "value": 47
            },
            {
                "hc-key": "li",
                "value": 48
            },
            {
                "hc-key": "kz",
                "value": 49
            },
            {
                "hc-key": "mn",
                "value": 50
            },
            {
                "hc-key": "sr",
                "value": 51
            },
            {
                "hc-key": "ie",
                "value": 52
            },
            {
                "hc-key": "dm",
                "value": 53
            },
            {
                "hc-key": "bj",
                "value": 54
            },
            {
                "hc-key": "ng",
                "value": 55
            },
            {
                "hc-key": "be",
                "value": 56
            },
            {
                "hc-key": "tg",
                "value": 57
            },
            {
                "hc-key": "de",
                "value": 58
            },
            {
                "hc-key": "lk",
                "value": 59
            },
            {
                "hc-key": "gb",
                "value": 60
            },
            {
                "hc-key": "mw",
                "value": 61
            },
            {
                "hc-key": "cr",
                "value": 62
            },
            {
                "hc-key": "cm",
                "value": 63
            },
            {
                "hc-key": "kas",
                "value": 64
            },
            {
                "hc-key": "km",
                "value": 65
            },
            {
                "hc-key": "ug",
                "value": 66
            },
            {
                "hc-key": "tm",
                "value": 67
            },
            {
                "hc-key": "tt",
                "value": 68
            },
            {
                "hc-key": "nl",
                "value": 69
            },
            {
                "hc-key": "td",
                "value": 70
            },
            {
                "hc-key": "ge",
                "value": 71
            },
            {
                "hc-key": "ro",
                "value": 72
            },
            {
                "hc-key": "scr",
                "value": 73
            },
            {
                "hc-key": "lv",
                "value": 74
            },
            {
                "hc-key": "bz",
                "value": 75
            },
            {
                "hc-key": "mm",
                "value": 76
            },
            {
                "hc-key": "af",
                "value": 77
            },
            {
                "hc-key": "bi",
                "value": 78
            },
            {
                "hc-key": "by",
                "value": 79
            },
            {
                "hc-key": "gd",
                "value": 80
            },
            {
                "hc-key": "lr",
                "value": 81
            },
            {
                "hc-key": "gr",
                "value": 82
            },
            {
                "hc-key": "ls",
                "value": 83
            },
            {
                "hc-key": "gl",
                "value": 84
            },
            {
                "hc-key": "ad",
                "value": 85
            },
            {
                "hc-key": "mz",
                "value": 86
            },
            {
                "hc-key": "tj",
                "value": 87
            },
            {
                "hc-key": "th",
                "value": 88
            },
            {
                "hc-key": "ht",
                "value": 89
            },
            {
                "hc-key": "mx",
                "value": 90
            },
            {
                "hc-key": "zw",
                "value": 91
            },
            {
                "hc-key": "lc",
                "value": 92
            },
            {
                "hc-key": "in",
                "value": 93
            },
            {
                "hc-key": "vc",
                "value": 94
            },
            {
                "hc-key": "bt",
                "value": 95
            },
            {
                "hc-key": "vn",
                "value": 96
            },
            {
                "hc-key": "no",
                "value": 97
            },
            {
                "hc-key": "cz",
                "value": 98
            },
            {
                "hc-key": "ag",
                "value": 99
            },
            {
                "hc-key": "fj",
                "value": 100
            },
            {
                "hc-key": "ir",
                "value": 101
            },
            {
                "hc-key": "mu",
                "value": 102
            },
            {
                "hc-key": "do",
                "value": 103
            },
            {
                "hc-key": "lu",
                "value": 104
            },
            {
                "hc-key": "il",
                "value": 105
            },
            {
                "hc-key": "sm",
                "value": 106
            },
            {
                "hc-key": "pe",
                "value": 107
            },
            {
                "hc-key": "id",
                "value": 108
            },
            {
                "hc-key": "vu",
                "value": 109
            },
            {
                "hc-key": "mk",
                "value": 110
            },
            {
                "hc-key": "cd",
                "value": 111
            },
            {
                "hc-key": "cg",
                "value": 112
            },
            {
                "hc-key": "is",
                "value": 113
            },
            {
                "hc-key": "et",
                "value": 114
            },
            {
                "hc-key": "um",
                "value": 115
            },
            {
                "hc-key": "co",
                "value": 116
            },
            {
                "hc-key": "ser",
                "value": 117
            },
            {
                "hc-key": "bw",
                "value": 118
            },
            {
                "hc-key": "md",
                "value": 119
            },
            {
                "hc-key": "mg",
                "value": 120
            },
            {
                "hc-key": "ec",
                "value": 121
            },
            {
                "hc-key": "sn",
                "value": 122
            },
            {
                "hc-key": "tl",
                "value": 123
            },
            {
                "hc-key": "fr",
                "value": 124
            },
            {
                "hc-key": "lt",
                "value": 125
            },
            {
                "hc-key": "rw",
                "value": 126
            },
            {
                "hc-key": "zm",
                "value": 127
            },
            {
                "hc-key": "se",
                "value": 128
            },
            {
                "hc-key": "fo",
                "value": 129
            },
            {
                "hc-key": "gt",
                "value": 130
            },
            {
                "hc-key": "dk",
                "value": 131
            },
            {
                "hc-key": "ua",
                "value": 132
            },
            {
                "hc-key": "au",
                "value": 133
            },
            {
                "hc-key": "at",
                "value": 134
            },
            {
                "hc-key": "ve",
                "value": 135
            },
            {
                "hc-key": "pw",
                "value": 136
            },
            {
                "hc-key": "ke",
                "value": 137
            },
            {
                "hc-key": "la",
                "value": 138
            },
            {
                "hc-key": "bjn",
                "value": 139
            },
            {
                "hc-key": "tr",
                "value": 140
            },
            {
                "hc-key": "jp",
                "value": 141
            },
            {
                "hc-key": "al",
                "value": 142
            },
            {
                "hc-key": "om",
                "value": 143
            },
            {
                "hc-key": "it",
                "value": 144
            },
            {
                "hc-key": "bn",
                "value": 145
            },
            {
                "hc-key": "tn",
                "value": 146
            },
            {
                "hc-key": "hu",
                "value": 147
            },
            {
                "hc-key": "ru",
                "value": 148
            },
            {
                "hc-key": "lb",
                "value": 149
            },
            {
                "hc-key": "bb",
                "value": 150
            },
            {
                "hc-key": "br",
                "value": 151
            },
            {
                "hc-key": "ci",
                "value": 152
            },
            {
                "hc-key": "rs",
                "value": 153
            },
            {
                "hc-key": "gq",
                "value": 154
            },
            {
                "hc-key": "us",
                "value": 155
            },
            {
                "hc-key": "tw",
                "value": 156
            },
            {
                "hc-key": "az",
                "value": 157
            },
            {
                "hc-key": "gw",
                "value": 158
            },
            {
                "hc-key": "sz",
                "value": 159
            },
            {
                "hc-key": "ca",
                "value": 160
            },
            {
                "hc-key": "gy",
                "value": 161
            },
            {
                "hc-key": "kv",
                "value": 162
            },
            {
                "hc-key": "kr",
                "value": 163
            },
            {
                "hc-key": "er",
                "value": 164
            },
            {
                "hc-key": "sk",
                "value": 165
            },
            {
                "hc-key": "cy",
                "value": 166
            },
            {
                "hc-key": "ba",
                "value": 167
            },
            {
                "hc-key": "pga",
                "value": 168
            },
            {
                "hc-key": "sg",
                "value": 169
            },
            {
                "hc-key": "so",
                "value": 170
            },
            {
                "hc-key": "sol",
                "value": 171
            },
            {
                "hc-key": "uz",
                "value": 172
            },
            {
                "hc-key": "cf",
                "value": 173
            },
            {
                "hc-key": "pl",
                "value": 174
            },
            {
                "hc-key": "kw",
                "value": 175
            },
            {
                "hc-key": "gm",
                "value": 176
            },
            {
                "hc-key": "ga",
                "value": 177
            },
            {
                "hc-key": "ee",
                "value": 178
            },
            {
                "hc-key": "es",
                "value": 179
            },
            {
                "hc-key": "iq",
                "value": 180
            },
            {
                "hc-key": "sv",
                "value": 181
            },
            {
                "hc-key": "ml",
                "value": 182
            },
            {
                "hc-key": "st",
                "value": 183
            },
            {
                "hc-key": "mt",
                "value": 184
            },
            {
                "hc-key": "sl",
                "value": 185
            },
            {
                "hc-key": "cnm",
                "value": 186
            },
            {
                "hc-key": "sd",
                "value": 187
            },
            {
                "hc-key": "sb",
                "value": 188
            },
            {
                "hc-key": "nz",
                "value": 189
            },
            {
                "hc-key": "mc",
                "value": 190
            },
            {
                "hc-key": "ss",
                "value": 191
            },
            {
                "hc-key": "kg",
                "value": 192
            },
            {
                "hc-key": "ae",
                "value": 193
            },
            {
                "hc-key": "ar",
                "value": 194
            },
            {
                "hc-key": "bs",
                "value": 195
            },
            {
                "hc-key": "bh",
                "value": 196
            },
            {
                "hc-key": "am",
                "value": 197
            },
            {
                "hc-key": "pg",
                "value": 198
            },
            {
                "hc-key": "cu",
                "value": 199
            }
        ];



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
                            text : '小队分布图'
                            ,style:{color:'white'}
                        },
                        mapNavigation: {
                            enabled: true,
                            buttonOptions: {
                                verticalAlign: 'bottom'
                            }
                        },
                        legend:{
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
                            states: {
                                hover: {
                                    color: '#BADA55'
                                }
                            },
                            dataLabels: {
                                enabled: true,
                                format: '{point.name}'
                            }
                        }, {

                            type: 'mapbubble',
                            dataLabels: {
                                enabled: true,
                                color:'white',
                                format: '{point.capital}'
                            },
                            name: '<span style="color:white">开工小队</span>',
                            color: 'green',
                            maxSize: '12%',
                            data: data.well
                        }, {

                            type: 'mapbubble',
                            dataLabels: {
                                enabled: true,
                                color:'white',
                                format: '{point.capital}'
                            },
                            name: '<span style="color:white">停工小队</span>',
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
                text: 'Browser market shares at a specific website, 2014'
                ,style:{color:'white'}
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
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
                name: 'Browser share',
                data: [
                    ['Firefox',   45.0],
                    ['IE',       26.8],
                    {
                        name: 'Chrome',
                        y: 12.8,
                        sliced: true,
                        selected: true
                    },
                    ['Safari',    8.5],
                    ['Opera',     6.2],
                    ['Others',   0.7]
                ]
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
                text: 'Browser market shares at a specific website, 2014'
                ,style:{color:'white'}
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
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
                name: 'Browser share',
                data: [
                    ['Firefox',   45.0],
                    ['IE',       26.8],
                    {
                        name: 'Chrome',
                        y: 12.8,
                        sliced: true,
                        selected: true
                    },
                    ['Safari',    8.5],
                    ['Opera',     6.2],
                    ['Others',   0.7]
                ]
            }]
        });
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
            <div class="panel-heading">工单比例</div>
            <div class="panel-body">
                <div class="canvas-wrapper">
                    <div id="container1" ></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">设备比例</div>
            <div class="panel-body">
                <div class="canvas-wrapper">
                    <div id="container2" ></div>
                </div>
            </div>
        </div>
    </div>
</div><!--/.row-->