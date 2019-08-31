<%--
  Created by IntelliJ IDEA.
  User: zhiqiang.Li
  Date: 2018/3/29
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>登陆</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body style="background:url('image/background.jpg')">
<h1 style="font-family:微软雅黑;margin-top:130px;color:white;text-align:center;">河北科技创新平台年报系统</h1>
<div id="loginbox">
    <div>
        <form action="Login" style="text-align: center;" method="post">
            <input type="text" class="logininput" name="username" style="margin-top:90px;background-image:url('image/person.jpg')" placeholder="用户名" required><br />
            <input type="password" class="logininput" name="password" style="margin-top:10px;background-image:url('image/password.jpg')" placeholder="密码" required><br />
            <div class="logininput" style="margin-left:auto;margin-right:auto;margin-top:20px;text-align:center">
                <input class="loginbutton" value="登陆" style="margin-right: 17px;" type="submit">
                <a href="register.jsp"><button class="loginbutton" id="registerbutton" style="margin-right: 24px;" type="button">注册</button></a>
            </div><br />
        </form>
    </div>
</div>
</body>
</html>