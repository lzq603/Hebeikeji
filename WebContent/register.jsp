<%--
  Created by IntelliJ IDEA.
  User: zhiqiang.Li
  Date: 2018/3/29
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="layui/css/layui.css" />
    <script type="text/javascript" src="layui/layui.js" ></script>
    <script type="text/javascript" src="js/jquery-3.2.1.js" ></script>
    <script type="text/javascript" src="js/register.js"></script>
    <title>用户注册</title>
</head>
<body style="background-image: url(image/bg_register.jpg);background-size: cover;">
<header style="background-color: cornflowerblue;border-bottom: solid yellow;padding-top: 10px;padding-bottom: 10px;;" >
    <h2 style="margin-left: 20px;font-weight: bold;">河北科技创新平台填报系统</h2>
    <div style="float: right;margin-top: -20px;margin-right: 10px;"><span>已有账号？直接</span><a href="login.jsp">登入</a></div>
</header>
<form action="Register" method="post" class="layui-form">
    <table class="layui-table" id="reg_tb" lay-skin="nob" style="background-color: rgba(255,255,255,5);">
        <thead>
        <tr>
            <td colspan="3">新用户注册</td>
        </tr>
        </thead>
        <tr>
            <td align="right" width="30%">用户名：</td>
            <td><input class="layui-input" name="username" type="text" lay-verify="required" /></td>
            <td></td>
        </tr>
        <tr>
            <td align="right">密码：</td>
            <td><input class="layui-input" type="password" name="pass1" id="pass1" value="" lay-verify="required|pass"/></td>
            <td></td>
        </tr>
        <tr>
            <td align="right">再次输入密码：</td>
            <td><input class="layui-input" type="password" name="pass2" id="pass2" value="" lay-verify="required|pass"/></td>
            <td></td>
        </tr>
        <tr>
            <td align="right">平台名称：</td>
            <td><input class="layui-input" type="text" name="platform_name" id="platform_name" value="" lay-verify="required"/></td>
            <td></td>
        </tr>
        <tr>
            <td align="right">平台编号：</td>
            <td><input class="layui-input" type="text" name="platform_no" id="platform_no" value="" lay-verify="required"/></td>
            <td></td>
        </tr>
        <tr>
            <td align="right">批准年月：</td>
            <td><input class="layui-input" type="text" name="approval_date" id="approval_date" value="" lay-verify="required}date"/></td>
            <td></td>
        </tr>
        <tr>
            <td align="right">批准文号：</td>
            <td><input class="layui-input" type="text" name="approval_number" id="approval_number" value="" lay-verify="required"/></td>
            <td></td>
        </tr>
        <tr>
            <td align="right">技术领域：</td>
            <td><input class="layui-input" type="text" name="field" id="field" value="" lay-verify="required"/></td>
            <td></td>
        </tr>
        <tr>
            <td align="center" colspan="3"><button class="layui-btn layui-btn-lg layui-btn-normal" lay-submit="PlatformSubmit" lay_filter="btn_submit">注册</button></td>
        </tr>
    </table>
</form>
<script>
    layui.use('form', function(){
        var form = layui.form;

        //各种基于事件的操作，下面会有进一步介绍
    });
</script>
</body>
</html>

