<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.hbkj.dao.PlatformDao"%>
<%@page import="com.hbkj.model.Platform"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String grade = request.getParameter("grade");
	String dist = request.getParameter("dist");
	String where = "Pgrade = " + grade + " OR Pgrade = 3 AND " + "Pdistrict = " + dist;
	PlatformDao platformDao = new PlatformDao();
	List<Platform> platforms = platformDao.loadWhere(where);
	JsonArray jsonArray = new JsonArray();
	for(Platform p:platforms) {jsonArray.add(p.toJsonObject());}
	String json = jsonArray.toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<script><%out.println("var json_platform = " + json); %> console.log(json_platform)</script>
<script type="text/javascript">
$.each(json_platform,function(key,obj){
	console.log(obj);
	obj.website = "<a href='" + obj.weburl + "'>" + obj.website + "</a>";
})
</script>
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css"/>
<title>报表审核</title>
</head>
<body>
	<table id="res_tb" lay-filter="res_tb" style="margin-top: 0px;"></table>
	
	<script type="text/javascript">
	layui.use('table', function(){
		var table = layui.table;
		
		//第一个实例
		table.render({
		    elem: '#res_tb'
		    ,height: 750
		    ,limit:15
		    //,url: 'SelectServlet?catagory=' //数据接口
		    ,data:json_platform
		    ,page: true //开启分页
		    ,cols: [[ //表头
		      {field: 'platformNo', title: '平台编号', sort: true, fixed: 'left'}
		      ,{field: 'platformName', title: '平台名称', sort:true}
		      ,{field: 'grade', title: '级别'} 
		      ,{field: 'district', title: '所在市县'}
		      ,{field: 'approvalDate', title: '批准年月', sort: true}
		      ,{field: 'dean', title: '平台院长'}
		      ,{field: 'website', title: '平台网站'}
		    ]]
		});
	});
	</script>
</body>
</html>