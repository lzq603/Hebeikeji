<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.hbkj.model.Platform"%>
<%@page import="java.util.List"%>
<%
	List<Platform> platforms = (List<Platform>) request.getAttribute("platforms");
	JsonArray jsonArray = new JsonArray();
	for(Platform p:platforms) {jsonArray.add(p.toJsonObject());}
	String json = jsonArray.toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询结果</title>

	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="js/china.js"></script>
	<script><%out.println("var json_platform = " + json); %> console.log(json_platform)</script>
	<script>
		//地区代码转换为文字
		function numToText(code){
			
			var dist = code;
			var province = Math.floor(dist / 10000) * 10000;
			var city = Math.floor(dist / 100) * 100;
			console.log(DISTRICTS[100000][province]);
			console.log(DISTRICTS[province][city]);
			console.log(DISTRICTS[city][dist]);
			return DISTRICTS[province][city] + DISTRICTS[city][dist];
		}
		$.each(json_platform,function(key,obj){
			console.log(obj.district);
			obj.district = numToText(obj.district);//地区代码转换为文字
			obj.website = "<a href='" + obj.weburl + "'>" + obj.website + "</a>";//平台网站添加链接
		})
	</script>
	<script type="text/javascript" src="layui/layui.js"></script>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
</head>
<body style="text-align: center;">
<a href="javascript:;"></a>
<table id="res_tb" lay-filter="res_tb"></table>
<p style="margin-top:100px;">共找到<%=platforms.size() %>条数据，您可以:<a href="TableServlet">导出Excel表格</a></p>
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
		      ,{field: 'field', title: '技术领域'}
		      ,{field: 'grade', title: '级别'} 
		      ,{field: 'district', title: '所在市县'}
		      ,{field: 'approvalDate', title: '批准年月', sort: true}
		      ,{field: 'organization', title: '依托单位'}
		      ,{field: 'dean', title: '平台院长'}
		      ,{field: 'website', title: '平台网站'}
		    ]]
		});
	});
	</script>
</body>
</html>