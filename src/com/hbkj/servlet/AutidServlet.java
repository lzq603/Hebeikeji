package com.hbkj.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hbkj.dao.PlatformDao;
import com.hbkj.model.Platform;

/**
 * Servlet implementation class AutidServlet
 */
@WebServlet("/AutidServlet")
public class AutidServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String check = request.getParameter("check");
		System.out.println(id);
		System.out.println(check);
		PlatformDao platformDao  = new PlatformDao();
		Platform platform = platformDao.loadPlatform(Integer.parseInt(id));
		System.out.println(platform.getId());
		platform.setStatus(Integer.parseInt(check));
		platformDao.updatePlatform(platform);
		

		
		response.setContentType("application/json");
		PrintWriter writer = response.getWriter();
		writer.write("{\"status\":\"OK\"}");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
