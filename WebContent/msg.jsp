<%--
  Created by IntelliJ IDEA.
  User: zhiqiang.Li
  Date: 2018/3/29
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="msg" class="java.lang.String" scope="request"></jsp:useBean>
<html>
<head>
    <link rel="stylesheet" href="layui/css/layui.css" />
    <script type="text/javascript" src="layui/layui.js" ></script>
    <title>提示信息</title>
</head>
<body style="width: 100%;height: 600px;">
    <script>
        layui.use("layer",function(){
            var layer = layui.layer;
            layer.open(<%=msg%>);
        })
    </script>
</body>
</html>
