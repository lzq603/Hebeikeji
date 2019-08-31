<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>扇形统计</title>
<script type="text/javascript" src="../js/jquery-3.2.1.js" ></script>
<script src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
<script src="http://cdn.hcharts.cn/highcharts/modules/drilldown.js"></script>

</head>
<body>
	<!-- 图表容器 DOM -->
    <div id="container" style="width: 600px;height:400px;margin-left:auto;margin-right:auto;margin-top:20px;"></div>
    <script type="text/javascript">
    
  	//获取按级别统计的JSON数据
	$.ajax({
	   type: "GET",
	   url: "../Statistic",
	   data: "type=grade",
	   success: function(data){
		   console.log(data);
		   var  chart = Highcharts.chart('container', {
				chart: {
						plotBackgroundColor: null,
						plotBorderWidth: null,
						plotShadow: false
				},
				title: {
						text: '各级别平台比例'
				},
				tooltip: {
						headerFormat: '{series.name}<br>',
						pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
				},
				plotOptions: {
						pie: {
								allowPointSelect: true,
								cursor: 'pointer',
								dataLabels: {
										enabled: true,
										format: '<b>{point.name}</b>: {point.percentage:.1f} %',
										style: {
												color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
										}
								},
								states: {
										hover: {
												enabled: false
										}  
								},
								slicedOffset: 20,         // 突出间距
								point: {                  // 每个扇区是数据点对象，所以事件应该写在 point 下面
										events: {
												// 鼠标滑过是，突出当前扇区
												mouseOver: function() {
														this.slice();
												},
												// 鼠标移出时，收回突出显示
												mouseOut: function() {
														this.slice();
												},
												/* // 默认是点击突出，这里屏蔽掉
												click: function() {
														return false;
												} */
										}
								}
						}
				},
				series: [{
						type: 'pie',
						name: '平台数量占比',
						data: [	{name:"省级",y:8,drilldown:"province"},
								{name:"国家级",y:6,drilldown:"country"},
								{name:"国家级，省级",y:6,drilldown:"cp"}]
				}],
				credits:{
					enabled:false
				},
				drilldown:{
					series: [{
						type: 'pie',
						id:	'province',
						data: [['石家庄',10], ['唐山',15], ['秦皇岛',5], ['邯郸',1], ['邢台',0], ['保定',8], ['张家口',2], ['承德',10], ['沧州',10], ['廊坊',10], ['衡水',10]]
					},{
						type: 'pie',
						id:	'country',
						data: [['石家庄',20], ['唐山',1], ['秦皇岛',5], ['邯郸',3], ['邢台',10], ['保定',14], ['张家口',12], ['承德',9], ['沧州',10], ['廊坊',16], ['衡水',4]]
					},{
						type: 'pie',
						id:	'cp',
						data: [['石家庄',30], ['唐山',11], ['秦皇岛',10], ['邯郸',10], ['邢台',10], ['保定',10], ['张家口',10], ['承德',10], ['沧州',10], ['廊坊',10], ['衡水',10]]
					}],
				}
			});
	   }
	});
    
    </script>
</body>
</html>