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
    <script type="text/javascript" src="js/demo.js"></script>
</head>
<style>
    #content{
        background-color: rgba(238,238,238,0.5);
    }
    #content,#head{
        width: 100%;
        background: #eaf2fdff;
    }
    #catagory li{
        font-size: 16px;
        margin-left: 10px;
    }
    /***数量+、-按钮***/
	#increase,#decrease{
		background: none;
		border: solid black 1px;
		width: 20px;
		margin-top: 5px;
		cursor: pointer;
		padding: 0px;
	}
	#increase:hover,#decrease:hover{
		background-color: #B2D1FF;
	}
	#increase:active,#decrease:active{
		background-color: #BBBBBB;
	}
	#increase:disabled,#decrease:disabled{
		background-color: #FFFFFF;
	}
	/*每一个条件行*/
	.item{
		display:flex;
		flex-direction:row;
		justify-content:flex-start;
		align-items:center;
	}
	.ite{
		margin:10px 10px;
	}
	.results{
		float: left;
		background-color:white;
		width: 909px;
		border:solid 1px #8a8a8a;
		height:991px;
	}
	.class_head{
		background-color: #eaf2fd;
		padding: 12px;
		font-size: 14px;
		font-family: simsun;
		font-weight: bold;
		color: #6b97d1;
	}
	a:hover{
		color:"red"
	}
</style>
<body>
<script type="text/javascript">
$(function(){

	$(".st_tree").SimpleTree({
	});
	$("#increase").click(function(){
		
		var end = $(".item").length - 2;
	   	$(".item").eq(end).after('<div class="item">				<div class="layui-input-inline ite" style="width:100px;">					<select name="relate">						<option value="AND">并且</option>						<option value="OR">或者</option>						<option value="AND NOT">不含</option>					</select>				</div>				<font>(</font>				<div class="layui-input-inline ite" style="width:100px;">					<select name="condition">						<option value="platform_name">平台名称</option>						<option value="field">技术领域</option>						<option value="organization.name">依托单位</option>						<option value="organization.type">依托单位类型</option>						<option value="Pgjdw">共建单位</option>						<option value="dean.name">平台主任姓名</option>					</select>				</div>				<div class="layui-input-inline ite">	                <input type="text" name="value" class="layui-input" />	            </div>				<div class="layui-input-inline ite" style="width:100px;">					<select name="con">						<option value="AND">并含</option>						<option value="OR">或含</option>						<option value="AND NOT">不含</option>					</select>				</div>	            <div class="layui-input-inline ite">	                <input type="text" name="value2" class="layui-input" />	            </div><div class="layui-input-inline ite" style="width:100px;"><select name="accuracy"><option value="accuracy">精确</option><option value="obscure">模糊</option></select></div>	            <font>)</font>            </div>')
		layui.use('form',function(){
			form = layui.form;
			form.render("select");
		})
	})
	$("#decrease").click(function(){
		
		var end = $(".item").length - 2;
		if(end > 0)
	   		$(".item").eq(end).remove();
	})
});

</script>
<div id="content">
    <!-- <div id="head">
        <h1 style="padding: 50px 0;color:blue;">河北省科技创新平台年报系统</h1>
    </div> -->
    <!-- 原背景色：rgba(238,238,238,0.5) -->
    <div class="st_tree" style="border:solid 1px #8a8a8a;float: left;width: 234px;background-color: white;padding:0;padding-bottom: 34px;overflow-y: scroll;height: 1291px;">
		<p class="class_head">》 学科分类目录</p>
		<ul>
			<input type="checkbox"  style="float:left" id="selectAll" checked /><li>全选</li>
			<script>
				$.each(SUBJECT[100], function(key,value) {
					document.write("<input class='subject1' checked name=subject style='float:left' value=" + key + " type='checkbox' /><li class='folder open'>" + value + "</li>");
					document.write("<ul>");
					
					$.each(SUBJECT[key], function(key,value) {
						document.write("<input class='subject2' checked name=subject style='float:left' value=" + key + " type='checkbox' /><li>" + value + "</li>");
						document.write("<ul>");
						
						$.each(SUBJECT[key], function(key,value) {
							document.write("<input class='subject3' checked name=subject style='float:left' value=" + key + " type='checkbox' /><li><a onclick='$(\"#result\").attr(\"src\",\"Select?catagory=" + key + "\")'>" + value + "</a></li>");
						});
						document.write("</ul>");
						
					});
					
					document.write("</ul>");
				});
			</script>
		</ul>

    </div>
    <!--查询条件 原背景色：rgba(238,238,238,0.5) -->
    <div style="float: left;background-color:white;width: 909px;border:solid 1px #8a8a8a;padding: 0 0px 20px 0px;overflow-y: scroll;height: 312px;">
        <p style="font-family: simsun;font-size: 14px;color: #6b97d1;background-color: #eaf2fd;padding: 10px;font-weight: bold;">输入检索条件：</p>
        <form style="padding-left: 20px;" id="search" target="results" action="Select" class="layui-form">
			<!-- 每个条件 -->
     		<div class="item">
     		    <!-- 增减条件按钮 -->
	     		<div style="margin:10px 38px;">
	     			<button type="button" id="increase">+</button>
		            <button type="button" id="decrease">-</button>
				</div>
				<font>(</font>
				<div class="layui-input-inline ite" style="width:100px;">
					<select name="condition">
						<option value="platform_name">平台名称</option>
						<option value="field">技术领域</option>
						<option value="organization.name">依托单位</option>
						<option value="type">依托单位类型</option>
						<option value="Pgjdw">共建单位</option>
						<option value="dean.name">平台主任姓名</option>
					</select>
				</div>
				<div class="layui-input-inline ite">
	                <input type="text" name="value" class="layui-input" />
	            </div>
				<div class="layui-input-inline ite" style="width:100px;">
					<select name="con">
						<option value="and">并含</option>
						<option value="or">或含</option>
						<option value="and not">不含</option>
					</select>
				</div>
	            <div class="layui-input-inline ite">
	                <input type="text" name="value2" class="layui-input" />
	            </div>
	            <div class="layui-input-inline ite" style="width:100px;">
					<select name="accuracy">
						<option value="accuracy">精确</option>
						<option value="obscure">模糊</option>
					</select>
				</div>
	            <font>)</font>
            </div>
            
            <!-- 条件结束 -->
            <div class="item">
           		<font>批准年月：</font>
           		<font>从</font>
                <div class="layui-input-inline ite">
                	<input type="text" name="approval_date" id="approval_date" placeholder="如：1987-05-01" value="" class="layui-input" lay-verify="required|date"/>
                </div>
                <font>至</font>
                <div class="layui-input-inline ite">
                	<input type="text" name="approval_date2" id="approval_date" placeholder="如：1987-05-01" value="" class="layui-input" lay-verify="required|date"/>
                </div>
            </div>
            <div>
            	<div class="layui-input-inline">
                	平台级别：
					<input type="checkbox" name="platform_grade" id="country_grade" value="1" lay-skin="primary"/>&nbsp;&nbsp;国家级&nbsp;&nbsp;&nbsp;&nbsp;
                	<input type="checkbox" name="platform_grade" id="province_grade" value="2" lay-skin="primary"/>&nbsp;&nbsp;省级
                </div>
                <div class="layui-input-inline">
                	<input type="checkbox" name="jjjgj" id="country_grade" value="1" lay-skin="primary"/>&nbsp;&nbsp;京津冀共建&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div>
	                <div class="layui-input-inline" style="float:right;margin-right:20px;margin-bottom: 20px;">
	                    <input type="submit" value="查询" class="layui-btn"/>
	                </div>
                </div>
            </div>
        </form>
    </div>
    <!-- 查询结果 -->
    <div class="results">
    	<p style="background-color: #eaf2fd;padding: 13px;color: #6b97d1;font-family: simsun;font-weight: bold;">查询结果</p>
    	<iframe src="Select?catagory=" id="result" scrolling="no" style="width: 98%;height: 943px;border:none;margin-left: 10px;" name="results">
        </iframe>
    </div>
</div>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/china.js"></script>
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
        
      	//执行一个laydate实例
        laydate.render({
            elem: '#approval_date2' //指定元素
        });
    });
	//全选/取消全选按钮
	$("#selectAll").change(function(e){
		if($(this).is(':checked')){
			$("input[name='subject']").attr("checked","checked");
		}else{
			$("input[name='subject']").removeAttr("checked");
		}
	});
	//学科分类
	$(".subject1").change(function(e){
		let ul = $(this).next().next();
		console.log();
		if($(this).is(':checked'))
			ul.children("input").attr("checked","checked");
		else
			ul.children("input").removeAttr("checked");
	});
	$(".subject2").change(function(e){
		let ul = $(this).next().next();
		console.log();
		if($(this).is(':checked'))
			ul.children("input").attr("checked","checked");
		else
			ul.children("input").removeAttr("checked");
	});
</script>
</body>
</html>