<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>统计</title>
<link rel="stylesheet" href="layui/css/layui.css" />
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-3.2.1.js" ></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
</head>
<body style="background-color:white;">
	<div class="layui-tab layui-tab-brief" style="margin-top: 38px;margin-left: 20px;width: 600px;" lay-filter="statis">
	  <ul class="layui-tab-title">
	    <li class="layui-this">汇总</li>
	    <li>平台级别</li>
	    <li>地区分布</li>
	  </ul>
	  <div class="layui-tab-content"></div>
	</div>
	<iframe id="iframe" width="100%" style="border:none;" scrolling="no" height="700" src="statistic/bar.jsp"></iframe>
	<script type="text/javascript">
	layui.use('element', function(){
	  var element = layui.element;
	  var iframe = document.getElementById("iframe");
	  //一些事件监听
	  element.on('tab(statis)', function(data){
		  switch(data.index){
		  case 0:iframe.src="statistic/bar.jsp";break;
		  case 1:iframe.src="statistic/sector.jsp";break;
		  case 2:iframe.src="statistic/map.jsp";break;
		  defaut:alert("系统出错");
		  }
	  });
	});
	</script>
</body>
</html>