<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>统计</title>
<link rel="stylesheet" href="../layui/css/layui.css" />
<link rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../js/jquery-3.2.1.js" ></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<script src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
</head>
<body style="background-color:white;">
	<h2 style="text-align:center;color:#333333">各地区、级别报表数量</h2>
	<!-- 统计表格 -->
	<table align="center" class="layui-table tab middle_self" style="width:78%;">
		<tr>
			<td width="35" align="center" height="40"></td>
			<td width="35" align="center">石家庄</td>
			<td width="35" align="center">唐山</td>
			<td width="35" align="center">秦皇岛</td>
			<td width="35" align="center">邯郸</td>
			<td width="35" align="center">邢台</td>
			<td width="35" align="center">保定</td>
			<td width="35" align="center">张家口</td>
			<td width="35" align="center">承德</td>
			<td width="35" align="center">沧州</td>
			<td width="35" align="center">廊坊</td>
			<td width="35" align="center">衡水</td>
		</tr>
		<tr id="country">
			<td height="40">国家级</td>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
		</tr>
		<tr id="province">
			<td height="40">省级</td>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
		</tr>
	</table>
	
	<!-- 图表容器 DOM -->
    <div id="container" style="width: 600px;height:400px;margin-left:auto;margin-right:auto;margin-top:20px;"></div>
<script type="text/javascript">
	renderDist();
	function renderDist(){
		
		//获取按地区统计的JSON数据
		$.ajax({
		   type: "GET",
		   url: "../Statistic",
		   data: "type=dist",
		   success: function(data){
		     var country = data.country;
		     var province = data.province;
		     //将数据填入表格
		     var i = -1;
		     $("#country").children().each(function(){
		    	 $(this).html(country[i]);
		    	 i++;
		     })
		     i = -1;
		     $("#province").children().each(function(){
		    	 $(this).html(province[i]);
		    	 i++;
		     })
		  // 图表配置
			    var options = {
			        chart: {
			            type: 'column'                          //指定图表的类型，默认是折线图（line）
			        },
			        title: {
			            text: '条形统计图'                 // 标题
			        },
			        xAxis: {
			            categories: ['石家庄', '唐山', '秦皇岛', '邯郸', '邢台', '保定', '张家口', '承德', '沧州', '廊坊', '衡水']   // x 轴分类
			        },
			        yAxis: {
			            title: {
			                text: '平台报表数量'                // y 轴标题
			            }
			        },
			        series: [{                              // 数据列
			            name: '国家级',                        // 数据列名
			            data: country,                     // 数据
			            events:{
			            	click:function(e){
			            		//console.log(e)
			            		skip(e.point)
			            	}
			            }
			        },{
			        	name: '省级',
			            data: province,
			            events:{
			            	click:function(e){
			            		skip(e.point)
			            	}
			            }
			        }],
			        credits:{
			            enabled: false // 禁用版权信息
			        }
			    };
			    // 图表初始化函数
			    var chart = Highcharts.chart('container', options);
		   }
		});
	}
	function skip(data){
		console.log(data);
		var dist = "";
		switch(data.category){
		case '石家庄': dist = 130100;break;
		case '唐山': dist = 130200;break;
		case '秦皇岛': dist = 130300;break;
		case '邯郸': dist = 130400;break;
		case '邢台': dist = 130500;break;
		case '保定': dist = 130600;break;
		case '张家口': dist = 130700;break;
		case '承德': dist = 130800;break;
		case '沧州': dist = 130900;break;
		case '廊坊': dist = 131000;break;
		case '衡水': dist = 131100;break;
		}
		location.href = "result.jsp?dist=" + dist + "&grade=" + (data.colorIndex + 1);	
	}
</script>
     
</body>
</html>