<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.js" ></script>
<script src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
<script src="https://img.hcharts.cn/highmaps/modules/map.js"></script>
<script src="http://cdn.hcharts.cn/highcharts/modules/drilldown.js"></script>
</head>
<body>
<div id="container" style="width: 600px;height: 500px;"></div>
<script type="text/javascript">
Highcharts.setOptions({
	lang: {
		drillUpText: '< 返回 “{series.name}”'
	}
});
var map = null,
geochina = 'https://data.jianshukeji.com/jsonp?filename=geochina/';
$.getJSON(geochina + 'china.json&callback=?', function(mapdata) {
	var data = [];
	// 随机数据
	Highcharts.each(mapdata.features, function(md, index) {
		var tmp = {
			name: md.properties.name,
			value: Math.floor((Math.random() * 100) + 1) // 生成 1 ~ 100 随机值
		};
		if(md.properties.drilldown) {
			tmp.drilldown = md.properties.drilldown;
		}
		data.push(tmp);
	});
	map = new Highcharts.Map('container', {
		chart: {
			events: {
				drilldown: function(e) {
					this.tooltip.hide();
					console.log(e);
					// 异步下钻
					if(e.point.drilldown) {
						var pointName = e.point.properties.fullname;
						map.showLoading('下钻中，请稍后...');
						// 获取二级行政地区数据并更新图表
						$.getJSON(geochina + e.point.drilldown + '.json&callback=?', function(data) {
							data = Highcharts.geojson(data);
							Highcharts.each(data, function(d) {
								if(d.properties.drilldown) {
									d.drilldown = d.properties.drilldown;
								}
								d.value = Math.floor((Math.random() * 100) + 1); // 生成 1 ~ 100 随机值
							});
							map.hideLoading();
							map.addSeriesAsDrilldown(e.point, {
								name: e.point.name,
								data: data,
								dataLabels: {
									enabled: true,
									format: '{point.name}'
								}
							});
							map.setTitle({
								text: pointName
							});
						});
					}
				},
				drillup: function() {
					map.setTitle({
						text: '中国'
					});
				}
			}
		},
		title: {
			text: '中国地图'
		},
		subtitle: {
			useHTML: true,
			text: '点击查看 <a href="https://www.hcharts.cn/mapdata" target="_blank">地图数据及详情</a>，注意县级数据为收费数据，如果您有需要，请 <a href="https://highcharts.com.cn/data" target="_blank">联系我们购买</a>'
		},
		mapNavigation: {
			enabled: true,
			buttonOptions: {
				verticalAlign: 'bottom'
			}
		},
		tooltip: {
			useHTML: true,
			headerFormat: '<table><tr><td>{point.name}</td></tr>',
			pointFormat: '<tr><td>全称</td><td>{point.properties.fullname}</td></tr>' +
				'<tr><td>行政编号</td><td>{point.properties.areacode}</td></tr>' +
				'<tr><td>父级</td><td>{point.properties.parent}</td></tr>' +
				'<tr><td>经纬度</td><td>{point.properties.longitude},{point.properties.latitude}</td></tr>',
			footerFormat: '</table>'
		},
		// colorAxis: {
		//     min: 0,
		//     minColor: '#fff',
		//     maxColor: '#006cee',
		//     labels:{
		//         style:{
		//             "color":"red","fontWeight":"bold"
		//         }
		//     }
		// },
		series: [{
			data: data,
			mapData: mapdata,
			joinBy: 'name',
			name: '中国地图',
			states: {
				hover: {
					color: '#a4edba'
				}
			}
		}]
	});
});
</script>
</body>
</html>