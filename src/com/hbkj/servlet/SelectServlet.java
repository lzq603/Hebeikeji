package com.hbkj.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.hbkj.dao.PlatformDao;
import com.hbkj.model.Platform;
import com.hbkj.util.DBUtil;

/**
 * Servlet implementation class SelectServlet
 */
@WebServlet("/SelectServlet")
public class SelectServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String catagory = request.getParameter("catagory");
		
		List<Platform> platforms = new ArrayList<Platform>();
		PlatformDao platformDao = new PlatformDao();
		
		if (catagory == null) {
			
			String subSQL = "";
			
			String[] conditions = request.getParameterValues("condition");
			String[] values = request.getParameterValues("value");
			String[] cons = request.getParameterValues("con");
			String[] values2 = request.getParameterValues("value2");
			String[] relates = request.getParameterValues("relate");
			String approval_date = request.getParameter("approval_date");
			String approval_date2 = request.getParameter("approval_date2");
			
			int length = conditions.length;
			for(int i = 0;i < length;i++) {
				//System.out.print(conditions[i] + " " + values[i] + " " + cons[i] + " " + values2[i] + " ");
				subSQL += "(" + conditions[i] + " LIKE " + "'%" + values[i] + "%' " + cons[i] + " " + conditions[i] + " LIKE " + "'%" + values2[i] + "%')";
				
				if (i != length - 1) {
					//System.out.println(relates[i]);
					subSQL += relates[i];
				}
				
			}
			
			if (approval_date != null && !"".equals(approval_date)) {
				subSQL += " AND users.approval_date > '" + approval_date + "'";
			}
			if (approval_date2 != null && !"".equals(approval_date2)) {
				subSQL += " AND users.approval_date < '" + approval_date2 + "'";
			}
			
			String sql = "SELECT\r\n" + 
					"platform_info.id\r\n" + 
					"FROM\r\n" + 
					"platform_info,dean,organization,`users`\r\n" + 
					"WHERE\r\n" + 
					"dean.id	= platform_info.Pdeanid AND organization.id = Porganizationid AND `users`.id = platform_info.Puserid\r\n" + 
					"AND\r\n" + 
					"(" + subSQL + ")";
			
			System.out.println(sql);
			
			Connection conn = DBUtil.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					int id = rs.getInt("id");
					Platform platform = platformDao.loadPlatform(id);
					platforms.add(platform);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else {
			platforms = platformDao.loadByCatagory(catagory);
		}
		
		request.setAttribute("platforms", platforms);
		RequestDispatcher rd = request.getRequestDispatcher("results.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
