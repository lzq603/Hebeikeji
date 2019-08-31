package com.hbkj.servlet;

import com.hbkj.dao.PlatformDao;
import com.hbkj.dao.UserDao;
import com.hbkj.model.Platform;
import com.hbkj.model.User;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends javax.servlet.http.HttpServlet {

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

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDao userDao = new UserDao();
        PlatformDao platformDao = new PlatformDao();
        User user = userDao.loadUser(username,password);
        if (user == null)
        {
            PrintWriter writer = response.getWriter();
            writer.println(html_head + "<script>alert('用户名或密码错误');history.go(-1);</script>" + html_tail);
        }else {
            Platform platform = platformDao.loadPlatformByUserid(user.getId());
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            request.setAttribute("platform",platform);
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String absolute = getServletConfig().getServletContext().getRealPath("/");
        File china_json = new File(absolute + "js\\china.js");

        request.setAttribute("err_msg","非法请求，请以正规方式登陆系统");
        request.getRequestDispatcher("error.jsp").forward(request,response);
    }
}
