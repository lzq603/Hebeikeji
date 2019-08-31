package com.hbkj.servlet;

import com.hbkj.dao.DeanDao;
import com.hbkj.dao.OrganizationDao;
import com.hbkj.dao.PlatformDao;
import com.hbkj.model.Dean;
import com.hbkj.model.Organization;
import com.hbkj.model.Platform;
import com.hbkj.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "PlatformSubmitServlet")
public class PlatformSubmitServlet extends HttpServlet {

    //HTML框架
    private String html_head = "<html>\n" +
            "<head>\n" +
            "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
            "    <link rel=\"stylesheet\" href=\"layui/css/layui.css\">\n" +
            "    <script type=\"javascript\" src=\"layui/layui.js\" ></script>\n" +
            "    <title>Title</title>\n" +
            "</head>\n" +
            "<body>\n";
    private String html_tail = "</body>\n" +
            "</html>";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //从Session中获取填报用户
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        /***平台基本信息***/
        String[] platform_grade = request.getParameterValues("platform_grade"); //平台级别
        String platform_province = request.getParameter("province");            //所在省
        String platform_city = request.getParameter("city");                    //所在市
        String platform_district = request.getParameter("district");            //所在区
        String platform_form = request.getParameter("platform_form");           //平台组织形态
        String platform_subject = request.getParameter("subject3");             //所属主要学科
        String platform_faren_type = request.getParameter("faren_type");        //法人类型
        String platform_unite = request.getParameter("unite");                  //联合共建/独自建设
        String platform_jjjgj = request.getParameter("jjjgj");                  //京津冀共建
        String[] platform_gjdw = request.getParameterValues("gjdw");            //共建单位

        int gradeValue = 0;
        System.out.println("平台基本信息：");
        if (platform_grade != null){
            for (String grade:platform_grade) {
                gradeValue = gradeValue|Integer.valueOf(grade);
                System.out.println("平台级别：" + gradeValue);
            }
        }

        int formValue = 0;
        try {
            formValue += Integer.valueOf(platform_form);
            formValue += Integer.valueOf(platform_faren_type);
        }catch (NumberFormatException e){
            System.out.println("数值解析错误");
        }

        System.out.println(platform_province);
        System.out.println(platform_city);
        System.out.println(platform_district);
        System.out.println(platform_form);
        System.out.println(platform_faren_type);
        System.out.println(platform_unite);
        System.out.println(platform_jjjgj);
        if (platform_gjdw != null){
            for (String g:platform_gjdw){
                if (!"".equals(g))
                    System.out.println(g);
            }
        }
        System.out.println("");



        /**********************************/
        /**暂缺国民经济行业**/
        /**********************************/

        /***依托单位信息**/
        String dep_organization_name = request.getParameter("dep_organization_name");       //依托单位名称
        String dep_organization_number = request.getParameter("dep_organization_number");   //社会信用代码
        String dep_organization_faren = request.getParameter("dep_organization_faren");     //法人代表姓名
        String dep_organization_phone = request.getParameter("dep_organization_phone");     //办公电话
        String dep_organization_type = request.getParameter("dep_organization_type");       //依托单位类型


        System.out.println("依托单位信息：");
        System.out.println(dep_organization_name);
        System.out.println(dep_organization_number);
        System.out.println(dep_organization_faren);
        System.out.println(dep_organization_phone);
        System.out.println(dep_organization_type);
        System.out.println("");



        /***平台主任***/
        String dean_name = request.getParameter("dean_name");                               //平台主任姓名
        String dean_sex = request.getParameter("sex");                                      //性别
        String dean_birthday = request.getParameter("birthday");                            //出生年月
        String dean_job_title = request.getParameter("job_title");                          //职称
        String dean_major = request.getParameter("major");                                  //所学专业
        String dean_education = request.getParameter("education");                          //学历
        String dean_degree = request.getParameter("degree");                                //学位
        String dean_telephone = request.getParameter("dean_telephone");                     //办公电话
        String dean_mobilephone = request.getParameter("dean_mobilephone");                 //手机
        String dean_email = request.getParameter("dean_email");                             //Email

        System.out.println("平台主任信息：");
        System.out.println(dean_name);
        System.out.println(dean_sex);
        System.out.println(dean_birthday);
        System.out.println(dean_job_title);
        System.out.println(dean_major);
        System.out.println(dean_education);
        System.out.println(dean_degree);
        System.out.println(dean_telephone);
        System.out.println(dean_mobilephone);
        System.out.println(dean_email);
        System.out.println("");


        /***平台联系信息***/
        String platform_site_name = request.getParameter("platform_site_name");             //平台网站名称
        String platform_website = request.getParameter("platform_website");                 //平台网站地址
        String platform_addr = request.getParameter("platform_addr");                       //平台通讯地址
        String platform_postcode = request.getParameter("platform_postcode");               //邮编

        System.out.println("平台联系信息");
        System.out.println(platform_site_name);
        System.out.println(platform_website);
        System.out.println(platform_addr);
        System.out.println(platform_postcode);

        /***提交信息***/
        String status = request.getParameter("status");         // "1"：保存   "2"：提交
        System.out.println("平台信息状态：" + status);
        int statusValue = 0;
        try {
            statusValue = Integer.parseInt(status);
        }catch (NumberFormatException e){
            System.out.println("数值解析错误");
        }


        /***更新数据库***/

        PlatformDao platformDao = new PlatformDao();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");          //日期格式解析

        Platform platform = platformDao.loadPlatformByUserid(user.getId());          //平台
        //依托单位
        Organization organization = new Organization(dep_organization_name,dep_organization_number,dep_organization_faren,dep_organization_phone,dep_organization_type);

        //平台院长
        Dean dean = null;
        Timestamp birthday = null;
        try {
            birthday = new Timestamp(sdf.parse(dean_birthday).getTime());
        } catch (ParseException e) {
            System.out.println("日期解析错误！");
        }
        dean = new Dean(dean_name,dean_sex,birthday,dean_job_title,dean_major,dean_education,dean_degree,dean_telephone,dean_mobilephone,dean_email);


        /***用户未保存过平台***/
        if (platform == null){

            //平台信息
            platform = new Platform(user,organization,dean,gradeValue,platform_district,formValue,"united".equals(platform_unite),"yes".equals(platform_jjjgj),"主要国民经济行业",platform_subject,platform_gjdw,platform_site_name,platform_website,platform_addr,platform_postcode,statusValue);
            platformDao.addPlatform(platform);

            if (statusValue == 1){

                //返回JSON数据，弹出保存成功对话框
                response.setContentType("text/json");
                PrintWriter writer = response.getWriter();
                writer.write("{\"status\":\"OK\",\"msg\":\"保存成功！\",\"error\":\"\"}");

            }else  if (statusValue == 2){

                System.out.println("提交成功");
                //跳转至提交成功页面

                request.setAttribute("msg","{title:'提示信息',content:'提交成功',btnAlign:'c',yes:function(index,layero){location.href='fill_in.jsp?update=1'}}");
                request.getRequestDispatcher("msg.jsp").forward(request,response);
            }

        //用户保存过平台
        }else {

            int id = platform.getId();
            int deanid = platform.getDean().getId();
            int organizationid = platform.getOrganization().getId();

            dean.setId(deanid);
            organization.setId(organizationid);

            platform = new Platform(user,organization,dean,gradeValue,platform_district,formValue,"united".equals(platform_unite),"yes".equals(platform_jjjgj),"主要国民经济行业",platform_subject,platform_gjdw,platform_site_name,platform_website,platform_addr,platform_postcode,statusValue);
            platform.setId(id);
            platformDao.updatePlatform(platform);

            if (statusValue == 1){          //如果请求为保存，更新平台数据

                //返回JSON数据，弹出保存成功对话框
                response.setContentType("text/json");
                PrintWriter writer = response.getWriter();
                writer.write("{\"status\":\"OK\",\"msg\":\"保存成功！\",\"error\":\"\"}");
                System.out.println("已存在平台信息");

            }else if(statusValue == 2 && platform.getStatus() != 2){        //如果请求为提交

                //跳转至提交成功页面
                request.setAttribute("msg","{title:'提示信息',content:'提交成功',btnAlign:'c',yes:function(index,layero){location.href='fill_in.jsp'}}");
                request.getRequestDispatcher("msg.jsp").forward(request,response);

            }else if (platform.getStatus() == 2){                       //避免重复提交

                //跳转至提交成功页面
                request.setAttribute("msg","{title:'提示信息',content:'您已提交过，请耐心等待！',btnAlign:'c',yes:function(index,layero){location.href='fill_in.jsp'}}");
                request.getRequestDispatcher("msg.jsp").forward(request,response);

            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("err_msg","非法请求，请以正规方式提交表单");
        request.getRequestDispatcher("error.jsp").forward(request,response);
    }
}
