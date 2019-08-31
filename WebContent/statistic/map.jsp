<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
<script src="https://img.hcharts.cn/highmaps/modules/map.js"></script>
<script src="https://data.jianshukeji.com/geochina/hebei.js"></script>
<script src="http://cdn.hcharts.cn/highcharts/modules/drilldown.js"></script>
<script src="../js/jquery-3.2.1.js"></script>
<title>地区分布</title>
</head>
<body>
	<div id="map" style="width:800px;height: 500px;"></div>
	<script>
	// 随机数据
	var data = [{"name":"石家庄","value":89,drilldown:'sjz'},{"name":"唐山","value":73,drilldown:'ts'},{"name":"秦皇岛","value":22,drilldown:'qhd'},{"name":"邯郸","value":6,drilldown:'hd'},{"name":"邢台","value":28,drilldown:'xt'},{"name":"保定","value":34,drilldown:'bd'},{"name":"张家口","value":4,drilldown:'zjk'},{"name":"承德","value":63,drilldown:'cd'},{"name":"沧州","value":75,drilldown:'cz'},{"name":"廊坊","value":36,drilldown:'lf'},{"name":"衡水","value":66,drilldown:'hs'}];
	// 初始化图表
	var map = new Highcharts.Map('map', {
	  title: {
	    text: '河北省'
	  },
	  colorAxis: {
	    min: 0,
	    minColor: 'rgb(255,255,255)',
	    maxColor: '#006cee'
	  },
	  series: [{
	    data: data,
	    name: '平台数量',
	    mapData: Highcharts.maps['cn/hebei'],
	    joinBy: 'name' // 根据 name 属性进行关联
	  }],
	  drilldown:{
		  series:[{
			  type:'pie',
			  id:'sjz',
			  data: [
		            ['Cats', 4],
		            ['Dogs', 2],
		            ['Cows', 1],
		            ['Sheep', 2],
		            ['Pigs', 1]
		        ]
		  },{
			  type:'pie',
			  id:'ts',
			  data: [
		            ['Cats', 4],
		            ['Dogs', 2],
		            ['Cows', 1],
		            ['Sheep', 2],
		            ['Pigs', 1]
		        ]
		  },{
			  type:'pie',
			  id:'qhd',
			  data: [
		            ['Cats', 4],
		            ['Dogs', 2],
		            ['Cows', 1],
		            ['Sheep', 2],
		            ['Pigs', 1]
		        ]
		  },{
			  type:'pie',
			  id:'hd',
			  data: [
		            ['Cats', 4],
		            ['Dogs', 2],
		            ['Cows', 1],
		            ['Sheep', 2],
		            ['Pigs', 1]
		        ]
		  },{
			  type:'pie',
			  id:'xt',
			  data: [
		            ['Cats', 4],
		            ['Dogs', 2],
		            ['Cows', 1],
		            ['Sheep', 2],
		            ['Pigs', 1]
		        ]
		  },{
			  type:'pie',
			  id:'bd',
			  data: [
		            ['Cats', 4],
		            ['Dogs', 2],
		            ['Cows', 1],
		            ['Sheep', 2],
		            ['Pigs', 1]
		        ]
		  },{
			  type:'pie',
			  id:'zjk',
			  data: [
		            ['Cats', 4],
		            ['Dogs', 2],
		            ['Cows', 1],
		            ['Sheep', 2],
		            ['Pigs', 1]
		        ]
		  },{
			  type:'pie',
			  id:'cd',
			  data: [
		            ['Cats', 4],
		            ['Dogs', 2],
		            ['Cows', 1],
		            ['Sheep', 2],
		            ['Pigs', 1]
		        ]
		  },{
			  type:'pie',
			  id:'cz',
			  data: [
		            ['Cats', 4],
		            ['Dogs', 2],
		            ['Cows', 1],
		            ['Sheep', 2],
		            ['Pigs', 1]
		        ]
		  },{
			  type:'pie',
			  id:'lf',
			  data: [
		            ['Cats', 4],
		            ['Dogs', 2],
		            ['Cows', 1],
		            ['Sheep', 2],
		            ['Pigs', 1]
		        ]
		  },{
			  type:'pie',
			  id:'hs',
			  data: [
		            ['Cats', 4],
		            ['Dogs', 2],
		            ['Cows', 1],
		            ['Sheep', 2],
		            ['Pigs', 1]
		        ]
		  }]
	  }
	});
	</script>
</body>
</html>