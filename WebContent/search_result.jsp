<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/4
  Time: 0:08
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.hbkj.model.Platform"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	List<Platform> platforms = (List<Platform>) request.getAttribute("platforms");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>查询</title>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="layui/css/layui.css" />
</head>
<style>
    body{
        background: url(image/banner.jpg);
        background-attachment: fixed;
    }
    #content{
        background-color: rgba(238,238,238,0.5);
    }
    #content,#head{
        width: 90%;
        margin-left: auto;
        margin-right: auto;
        margin-top: 30px;
    }
    #catagory li{
        font-size: 16px;
        margin-left: 10px;
    }
</style>
<body>

<div id="content">
    <div id="head">
        <h1 style="padding: 50px 0;">河北科技</h1>
    </div>
    <div style="display: inline-block;width: 18%;">
        <ul id="catagory">
            <li>哈哈</li>
        </ul>
    </div>
    <div style="display: inline-block;width: 79%;border-left: solid 1px #8a8a8a;padding-left: 20px;">
        <form id="search" action="Select" class="layui-form">
            多条件查询：
            <div style="border: solid 1px #8a8a8a80;height: 39px;">
                <div class="layui-input-inline">
                	<input type="checkbox" name="jjjgj" id="country_grade" value="1" lay-skin="primary"/>&nbsp;&nbsp;京津冀共建&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div class="layui-input-inline">
					<input type="checkbox" name="platform_grade" id="country_grade" value="1" lay-skin="primary"/>&nbsp;&nbsp;国家级&nbsp;&nbsp;&nbsp;&nbsp;
                	<input type="checkbox" name="platform_grade" id="province_grade" value="2" lay-skin="primary"/>&nbsp;&nbsp;省级
                </div>
                <div class="layui-input-inline" style="float: right;margin-right: 20px;">
                    <input type="submit" value="搜索" class="layui-btn"/>
                </div>
                <div class="layui-input-inline" style="float: right;">
                    <input type="text" name="name" class="layui-input" />
                </div>
            </div>
        </form>
        <div style="margin-top: 26px;">
            <p class="title">查询结果</p>
        </div>
        <div>
            <ul class="table_list" style="margin: 20px 30px;">
            <%for(Platform p:platforms){ %>
                <li><%=p.getUser().getPlatformName() %></li>
            <%} %>
            </ul>
        </div>
    </div>
</div>
<footer style="text-align: center;padding: 20px;">河北科技©Copyright版权所有</footer>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript">
	//加载form模块
	var form;
	
	layui.use('form',function () {
		form = layui.form;
	})
</script>
</body>
