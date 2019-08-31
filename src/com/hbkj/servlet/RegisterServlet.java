package com.hbkj.servlet;

import com.hbkj.dao.UserDao;
import com.hbkj.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //HTML框架
        String html_head = "<html>\n" +
                "<head>\n" +
                "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
                "    <link rel=\"stylesheet\" href=\"layui/css/layui.css\">\n" +
                "    <script type=\"javascript\" src=\"layui/layui.js\" ></script>\n" +
                "    <title>Title</title>\n" +
                "</head>\n" +
                "<body>\n";
        String html_tail = "</body>\n" +
                "</html>";

        //用户注册信息
        String username = request.getParameter("username").trim();
        String password = request.getParameter("pass1").trim();
        String platformName = request.getParameter("platform_name").trim();
        String platformNo = request.getParameter("platform_no").trim();
        String approvalDate = request.getParameter("approval_date").trim();
        String approvalNum = request.getParameter("approval_number").trim();
        String field = request.getParameter("field").trim();
//        System.out.println("field:" + field);

        //检验用户名是否已存在
        UserDao userDao = new UserDao();
        List<User> users = userDao.loadUser(username);
        try {
            if (users.size() != 0){
                request.setAttribute("err_msg","用户名已存在！<a href='javascript:history.go(-1);'>返回</a>");
                request.getRequestDispatcher("error.jsp").forward(request,response);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        if(users.size() == 0) {
            //添加用户
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Timestamp date = new Timestamp(sdf.parse(approvalDate).getTime());
                User user = new User(username, password, platformName, platformNo, date, approvalNum, field);
                userDao.addUser(user);
                //响应用户
                request.setAttribute("msg", "{title:'提示信息',content:'注册成功',btnAlign:'c',yes:function(){location.href=\"login.jsp\"}}");
                request.getRequestDispatcher("msg.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("exception", e);
                request.setAttribute("err_msg", "出错！请联系管理员（15131027238）错误信息为：");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
