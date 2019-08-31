<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/4
  Time: 0:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>查询</title>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="css/SimpleTree.css"/>
    <script type="text/javascript" src="js/jquery-3.2.1.js" ></script>
    <script type="text/javascript" src="js/subjects.js" ></script>
    <script type="text/javascript" src="js/SimpleTree.js" ></script>
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
<script type="text/javascript">
$(function(){

	$(".st_tree").SimpleTree({
		
	});
	
});
</script>

<div id="content">
    <div id="head">
        <h1 style="padding: 50px 0;">河北科技</h1>
    </div>
    <div class="st_tree" style="float: left;width: 17.62%;background-color: rgba(238,238,238,0.5);;">
		<p>分类浏览</p>
		<ul>
			<script>
				$.each(SUBJECT[100], function(key,value) {
					document.write("<li class='folder open'>" + value + "</li>");
					document.write("<ul>");
					$.each(SUBJECT[key], function(key,value) {
						document.write("<li><a onclick='$(\"#result\").attr(\"src\",\"Select?catagory=" + key + "\")'>" + value + "</a></li>");
		
					});
					document.write("</ul>");
				});
			</script>
		</ul>

    </div>
    <div style="float: left;background-color:rgba(238,238,238,0.5);width: 79%;border-left: solid 1px #8a8a8a;padding-left: 20px;height:1172px;">
        <div style="margin-top: 26px;">
            <p class="title">查询结果:</p>
        </div>
        <iframe id="result" scrolling="no" style="width: 98%;height: 1125px;" name="results"></iframe>
<!--         <div>
            <ul class="table_list" style="margin: 20px 30px;">
                <li>撒地方撒地方深蓝撒地方重大科技创新平台</li>
                <li>人工智能APP撒地方吧撒地方科技创新平台</li>
                <li>见就就叫阿三地方垃圾啊收到了房价 烦烦烦</li>
            </ul>
        </div> -->
    </div>
</div>
<footer style="text-align: center;padding: 20px;clear:left">河北科技©Copyright版权所有</footer>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript">
	//加载form模块
	var form;
	
	layui.use('form',function () {
		form = layui.form;
	})
	//加载日期模块
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#approval_date' //指定元素
        });
    });
</script>
</body>
