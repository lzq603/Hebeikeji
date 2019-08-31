<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>年报数据统计</title>
<link rel="stylesheet" href="layui/css/layui.css" />
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-3.2.1.js" ></script>
<style type="text/css">
header{
	height: 75px;
	border-bottom: solid 1px #e7d3d3;
	box-shadow: 0px -4px 15px;
	background: url("image/top.gif") 0 0 repeat-x;
}
header h1{
	padding: 16px;
	color: white;
}
.welcome{
	float: right;
	position: relative;
	bottom: 30px;
	right: 20px;
	color: white;
}
.welcome a{
	color: #8d8d8d;
}
#box-main{
	float: left;
	width: 85%;
	margin-top:-13px;
}
#box-side{
	float:left;
}
iframe{
	width: 100%;
	border: none;
}
</style>
</head>
<body onload="iframeLoad()" style="background:#00c5fb;">
	<header>
		<image src="image/logo.png" style="float:left;margin-left: 10px;margin-top: 7px;"></image>
		<h1>河北创新平台年报系统</h1>
		<span class="welcome">欢迎您，李志强 <a href="Logout">退出</a></span>
	</header>
	<div id="container_box">
		<div id="box-side">
			<ul class="layui-nav layui-nav-tree layui-bg-blue" lay-filter="test">
			<!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
			  <li class="layui-nav-item layui-nav-itemed">
			    <a href="javascript:;">填报系统</a>
			    <dl class="layui-nav-child">
			      <dd><a href="fill_in.jsp" target="iframe">填报报表</a></dd>
			    </dl>
			  </li>
			  <li class="layui-nav-item layui-nav-itemed">
			  	<a href="javascript:;">报表查询</a>
			    <dl class="layui-nav-child">
			      <dd><a href="browse.jsp" target="iframe">分类浏览</a></dd>
			      <dd><a href="browse.jsp" target="iframe">综合查询</a></dd>
			    </dl>
			  </li>
			  <li class="layui-nav-item layui-nav-itemed">
			  	<a href="javascript:;">报表审核</a>
			    <dl class="layui-nav-child">
			      <dd><a href="audit.jsp" target="iframe">报表审核</a></dd>
			    </dl>
			  </li>
			  <li class="layui-nav-item layui-nav-itemed">
			    <a href="javascript:;">报表统计</a>
			    <dl class="layui-nav-child">
			      <dd><a href="statistic.jsp" target="iframe">报表统计</a></dd>
			    </dl>
			  </li>
			  <li class="layui-nav-item"><a href="http://www.hebstd.gov.cn/">河北科学技术厅</a></li>
			  <li class="layui-nav-item"><a href="">关于</a></li>
			</ul>
		</div>
		<div></div>
	</div>
	<div id="box-main">
		<iframe name="iframe" id="iframe" onload="iframeLoad()" height="770" src="fill_in.jsp" scrolling="no"></iframe>
	</div>
	<footer style="text-align: center;padding: 20px;color: wheat;float: left;width: 100%;background: #00000077;">
		<p>主办单位：河北省科学技术厅 | 地址：石家庄市裕华东路105号 | 联系电话</p>
		<p>技术支持：河北省科技管理信息中心 | 电子邮件：xxzxemail | 网站地图</p>
		<p>网站标识码：1300000011 | 冀公安网备13010202002063号 | 网站备案：冀ICP备05007310号</p>
		<p>举报电话：0311-85891611 | 举报邮箱：hbskjtbgs@126.com</p>
	</footer>
<script type="text/javascript" src="layui/layui.js"></script>
<script>

layui.use('element', function(){
  var element = layui.element;
});
function iframeLoad()  
{  
	console.log("iframeLoad()");
    document.getElementById("iframe").height=0;  
    document.getElementById("iframe").height=document.getElementById("iframe").contentWindow.document.body.scrollHeight;  
}  
</script>

</body>
</html>