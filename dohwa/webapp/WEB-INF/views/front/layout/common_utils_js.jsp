<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%--추후 commonUtils.js 파일로 옮길 예정 --%>
		<script>

		// 공통 유틸리티
		var CommonUtils = (function(){
			//파일 ID를 기준으로 파일 다운로드 하기
			function downloadByFileId(fileId, isNewWindow) {
				if(typeof isNewWindow === 'boolean' && isNewWindow === true){
					window.open('/download/file/'+StringUtils.nvl(fileId));	
				} else {
					if($('#aDownloadByFileIdTargetIrame').length == 0){
						$('body').append('<iframe id="aDownloadByFileIdTargetIrame" name="aDownloadByFileIdTargetIrame" style="display:none"></iframe>');
					}
					$('#aDownloadByFileIdTargetIrame').attr('src', '/download/file/'+StringUtils.nvl(fileId));
				}
			}

			// 쿠키정보비교
			function compareCookie(cookieName, compVal) {
				var cVal = getCookie(cookieName);
				if(!StringUtils.isEmpty(cVal) && cVal == compVal){
					return true;
				} else {
					return false;
				}
			}

			// 쿠키정보 가져오기
			function getCookie(name) {
				var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		        return value? value[2] : null;
			}

			//쿠키 정보 심기
			function setCookie(name, value, day) {
				var date = new Date();
		        date.setTime(date.getTime() + day * 60 * 60 * 24 * 1000);
		        document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
			}
			
			//언어변경
			function chgLang(lang) {

			    // ------------------------------------------------------------------
			    // 1) 현재 URL
			    // ------------------------------------------------------------------
			    var curUrl = location.href;
			
			    var isDirectorPage =
			        curUrl.indexOf('/invest/director') > -1 ||
			        $("a.item[href$='/invest/director']").length > 0 ||
			        $(".tab-list li.active a[href*='/invest/director']").length > 0;
			
			    // ------------------------------------------------------------------
			    // 2) 지금 언어가 한국어가 아니고, director 페이지라면 → 강제 이동!
			    // ------------------------------------------------------------------
			    if (lang !== 'ko' && isDirectorPage) {
			        var redirectUrl = curUrl.replace('/invest/director', '/invest/finance');
			
			        // 언어 파라미터 적용
			        redirectUrl = SnsUtils.rplaceQueryString(redirectUrl, 'lang', lang);
			
			        location.href = redirectUrl;
			        return; // ❗ 중요한 부분: 여기서 함수 종료해야 중복 로직 방지됨
			    }
			
			
			    // ------------------------------------------------------------------
			    // 3) 일반적인 언어 변경 로직 (원래 너 코드)
			    // ------------------------------------------------------------------
			
			    var bfSplitUrl = location.href
			        .replace('prroom/press', 'main');
			
			    var arrUrl = bfSplitUrl.split('?');
			
			    var uri = '';
			    var qs = '';
			    if (arrUrl.length > 1) {
			        uri = arrUrl[0].split('#')[0];
			        qs = arrUrl[1] ? '?' + arrUrl[1] : '';
			    } else {
			        uri = arrUrl[0].split('#')[0];
			    }
			    var url = uri + qs;
			
			
			    // tab 유지 처리 (기존 코드 그대로 유지)
			    try {
			        var arrTabIdx = [];
			
			        $('ul.tab-list:first li').each(function (i, o) {
			            if ($(o).hasClass('active') &&
			                !($(o).find('a').attr('href') || '').startsWith('/')) {
			                arrTabIdx.push(i);
			            }
			        });
			
			        if ($('ul.tab-list').length > 1) {
			            $('ul.tab-list').each(function (i, o) {
			                if (i > 0 && $(o).closest('.active').length) {
			                    $(o).find('li').each(function (j, x) {
			                        if ($(x).hasClass('active') &&
			                            !($(x).find('a').attr('href') || '').startsWith('/')) {
			                            arrTabIdx.push(j);
			                        }
			                    });
			                }
			            });
			        }
			
			        if ($('ul.tab-list-2depth').length > 0) {
			            arrTabIdx = [];
			            $('ul.tab-list-2depth li').each(function (i, o) {
			                if ($(o).hasClass('active')) arrTabIdx.push(i);
			            });
			        } else if ($('ul.tab-list-3depth').length > 0) {
			            arrTabIdx = [];
			            $('ul.tab-list-3depth li').each(function (i, o) {
			                if ($(o).hasClass('active')) arrTabIdx.push(i);
			            });
			        }
			
			        tabIdx = arrTabIdx.join('');
			        url = SnsUtils.rplaceQueryString(url, 'tabIdx', tabIdx);
			    } catch (e) {
			        console.log('tabIdx error', e);
			    }
			
			    // 마지막으로 lang 적용
			    location.href = SnsUtils.rplaceQueryString(url, 'lang', lang);
			}





			//언어변경 후 탭유지
			function setTabChgLang() {
				try{
					var param = getUrlParams();
					if(param.tabIdx){
						var tabIdx = param.tabIdx;
						autoClickTab(tabIdx, 0); //재귀호출
						
					}
				}catch(e){
					console.log('CommonUtils.setTabChgLang error :: ', e);
				}
				
			}
			
			// 자동 탭클릭
			function autoClickTab(tabIdx, loopIdx) {
				try{
					if(loopIdx === 0 && $('ul.tab-list-3depth').length > 0){ // tab-list-3depth가 있는 경우 예외처리
						$('ul.tab-list-3depth li').each(function(i, o){
							if(Number(i) === Number(tabIdx[loopIdx])){
								$(o).trigger('click');
								if(tabIdx.length-1 > loopIdx){
									autoClickTab(tabIdx, loopIdx+1);
								}
							}
						});
					} else {
						$('ul.tab-list').eq(loopIdx).find('li').each(function(i, o){
							if(Number(i) === Number(tabIdx[loopIdx])){
								$(o).trigger('click');
								if(tabIdx.length-1 > loopIdx){
									autoClickTab(tabIdx, loopIdx+1);
								}
							}
						});
					}
				}catch(e){
					console.log('CommonUtils.autoClickTab error :: ', e);
				}
				
			}
			
			// 현재 url의 querystring을 파싱해서 jsn형태로 리턴
			function getUrlParams() {
			    var params = {};
			    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
			    return params;
			}

			return {
				downloadByFileId: downloadByFileId,
				compareCookie: compareCookie,
				getCookie: getCookie,
				setCookie: setCookie,
				chgLang: chgLang,
				setTabChgLang: setTabChgLang,
				getUrlParams: getUrlParams
			};
		}());

		// 날짜 관련 유틸리티
		var DateUtils = (function(){

			// 현재 시간 가져오기
			function getNowStr(fmt){
				var str = fmt;
				if(StringUtils.isEmpty(fmt)){
					str = 'yyyy-MM-dd HH:mm:ss';
				}
				var today = new Date();
				str = str.replace(/yyyy/g, today.getFullYear());
				str = str.replace(/MM/g, today.getMonth() + 1);
				str = str.replace(/dd/g, today.getDate());
				str = str.replace(/HH/g, today.getHours());
				str = str.replace(/mm/g, today.getMinutes());
				str = str.replace(/ss/g, today.getSeconds());
				return str;
			}

			return {
				getNowStr: getNowStr
			};
		}());

		// StringUtils function
		var StringUtils = (function(){
			function isEmpty(obj){
				if(typeof obj === 'undefined' || obj === null || (typeof obj === 'string' && obj === '') || (typeof obj === 'string' && obj.toLowerCase() === 'null')){
					return true;
				} else{
					return false;
				}
			}

			function nvl(str, repStr) {
				if(StringUtils.isEmpty(str)){
					return StringUtils.isEmpty(repStr) ? '' : repStr ;
				} else {
					return str;
				}
			}

			function stringToNumber(str, repStr) {
				try{
					if(StringUtils.isEmpty(str)){
						return StringUtils.isEmpty(repStr) ? 0 : Number(repStr) ;
					} else {
						return Number(str);
					}
				}catch(e){
					return 0;
				}

			}

			function addComma(num) {
				var regexp = /\B(?=(\d{3})+(?!\d))/g;
				return num.toString().replace(regexp, ',');
			}

			return {
				isEmpty: isEmpty,
				nvl : nvl,
				stringToNumber : stringToNumber,
			};
		}());

		// AMChart 관련 유틸
		var AmChartUtils = (function(){
			// 테마를 사용하지 않은 경우 시리즈별 색상
			var arrSeriesColor = ['#6666FF','#CCCCFF','#FF00FF','#CC99FF','#FFCCCC','#FF66CC','#FFFF33'];
			var arrSeriesTextColor = ['#ffffff','#000000','#ffffff','#ffffff','#000000','#ffffff','#000000'];

			// Create series. createLineChart에서 사용하는 내부 함수
			function createAxisAndSeries(chart, field, name, opposite, bullet) {
				var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
				if(chart.yAxes.indexOf(valueAxis) != 0){
					valueAxis.syncWithAxis = chart.yAxes.getIndex(0);
				}

				var series = chart.series.push(new am4charts.LineSeries());
				series.dataFields.valueY = field;
				series.dataFields.dateX = "date";
				series.strokeWidth = 2;
				series.yAxis = valueAxis;
				series.name = name;
				series.tooltipText = "{name}: [bold]{valueY}[/]";
				series.tensionX = 0.8;
				series.showOnInit = true;

				var interfaceColors = new am4core.InterfaceColorSet();

				switch(bullet) {
					case "triangle":
						var bullet = series.bullets.push(new am4charts.Bullet());
						bullet.width = 12;
						bullet.height = 12;
						bullet.horizontalCenter = "middle";
						bullet.verticalCenter = "middle";
						var triangle = bullet.createChild(am4core.Triangle);
						triangle.stroke = interfaceColors.getFor("background");
						triangle.strokeWidth = 2;
						triangle.direction = "top";
						triangle.width = 12;
						triangle.height = 12;
						break;
					case "rectangle":
						var bullet = series.bullets.push(new am4charts.Bullet());
						var rectangle = bullet.createChild(am4core.Rectangle);
						rectangle.stroke = interfaceColors.getFor("background");
						rectangle.strokeWidth = 2;
						rectangle.width = 10;
						rectangle.height = 10;
						rectangle.horizontalCenter = "middle";
						rectangle.verticalCenter = "middle";
						break;
					case "circle":
						var bullet = series.bullets.push(new am4charts.CircleBullet());
						bullet.circle.stroke = interfaceColors.getFor("background");
						bullet.circle.strokeWidth = 2;
						break;
					default:
						var bullet = series.bullets.push(new am4charts.CircleBullet());
						bullet.circle.fill = am4core.color("#fff");
						bullet.circle.strokeWidth = 2;
						break;
				}
				valueAxis.renderer.line.strokeOpacity = 1;
				valueAxis.renderer.line.strokeWidth = 2;
				valueAxis.renderer.line.stroke = series.stroke;
				valueAxis.renderer.labels.template.fill = series.stroke;
				valueAxis.renderer.opposite = opposite;
			}

			// 라인 불렛 차트 생성
			function createLineBulletsChart(divId, arrData){
				try {
					am4core.useTheme(am4themes_animated);
					am4core.options.commercialLicense = true;

					window[divId] = am4core.create(divId, am4charts.XYChart);
					window[divId].colors.step = 2;
					window[divId].data = arrData;

					window['dateAxis_'+divId] = window[divId].xAxes.push(new am4charts.DateAxis());
					window['dateAxis_'+divId].renderer.minGridDistance = 50;

					if(arrSeries) {
						arrSeries.forEach(function(o, i){
							if(i == 0){
								createAxisAndSeries(window[divId], o.val, o.val, false, "circle");
							} else {
								if((i / 2) == 0){
									createAxisAndSeries(window[divId], o.val, o.val, true, "rectangle");
								} else if((i / 3) == 0){
									createAxisAndSeries(window[divId], o.val, o.val, true, "triangle");
								} else {
									createAxisAndSeries(window[divId], o.val, o.val, true, "");
								}
							}
						});
					}
					window[divId].legend = new am4charts.Legend();
					window[divId].cursor = new am4charts.XYCursor();

				}
				catch( e ) {
					console.log( e );
				}

			}

			// 라인 차트 생성
			function createLineChart(divId, arrData, arrSeries){
				try {

					var isUseTheme = false;

					am4core.useTheme(am4themes_animated);
					am4core.options.commercialLicense = true;

					window[divId] = am4core.create(divId, am4charts.XYChart);
					window[divId].data = arrData;

					window['categoryAxis_'+divId] = window[divId].xAxes.push(new am4charts.CategoryAxis());
					window['categoryAxis_'+divId].dataFields.category = "year";
					//window['categoryAxis_'+divId].renderer.opposite = true;

					// Create value axis
					window['valueAxis_'+divId] = window[divId].yAxes.push(new am4charts.ValueAxis());
					//window['valueAxis_'+divId].renderer.inversed = true;
					window['valueAxis_'+divId].min = 0;
					//valueAxis.title.text = "Place taken";
					//valueAxis.renderer.minLabelPosition = 0.01;

					// Create series
					if(arrSeries) {
						arrSeries.forEach(function(o, i){
							window['series'+i+'_'+divId] = window[divId].series.push(new am4charts.LineSeries());
							window['series'+i+'_'+divId].dataFields.valueY = o.val;
							window['series'+i+'_'+divId].dataFields.categoryX = o.cate;
							window['series'+i+'_'+divId].name = o.val;
							window['series'+i+'_'+divId].bullets.push(new am4charts.CircleBullet());
							window['series'+i+'_'+divId].tooltipText = "{name} : {valueY}";
							window['series'+i+'_'+divId].legendSettings.valueText = "{valueY}";
							window['series'+i+'_'+divId].visible  = false;
							if(!isUseTheme){
								window['series'+i+'_'+divId].stroke = am4core.color(arrSeriesColor[i]);
								window['series'+i+'_'+divId].strokeWidth = 2;
								window['series'+i+'_'+divId].tooltip.getFillFromObject = false;
								window['series'+i+'_'+divId].tooltip.background.fill = am4core.color(arrSeriesColor[i]);
								window['series'+i+'_'+divId].tooltip.label.fill = am4core.color(arrSeriesTextColor[i]);
							}
						});
					}

					// Add chart cursor
					window[divId].cursor = new am4charts.XYCursor();
					window[divId].cursor.behavior = "zoomY";
					
					// Add legend
					window[divId].legend = new am4charts.Legend();
					window[divId].legend.itemContainers.template.events.on("over", function(event){
					  var segments = event.target.dataItem.dataContext.segments;
					  segments.each(function(segment){
					    segment.isHover = true;
					  })
					})

					window[divId].legend.itemContainers.template.events.on("out", function(event){
					  var segments = event.target.dataItem.dataContext.segments;
					  segments.each(function(segment){
					    segment.isHover = false;
					  })
					})
				}
				catch( e ) {
					console.log( e );
				}

			}

			// 파이 차트 생성
			function createPieChart(divId, arrData, isShowType){
				try {
					am4core.useTheme(am4themes_animated);
					am4core.options.commercialLicense = true;

					window[divId] = am4core.create(divId, am4charts.PieChart);
					window[divId].data = arrData;
					window['pieSeries_'+divId] = window[divId].series.push(new am4charts.PieSeries());
					window['pieSeries_'+divId].dataFields.value = "value";
					window['pieSeries_'+divId].dataFields.category = "category";
					//window['pieSeries_'+divId].dataFields.hidden = "hidden";
					window['pieSeries_'+divId].slices.template.stroke = am4core.color("#fff");
					window['pieSeries_'+divId].slices.template.strokeWidth = 2;
					window['pieSeries_'+divId].slices.template.strokeOpacity = 1;
					//window['pieSeries_'+divId].hiddenState.properties.opacity = 1;
					//window['pieSeries_'+divId].hiddenState.properties.endAngle = -90;
					//window['pieSeries_'+divId].hiddenState.properties.startAngle = -90;
					window['pieSeries_'+divId].tooltip.getFillFromObject = false;
					window['pieSeries_'+divId].tooltip.background.fill = am4core.color('#AADDFF');
					window['pieSeries_'+divId].tooltip.label.fill = am4core.color('#000000');
					window['pieSeries_'+divId].tooltip.html = "{category}:{value}%";
					window['pieSeries_'+divId].labels.template.html = "{category} : <br/>{value}%";
					window['pieSeries_'+divId].labels.template.wrap = true;
					window['pieSeries_'+divId].labels.template.maxWidth = 250;
					//window['pieSeries_'+divId].alignLabels = false;
					//window['pieSeries_'+divId].labels.template.bent = true;
					
					window[divId].innerRadius = am4core.percent(40);
					if(isShowType){
						if('MOBILE' === isShowType){
							window['pieSeries_'+divId].tooltip.html = "{category}:<br/>{value}%";
							
							window['pieSeries_'+divId].alignLabels = false;
							window['pieSeries_'+divId].ticks.template.disabled = true;
							window['pieSeries_'+divId].labels.template.html = null;
							window['pieSeries_'+divId].labels.template.text = "{value}%";
							//window['pieSeries_'+divId].labels.template.wrap = true;
							//window['pieSeries_'+divId].labels.template.maxWidth = 150;
							window['pieSeries_'+divId].labels.template.relativeRotation = 90;
							window['pieSeries_'+divId].labels.template.radius = am4core.percent(-40);
							
							window[divId].legend = new am4charts.Legend();
							window[divId].legend.position = "bottom";
							window['pieSeries_'+divId].legendSettings.itemLebelText = "{category}:";
							window['pieSeries_'+divId].legendSettings.itemValueText = "{value}%";
							window[divId].legend.valueLabels.template.align = "right";
							window[divId].legend.valueLabels.template.textAlign = "end";
						}
					}

				} catch( e ) {
					console.log( e );
				}

			}

			// 막대 차트 생성			
			function createBarChart(divId, arrData) {
			  try {
			    am4core.useTheme(am4themes_animated);
			    am4core.options.commercialLicense = true;
			
			    var chart = window[divId] = am4core.create(divId, am4charts.XYChart);
			    chart.data = arrData;
			
			    // 확대/축소 버튼/커서 비활성(옵션)
			    chart.zoomOutButton.disabled = true;
			    chart.cursor = new am4charts.XYCursor();
			    chart.cursor.behavior = "none";
			
			    // 🔑 라벨이 플롯 밖으로 나가도 보이도록 마스크 해제
			    chart.maskBullets = false;
			
			    // X축
			    var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
			    categoryAxis.dataFields.category = "year";
			    categoryAxis.renderer.grid.template.location = 0;
			    categoryAxis.renderer.minGridDistance = 30;
			    categoryAxis.renderer.labels.template.rotation = 0;
			    categoryAxis.tooltip.disabled = true;
			
			    // Y축 범위 자동 계산(과장 방지)
			    var values = arrData.map(function (d) { return +d.value || 0; });
			    var minY = Math.min.apply(null, values);
			    var maxY = Math.max.apply(null, values);
			    var range = maxY - minY;
			    var pad = range <= 0 ? Math.max(10, Math.abs(minY) * 0.05) : range * 0.1;
			
			    var yMin = Math.floor((minY - pad) / 10) * 10;
			    var yMax = Math.ceil((maxY + pad) / 10) * 10;
			
			    if (minY >= 0 && yMin > 0) yMin = 0;
			    if (maxY <= 0 && yMax < 0) yMax = 0;
			
			    var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
			    valueAxis.min = yMin;
			    valueAxis.max = yMax;
			    valueAxis.strictMinMax = true;
			    valueAxis.extraMin = 0;
			    valueAxis.extraMax = 0;
			    valueAxis.renderer.minGridDistance = 30;
			    valueAxis.renderer.grid.template.strokeOpacity = 0.07;
			
			    // 시리즈
			    var series = chart.series.push(new am4charts.ColumnSeries());
			    series.dataFields.valueY = "value";
			    series.dataFields.categoryX = "year";
			    series.columns.template.strokeWidth = 0;
			    series.columns.template.column.fillOpacity = 0.85;
			    series.tooltipText = "[{categoryX}] {valueY.formatNumber('#,###')}";
			    series.sequencedInterpolation = true;
			
			    // 🔑 시리즈 쪽도 마스크 해제 (라벨이 막대 밖으로 나가도 보이게)
			    series.maskBullets = false;
			
			    // 색상
			    series.columns.template.adapter.add("fill", function (fill, target) {
			      return chart.colors.getIndex(target.dataItem.index);
			    });

			    // 라벨
			    var lb = series.bullets.push(new am4charts.LabelBullet());
			    lb.label.text = "{valueY.formatNumber('#,###')}";
			    lb.label.fontWeight = "bold";
			    lb.label.fill = am4core.color("#000");
			    lb.label.truncate = false;
			    lb.label.hideOversized = false;
			
			    // 🔑 부호에 따라 위치를 정확히 지정 (음수 라벨은 막대에 더 가깝게)
			    function getVal(target){
			      var di = target.dataItem;
			      return di && di.values && di.values.valueY ? di.values.valueY.value : null;
			    }
			
			    // 간격(px): 양수는 10px 위, 음수는 2px 아래
			    var POS_GAP = 10;
			    var NEG_GAP = 2;
			
			    lb.adapter.add("locationY", function(loc, target){
			      var v = getVal(target);
			      if (v === null) return loc;
			      return v >= 0 ? 1 : 0; // 양수: 윗끝, 음수: 아랫끝
			    });
			
			    lb.adapter.add("dy", function(dy, target){
			      var v = getVal(target);
			      if (v === null) return dy;
			      return v >= 0 ? -POS_GAP : NEG_GAP; // 음수만 더 바짝(2px)
			    });
			
			    lb.label.adapter.add("verticalCenter", function(center, target){
			      var v = getVal(target);
			      if (v === null) return center;
			      return v >= 0 ? "bottom" : "top";
			    });
			
			  } catch (e) {
			    console.error(e);
			  }
			}





			return {
				createBarChart: createBarChart,
				createPieChart: createPieChart,
				createLineChart: createLineChart
			};
		}());

		// Charts.js 관련 유틸
		var ChartjsUtils = (function(){
			var _backgroundColors = [
	               "rgba(150, 150, 150, 1)",
	               "rgba(150, 150, 150, 1)",
	               "rgba(100, 100, 200, 1)"
	            ];
			var _borderColors = [
	               "rgb(150, 150, 150)",
	               "rgb(150, 150, 150)",
	               "rgb(100, 100, 200)"
	            ];

			function getBackgroundColor(length) {
				var retArr = new Array();
				var len = _backgroundColors.length > length ? length : _backgroundColors.length;
				for(var i = 0; i < len; i++){
					retArr.push(_backgroundColors[i]);
				}
				return retArr;
			}

			function getBorderColors(length) {
				var retArr = new Array();
				var len = _borderColors.length > length ? length : _borderColors.length;
				for(var i = 0; i < len; i++){
					retArr.push(_borderColors[i]);
				}
				return retArr;
			}

			function createBarChart(canvasId, arrData, arrLabel){
				new Chart(document.getElementById(canvasId), {
					   "type":"bar",
					   "data":{
					      "labels" : arrLabel,
					      "datasets":[
					         {
								/*barPercentage: 0.9,
								barThickness: 6,
								maxBarThickness: 8,
								minBarLength: 2,*/
								"categoryPercentage": 0.1,
								"barPercentage": 0.1,
					            "label":"",
					            "data" : arrData,
					            "fill":false,
					            "backgroundColor": getBorderColors(arrLabel.length),
					            "borderColor": getBorderColors(arrLabel.length),
					            "borderWidth":1
					         }
					      ]
					   },
					   options: {
					        scales: {
					            yAxes: [{
					                ticks: {
					                    beginAtZero: true
					                }
					            }],
					            xAxes: [{
					                // Change here
					            	//barThickness: 1,
									categoryPercentage : 0.5,
									barPercentage : 0.5
					            }]
					        },
							legend: {
					            display: false
					        }
					    }
					}
				);
			}

			function createLineChart(canvasId, arrDataSets, arrLabel){
				new Chart(document.getElementById("chartSummary7"), {
					"type":"line",
					"data":{
						"labels":arrLabel,
						"datasets":arrDataSets
					},
					"options":{
						legend: {
				            display: true
				        }
					}}
				);
			}



			return {
				createBarChart: createBarChart,
				createLineChart: createLineChart,
			};
		}());

		/**
		*	전자공고 파일 리스트 조회 및 리스트 그리기.
		*/
		function getInvRef(pathType, targetId, searchVO){
			var _lang = '${_lang}'.toUpperCase();
			if(searchVO){
				if(StringUtils.isEmpty(searchVO._lang)){
					searchVO.searchLangType = _lang;
				}
			} else {
				var searchVO = {};
				searchVO.searchLangType = _lang;
			}

			// page값 구하기
			var page = 1;
			var rowSizePerPage = 10;
			var currCnt = 0;
			if(targetId.indexOf('box_') > -1){
				if($('#'+targetId).find('div.down-box').length){
					currCnt = $('#'+targetId).find('div.down-box').length;
				}
			} else if(targetId.indexOf('list_') > -1){
				if($('#'+targetId).find('tr').length){
					currCnt = $('#'+targetId).find('tr').length;
				}
			} else if(targetId.indexOf('li_') > -1){
				if($('#'+targetId).find('li').length){
					currCnt = $('#'+targetId).find('li').length;
				}
			}
			if(currCnt > rowSizePerPage){
				page = (currCnt/rowSizePerPage) + 1;
			} else if(currCnt > 0){
				page = page+1;
			}
			searchVO.page = page;
			
			$.ajax({
				url : '/invest/refer/'+pathType+'/getInvRefAjax',
				type : 'post',
				data : searchVO,
				dataType: 'json',
				success : function(data) {
					if(data.success){
						var pageNo = 1;
						if(data.page && data.page.pageNo){
							pageNo = Number(data.page.pageNo);
						}
						if(data.list && data.list.length){
							var html = '';
							if(targetId.indexOf('box_') > -1){
								data.list.forEach(function(o, i){
									html += '<div class="down-box">';
									html += '	<a class="btn-down-box" href="/download/file/'+StringUtils.nvl(o.fileId)+'" target="_blank">';
									html += '		<strong class="down-box-tit">'+StringUtils.nvl(o.title)+'</strong>';
									html += '		<span class="bttn-download">';
									html += '			<em class="ico download" aria-hidden="true"></em>';
									html += '			<spring:message code="FRONT.COMMON.MENU.INVEST.003.001.004" text="다운로드" />';
									html += '		</span>';
									html += '	</a>';
									html += '</div>';
								});
							} else if(targetId.indexOf('list_') > -1){
								data.list.forEach(function(o, i){
									html += '<tr>';
									html += '	<td class="left"><span class="line-clamp">'+StringUtils.nvl(o.title)+'</span></td>';
									html += '	<td>';
									html += '		<a class="bttn-download" href="/download/file/'+StringUtils.nvl(o.fileId)+'" target="_blank">';
									html += '			<em class="ico download"></em>';
									html += '			<spring:message code="FRONT.COMMON.MENU.INVEST.003.001.004" text="다운로드" />';
									html += '		</a>';
									html += '	</td>';
									if(pathType === 'anar'){
										html += '   <td>'+StringUtils.nvl(o.pblDt)+'</td>';
									}
									html += '</tr>';
								});

							} else if(targetId.indexOf('li_') > -1){
								data.list.forEach(function(o, i){
									html += '<li class="list-item">';
									if(pathType === 'anar'){
										html += '	<span class="txt-top">'+StringUtils.nvl(o.pblDt)+'</span>';
									}
									html += '	<p class="txt-title"><span class="line-clamp">'+StringUtils.nvl(o.title)+'</span></p>';
									html += '	<a class="bttn bttn-download" href="/download/file/'+StringUtils.nvl(o.fileId)+'" target="_blank">';
									html += '		<em class="ico download"></em>';
									html += '		<spring:message code="FRONT.COMMON.MENU.INVEST.003.001.004" text="다운로드" />';
									html += '	</a>';
									html += '</li>';
								});

							}

							if(pageNo === 1){
								$('#'+targetId).html(html);
							} else {
								var currScrollTop = $(document).scrollTop();
								$('#'+targetId).append(html);
								if(currScrollTop){
									$(document).scrollTop(currScrollTop);
								}
							}
						}
						if(data.page && data.page.totalCount){
							if(targetId.indexOf('box_') > -1){
								if(data.page.totalCount > $('#'+targetId).find('div.down-box').length){
									$('#'+targetId).siblings('div.more').show();
								} else {
									$('#'+targetId).siblings('div.more').hide();
								}
							} else if(targetId.indexOf('list_') > -1){
								if(data.page.totalCount > $('#'+targetId).find('tr').length){
									$('#'+targetId).parent().siblings('div.more').show();
								} else {
									$('#'+targetId).parent().siblings('div.more').hide();
								}
							} else if(targetId.indexOf('li_') > -1){
								if(data.page.totalCount > $('#'+targetId).find('li').length){
									$('#'+targetId).siblings('div.more').show();
								} else {
									$('#'+targetId).siblings('div.more').hide();
								}
							}
						}

						setTimeout(function() {
							try{
								$(window).trigger('resize');
								contentsGridFunction.reset();
							}catch(e){
								console.log('common_utils_js.jsp error :: ', e);
							}
						}, 0);
						

					}
				},
				error : function(jqXHR) {
					console.log(jqXHR);
				}
			});
		}
		
		// sns 공유 유틸리티
		var SnsUtils = (function(){

			// html header 영역에 meta 태그 셋팅
			function setMetaTag(url, title, description, imgUrl){
				if(url){
					if( $('meta[property="og:url"]').length < 1 ) {
						$('head').append( '<meta property="og:url" content="'+url+'" />' );
					} else {
						$('meta[property="og:url"]').attr('content', url);
					}
				}

				if( $('meta[property="og:type"]').length < 1 ) {
					$('head').append( '<meta property="og:type" content="article" />' );
				} else {
					$('meta[property="og:type"]').attr('content', 'article');
				}

				if(title){
					if( $('meta[property="og:title"]').length < 1 ) {
						$('head').append( '<meta property="og:title" content="'+title+'" />' );
					} else {
						$('meta[property="og:title"]').attr('content', title);
					}
				}

				if(description){
					if( $('meta[property="og:description"]').length < 1 ) {
						$('head').append( '<meta property="og:description" content="'+description+'" />' );
					} else {
						$('meta[property="og:description"]').attr('content', description);
					}
				}

				if(imgUrl){
					if( $('meta[property="og:image"]').length < 1 ) {
						$('head').append( '<meta property="og:image" content="'+imgUrl+'" />' );
					} else {
						$('meta[property="og:image"]').attr('content', imgUrl);
					}
				}
			}

			// 페이스북 공유 기능
			function fbShare(pageUrl){
				var shareUrl = document.location.href;
				if(pageUrl){
					shareUrl = pageUrl;
				}
				shareUrl = rplaceQueryString(shareUrl, 'lang', $('html').attr('lang'));
				var height = 314;
				var width = 411;
				var top = ($(window).height() - height) / 2;
				var left = ($(window).width() - width) / 2;
				window.open('http://www.facebook.com/sharer.php?u=' + encodeURIComponent(shareUrl), 'facebook_sharer', 'height='+height+', width='+width+', top='+top+', left='+left);
			}

			// 카카오톡 공유
			function kakaoShare(){
				var webUrl = document.location.href;
				var mobileWebUrl = document.location.href;
				if(webUrl.indexOf(document.location.host+'/m/') > -1){
					webUrl = document.location.href.replace(document.location.host+'/m/', document.location.host+'/');
				} else {
					mobileWebUrl = document.location.href.replace(document.location.host, document.location.host+'/m');
				}
				webUrl = rplaceQueryString(webUrl, 'lang', $('html').attr('lang'));
				mobileWebUrl = rplaceQueryString(mobileWebUrl, 'lang', $('html').attr('lang'));

				Kakao.Link.sendDefault({
					objectType: 'feed',
					content: {
						title: $('meta[property="og:title"]').attr('content'),
						description: $('meta[property="og:description"]').attr('content'),
						imageUrl: $('meta[property="og:image"]').attr('content'),
						link: {
						  mobileWebUrl: mobileWebUrl,
						  webUrl: webUrl,
						},
					},
					buttons: [
						{
							title: $('meta[property="og:title"]').attr('content'),
							link: {
								mobileWebUrl: mobileWebUrl,
							},
						},
					],
				});
			}
			
			// 카카오톡 초기화
			function kakaoInit(){
				Kakao.init('07224efe438d5eaf1212447a49658286');	 /*여기에 새로 생성하신 개발자 키를 입력*/
			}
			
			// 쿼리스트링 파라메터 값 변경
			function rplaceQueryString(url, pNm, pVal) {
				var retStr = url;
				if(!StringUtils.isEmpty(url) && url.indexOf('?') > -1 && url.indexOf(pNm+'=') > -1){
					var urlPart1 = url.substring(0, url.indexOf(pNm+'='));
					var urlPart2 = url.substring(url.indexOf(pNm+'='));
					if(urlPart2.indexOf('&') > -1){
						urlPart2 = pNm + '=' + pVal + urlPart2.substring(urlPart2.indexOf('&'));
					} else {
						urlPart2 = pNm + '=' + pVal;
					}
					retStr = urlPart1 + urlPart2;
				} else if(!StringUtils.isEmpty(url) && url.indexOf('?') > -1 ) {
					retStr = url + '&' + pNm + '=' + pVal;
				} else if(!StringUtils.isEmpty(url)){
					retStr = url + '?' + pNm + '=' + pVal;
				}
				return retStr;
			}

			return {
				setMetaTag: setMetaTag,
				fbShare : fbShare,
				kakaoShare : kakaoShare,
				kakaoInit : kakaoInit,
				rplaceQueryString : rplaceQueryString
			};
		}());
		
		// 인쇄 유틸리티
		var PrintUtils = (function(){
			function printPage(id){
				var printarea = id;
				 var p = window.open('', 'print');
				 p.document.write(document.getElementById(printarea).innerHTML);
				 p.document.close();
				 p.print();
				 p.close();
			}
			return {
				printPage : printPage
			};
		}());

		</script>
		<script>
		// footer 패밀리사이트 링크
		(function(){
			try{
				
				var component = new ComponentUI();
				component.selectBox(".family-btn", 150);
				
				$('ul.family-list').off('click').on('click', 'li.family-item', function(){
					if(0 < $(this).find('a').length && '' !== $(this).find('a').attr('href')){
						window.open($(this).find('a').attr('href'), $(this).find('a').text(), "");
					}
				});
			}catch(e){
				console.log('footer footer-family change error :: ', e);
			}
			
			// 언어변경시 탭유지
			$(document).ready(function(){
				CommonUtils.setTabChgLang();
			});
			
			var loadingBarStack = [];
			var component = new ComponentUI();
			$.ajaxSetup({
				beforeSend: function() {
					loadingBarStack.push('1');
					component.loading().start();
			    },
			    complete: function() {
			    	loadingBarStack.pop();
			    	if(loadingBarStack.length < 1){
			    		component.loading().stop();
			    	}
			    },
			    error: function(xhr) {
			    	loadingBarStack.pop();
			    	if(loadingBarStack.length < 1){
			    		component.loading().stop();
			    	}
			    }
			});
			
		}());
		</script>