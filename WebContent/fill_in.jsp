<%@ page import="com.hbkj.dao.PlatformDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.hbkj.model.Platform" %><%--
  Created by IntelliJ IDEA.
  User: Zhiqiang.Li
  Date: 2018/3/30
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="com.hbkj.model.User" scope="session"/>
<jsp:useBean id="platform" class="com.hbkj.model.Platform" scope="request"/>

<%
//    String isUpdate = request.getParameter("update");
//    if ("1".equals(isUpdate)) {             //更新platform对象
//        PlatformDao platformDao = new PlatformDao();
//        if (platform.getId() == 0) {
//            platform = platformDao.loadPlatformByUserid(user.getId());
//        }
//    }
    PlatformDao platformDao = new PlatformDao();
    if (platform == null || platform.getId() == 0)
        platform = platformDao.loadPlatformByUserid(user.getId());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>平台填报</title>
    <link rel="stylesheet" href="layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <script type="text/javascript" src="js/demo.js"></script>
    <script type="text/javascript" src="js/StandardIndustrialClassificationCodes.js"></script>
</head>
<body onload="load()" style="background-color: white;margin-top: -37px;">
<h1 style="text-align: center;margin-top: 50px;">河北科技创新平台年报统计表</h1>
<h2 style="text-align: center;">(2016年度)</h2>

<!--
    作者：zhiqiang.Li
    时间：2018-04-01
    描述：平台基本信息表格
-->
<div>
    <label class="lab_title" style="margin-left: 5%;">平台基本信息：</label>
</div>
<form id="plat_form" class="layui-form" action="PlatformSubmit" method="post">
    <table class="layui-table tab middle_self">
        <tr>
            <td align="right" height="50"><font class="must">*</font>平台名称：</td>
            <td><input type="text" name="platform_name" id="platform_name" value="<%=user.getPlatformName()%>" class="tb_input" disabled="disabled"/></td>
            <td align="right"><font class="must">*</font>平台编号：</td>
            <td><input type="text" name="platform_number" id="platform_number" value="<%=user.getPlatformNo()%>" class="tb_input" disabled="disabled"/></td>
        </tr>
        <tr>
            <td align="right" height="50"><font class="must">*</font>批准年月：</td>
            <td><input type="text" name="approval_date" id="approval_date" value="<%=user.getApprovalDate()%>" class="tb_input" disabled="disabled"/></td>
            <td align="right"><font class="must">*</font>批准文号：</td>
            <td><input type="text" name="approval_number" id="approval_number" value="<%=user.getApprovalNum()%>" class="tb_input" disabled="disabled"/></td>
        </tr>
        <tr>
            <td align="right" height="50" colspan="1"><font class="must">*</font>技术领域：</td>
            <td colspan="3"><input type="text" name="field" id="field" value="<%=user.getField()%>" disabled="disabled" class="tb_input" /></td>
        </tr>
        <tr>
            <td align="right" height="50"><font class="must">*</font>平台级别：</td>
            <td>
                <input type="checkbox" name="platform_grade" id="country_grade" value="1" lay-skin="primary"/>&nbsp;&nbsp;国家级&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="checkbox" name="platform_grade" id="province_grade" value="2" lay-skin="primary"/>&nbsp;&nbsp;省级
            </td>
            <td align="right"><font class="must">*</font>所在市县：</td>
            <td>
                <div style="float: left;width: 120px;">
                    <select name="province" style="width: 10px;float: left;" lay-verify="required">
                        <option value="">请选择省份</option>
                    </select>
                </div>
                <div style="float: left;width: 120px;margin-left: 10px;">
                    <select name="city" lay-verify="required">
                        <option value="">请选择市</option>
                    </select>
                </div>
                <div style="float: left;width: 150px;margin-left: 10px;">
                    <select name="district" lay-verify="required">
                        <option value="">请选择县/镇/区</option>
                    </select>
                </div>
            </td>
        </tr>

        <tr>
            <td rowspan="2" height="50" align="right"><font class="must">*</font>平台组织形态</td>
            <td height="25" >
                <input type="radio" name="platform_form" id="rela_independent" value="1" title="内设机构相对独立" checked="checked"/>
            </td>
            <td rowspan="2">
                <div id="faren_type">
                    <input type="radio" name="faren_type" id="faren_type1" value="2" title="企业法人" disabled="disabled" /><br />
                    <input type="radio" name="faren_type" id="faren_type2" value="3" title="事业法人" disabled="disabled" /><br />
                    <input type="radio" name="faren_type" id="faren_type3" value="4" title="社团法人" disabled="disabled" /><br />
                </div>
            </td>
            <td>
                <input type="radio" name="unite" id="unite" value="united" title="多单位联合共建" checked="checked"/>
                <input type="radio" name="unite" id="nounite" value="nounited" title="依托单位独自建设"/>
            </td>
        </tr>
        <tr>
            <td height="25"><input style="height: 25px;" type="radio" name="platform_form" id="independent" value="0" title="独立法人"/></td>
            <td>京津冀共建：
                <input type="radio" name="jjjgj" id="jjjgj" value="yes" title="是" checked="checked" />
                <input type="radio" name="jjjgj" id="nojjjgj" value="no" title="否" />
            </td>
        </tr>
        <tr>
            <td align="right">服务的主要国民经济行业</td>
            <td colspan="3">
                <div style="float: left;width: 120px;">
                    门类：<select id="category" lay-filter="category" name="category" class="layui-select"></select>
                </div>
                <div style="float: left;width: 120px;margin-left: 10px;">
                    大类：<select id="division" lay-filter="division" name="division" class="layui-select"></select>
                </div>
                <div style="float: left;width: 150px;margin-left: 10px;">
                    中类：<select id="group" lay-filter="group" name="group" class="layui-select"></select>
                </div>
                <div style="float: left;width: 150px;margin-left: 10px;">
                    小类：<select id="section" lay-filter="section" name="section" class="layui-select"></select>
                </div>
            </td>
        </tr>

        <tr>
            <td align="right">所属的主要学科</td>
            <td colspan="3">
                <div style="float: left;width: 180px;">
                    <select name="subject1" style="width: 10px;float: left;" lay-verify="required">
                        <option value="">请选择一级学科分类</option>
                    </select>
                </div>
                <div style="float: left;width: 180px;margin-left: 10px;">
                    <select name="subject2" lay-verify="required">
                        <option value="">请选择二级学科分类</option>
                    </select>
                </div>
                <div style="float: left;width: 180px;margin-left: 10px;">
                    <select name="subject3" lay-verify="required">
                        <option value="">请选择三级学科分类</option>
                    </select>
                </div>
            </td>
        </tr>
        </thead>
    </table>


    <!--
        作者：iv2013@qq.com
        时间：2018-04-01
        描述：依托单位信息表格
    -->
    <div style="margin-top: 20px;">
        <label class="lab_title" style="margin-left: 5%;">依托单位信息：</label>
    </div>
    <table class="layui-table tab middle_self">
        <tr>
            <td align="right" height="50" width="20%"><font class="must">*</font>依托单位名称：</td>
            <td><input type="text" name="dep_organization_name" id="dep_organization_name" placeholder="如：百度" value="" class="tb_input" lay-verify="required" /></td>
            <td align="right"><font class="must">*</font>依托单位组织机构代码(社会信用代码)：</td>
            <td><input type="text" name="dep_organization_number" id="dep_organization_number" placeholder="如：91430111MA4L16JQ9B" value="" class="tb_input" lay-verify="required|usci" style="text-transform: uppercase" /></td>
        </tr>
        <tr>
            <td align="right" height="50"><font class="must">*</font>依托单位法人代表姓名：</td>
            <td><input type="text" name="dep_organization_faren" id="dep_organization_faren" placeholder="如：齐志刚" value="" class="tb_input" lay-verify="required"/></td>
            <td align="right" height="50"><font class="must">*</font>办公电话：</td>
            <td><input type="text" name="dep_organization_phone" id="dep_organization_phone" placeholder="如：03105705554" value="" class="tb_input" lay-verify="require|telephone" /></td>
        </tr>
        <tr>
            <td align="right" height="50"><font class="must">*</font>依托单位类型：</td>
            <td colspan="3">
                <input type="radio" name="dep_organization_type" id="enterprise_type" value="enterprise" title="企业" checked="checked" />
                <input type="radio" name="dep_organization_type" id="science_type" value="science" title="科研机构" />
                <input type="radio" name="dep_organization_type" id="university_type" value="university" title="高等院校" />
                <input type="radio" name="dep_organization_type" id="delection_type" value="delection" title="检测机构" />
                <input type="radio" name="dep_organization_type" id="medical_type" value="medical" title="医疗机构" />
                <input type="radio" name="dep_organization_type" id="government_type" value="government" title="政府机构" />
                <input type="radio" name="dep_organization_type" id="association_type" value="association" title="社团组织" />
                <input type="radio" name="dep_organization_type" id="orther_type" value="orther" title="其它" />
            </td>
        </tr>
        <tr>
            <td align="right">共建单位：</td>
            <td colspan="3">
                <input type="text" name="gjdw" value="" class="tb_input" style="width: 50%;" placeholder="请输入共建单位" lay-verify="required" />
                <button type="button" id="delete" class="layui-btn layui-btn-sm layui-btn-normal" style="margin-left: 10px;">
                    <i class="layui-icon">&#xe640;</i>
			    </button>
			    <button type="button" id="add" class="layui-btn layui-btn-sm layui-btn-normal">
                    <i class="layui-icon">&#xe654;</i>
			    </button>
            </td>
        </tr>
    </table>

    <!--
        作者：zhiqiang.Li
        时间：2018-04-01
        描述：平台主任信息
    -->
    <div style="margin-top: 20px;">
        <label class="lab_title" style="margin-left: 5%;">平台主任信息：</label>
    </div>
    <table class="layui-table tab middle_self">
        <tr>
            <td rowspan="3" width="9%" align="center">平台主任(院长)</td>
            <td align="right" height="50" width="10%"><font class="must">*</font>姓名：</td>
            <td width="15%"><input type="text" name="dean_name" id="dean_name" placeholder="如：郑国庆" value="" class="tb_input" lay-verify="required"/></td>
            <td align="right" width="8%"><font class="must">*</font>性别：</td>
            <td width="9%">
                <input type="radio" name="sex" id="male" value="male" title="男" class="layui-input-inline" checked="checked" />
                <input type="radio" name="sex" id="female" value="female" title="女" class="layui-input-inline" />
            </td>
            <td align="right" width="10%"><font class="must">*</font>出生年月：</td>
            <td align="right" width="15%"><input type="text" name="birthday" id="birthday" placeholder="如：1987-05-01" value="" class="layui-input" lay-verify="required|date"/></td>
            <td align="right" width="8%"><font class="must">*</font>职称：</td>
            <td align="right" width="16%"><input type="text" name="job_title" id="job_title" placeholder="如：会计师" value="" class="tb_input" lay-verify="required"/></td>
        </tr>
        <tr>
            <td align="right" height="50"><font class="must">*</font>所学专业：</td>
            <td colspan="2"><input type="text" name="major" id="major" placeholder="如：通信工程" value="" class="tb_input" lay-verify="required"/></td>
            <td align="right" height="50"><font class="must">*</font>学历：</td>
            <td colspan="2"><input type="text" name="education" id="education" placeholder="如：本科" value="" class="tb_input" lay-verify="required"/></td>
            <td align="right" height="50"><font class="must">*</font>学位：</td>
            <td><input type="text" name="degree" id="degree" placeholder="如：硕士" value="" class="tb_input" lay-verify="required"/></td>
        </tr>
        <tr>
            <td align="right" height="50"><font class="must">*</font>办公电话：</td>
            <td colspan="2"><input type="text" name="dean_telephone" id="dean_telephone" placeholder="如：031110105777" value="" class="tb_input" lay-verify="required|telephone" /></td>
            <td align="right" height="50"><font class="must">*</font>手机：</td>
            <td colspan="2"><input type="text" name="dean_mobilephone" id="dean_mobilephone" placeholder="如：15127045632" value="" class="tb_input" lay-verify="required|phone" /></td>
            <td align="right" height="50"><font class="must">*</font>Email：</td>
            <td><input type="text" name="dean_email" id="dean_email" placeholder="如：iv20@163.com" value="" class="tb_input" lay-verify="required|email" /></td>
        </tr>
    </table>

    <!--
        作者：zhiqiang.Li
        时间：2018-04-01
        描述：平台联系信息
    -->
    <div style="margin-top: 20px;">
        <label class="lab_title" style="margin-left: 5%;">平台联系信息：</label>
    </div>
    <table class="layui-table tab middle_self">
        <tr>
            <td align="right" height="50" width="14%"><font class="must">*</font>平台网站名称：</td>
            <td width="43%"><input type="text" name="platform_site_name" id="site_name" placeholder="如：创新平台" value="" class="tb_input" lay-verify="required" /></td>
            <td align="right" width="14%"><font class="must">*</font>平台网站地址：</td>
            <td><input type="text" name="platform_website" id="platform_website" placeholder="如：http://www.baidu.com" value="" class="tb_input" lay-verify="required|url" /></td>
        </tr>
        <tr>
            <td align="right" height="50"><font class="must">*</font>平台通讯地址：</td>
            <td><input type="text" name="platform_addr" id="platform_addr" placeholder="如：广东省广州市天河区先烈东路沙河西街32号2梯403" value="" class="tb_input" lay-verify="required" /></td>
            <td align="right">邮编：</td>
            <td><input type="text" name="platform_postcode" id="platform_postcode" placeholder="如：056151" value="" class="tb_input" lay-verify="required|postcode"/></td>
        </tr>
    </table>
    <input type="hidden" name="status" value="2" ><%--用于区分保存还是提交--%>


    <%if (platform == null || platform.getStatus() != 2){%>
    <div style="text-align: center;">
        <button class="layui-btn layui-btn-lg layui-btn-normal" type="button" lay-filter="btn_save">保存</button>
        <button class="layui-btn layui-btn-lg layui-btn-normal" lay-submit="PlatformSubmit" lay_filter="btn_submit">提交</button>
    </div>
    <%}%>
</form>
<footer style="height: 20px"></footer>
<script type="text/javascript" src="js/jquery-3.2.1.js" ></script>
<script type="text/javascript" src="js/china.js" ></script>
<script type="text/javascript" src="js/subjects.js" ></script>
<script type="text/javascript" src="layui/layui.js" ></script>
<script type="text/javascript">

    layui.use("form")
    addressInit('category','division','group','section','A 农、林、牧、渔业', '01 农业', '011 谷物种植', '0111 稻谷种植');
</script>
<script type="text/javascript" src="js/demo.js" ></script>
<%if (platform != null && platform.getId() != 0){
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
    <script>
        <%try{%>
        $("input[name='birthday']").val("<%=sdf.format(platform.getDean().getDate())%>")
        <%}catch (Exception e){
            System.out.println("日期错误");
        }%>
        $("input[name='dean_email']").val("<%=platform.getDean().getEmail()%>")	//iv2013@qq.com
        $("input[name='dean_mobilephone']").val("<%=platform.getDean().getMobilephone()%>")	//15131027238
        $("input[name='dean_name']").val("<%=platform.getDean().getName()%>")	//郑国庆
        $("input[name='dean_telephone']").val("<%=platform.getDean().getTelephone()%>")	//03111010577
        $("input[name='degree']").val("<%=platform.getDean().getDegree()%>")	//硕士
        $("input[name='dep_organization_faren']").val("<%=platform.getOrganization().getFarenName()%>")	//齐志刚
        $("input[name='dep_organization_name']").val("<%=platform.getOrganization().getName()%>")	//百度
        $("input[name='dep_organization_number']").val("<%=platform.getOrganization().getUsci()%>")	//91430111MA4L16JQ9B
        $("input[name='dep_organization_phone']").val("<%=platform.getOrganization().getTelephone()%>")	//03105705554

        var o_type = "<%=platform.getOrganization().getType()%>";
        switch (o_type){
            case "enterprise": $("#enterprise_type").attr("checked","checked");break;
            case "science": $("#science_type").attr("checked","checked");break;
            case "university": $("#university_type").attr("checked","checked");break;
            case "delection": $("#delection_type").attr("checked","checked");break;
            case "medical": $("#medical_type").attr("checked","checked");break;
            case "government": $("#government_type").attr("checked","checked");break;
            case "association": $("#association_type").attr("checked","checked");break;
            case "orther": $("#orther_type").attr("checked","checked");break;
            default:alert("系统内部错误");
        }

        $("input[name='education']").val("<%=platform.getDean().getEducation()%>")	//本科
        $("input[name='gjdw']").val("<%=platform.getGjdw()[0]%>")	//共建单位
        <%for(int i = 1;i < platform.getGjdw().length;i++){%>
            $("#delete").before('<input name="gjdw" value="<%=platform.getGjdw()[i]%>" class="tb_input" style="width: 50%;margin-top:10px" onkeyup="this.value=this.value.replace(/\\s+/g,\'\')" type="text" placeholder="请输入共建单位" lay-verify="required">')
        <%}%>
        //是否京津冀共建
        <%if (platform.isJjjgj()){%>
            $("#jjjgj").attr("checked","checked")
        <%}else {%>
            $("#nojjjgj").attr("checked","checked")
        <%}%>

        $("input[name='job_title']").val("<%=platform.getDean().getJobTitle()%>")	//会计师
        $("input[name='major']").val("<%=platform.getDean().getMajor()%>")	//通信工程
        $("input[name='platform_addr']").val("<%=platform.getAddr()%>")	//广东省

        //平台组织形态
        var formValue = <%=platform.getForm()%>;
        if(formValue == <%=Platform.RELATIVE_INDEPENDENT%>)
            $("#rela_independent").attr("checked","checked")
        else{
            $("#independent").attr("checked","checked")
            $("#faren_type input").removeAttr("disabled");
            switch (formValue){
                case 2:$("#faren_type1").attr("checked","checked");break;
                case 3:$("#faren_type2").attr("checked","checked");break;
                case 4:$("#faren_type3").attr("checked","checked");break;
                default:alert("系统内部错误");
            }
        }
        //平台级别（国家级/省级）
        <%if (platform.getGrade() == Platform.NATIONAL || platform.getGrade() == (Platform.NATIONAL | Platform.PROVINCIAL)){%>
            $("#country_grade").attr("checked","checked");
        <%}if (platform.getGrade() == Platform.PROVINCIAL || platform.getGrade() == (Platform.NATIONAL | Platform.PROVINCIAL)){%>
            $("#province_grade").attr("checked","checked");
        <%}%>


        $("input[name='platform_grade']").val("<%=platform.getGrade()%>")	//{…}
        $("input[name='platform_postcode']").val("<%=platform.getPostcode()%>")	//056151
        $("input[name='platform_site_name']").val("<%=platform.getSitename()%>")	//创新平台
        $("input[name='platform_website']").val("<%=platform.getWebsite()%>")	//http://www.baidu.com

        <%if ("male".equals(platform.getDean().getSex())){%>
            $("#male").attr("checked","checked")
        <%}else {%>
            $("#female").attr("checked","checked")
        <%}%>

        //所属主要学科
        var subjectValue = "<%=platform.getSubject()%>";

        $("input[name='subject1']").val("<%=platform.getSubject()%>")	//130
        $("input[name='subject2']").val("<%=platform.getSubject()%>")	//13020
        $("input[name='subject3']").val("<%=platform.getSubject()%>")	//1302002

        //是否多单位联合共建
        <%if (platform.isUnite()){%>
            $("#unite").attr("checked","checked")
        <%}else {%>
            $("#nounite").removeAttr("checked","checked")
        <%}%>
        var district = <%=platform.getDistrict()%>;
        var city = Math.floor(district / 100) * 100;
        var province = Math.floor(district / 10000) * 10000;

        <%if(platform.getStatus() == 2){%>
        $("input").attr("disabled","disabled")
        $("select").attr("disabled","disabled")
        $("#add").css({"display":"none"});
        $("#delete").css({"display":"none"});
        <%}%>
    </script>
<%}%>
</body>
</html>