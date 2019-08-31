package com.hbkj.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hbkj.dao.PlatformDao;
import com.hbkj.model.Platform;

/**
 * Servlet implementation class StatisticServlet
 */
@WebServlet("/Statistic")
public class StatisticServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PlatformDao platformDao = new PlatformDao();
		List<Platform> platforms = platformDao.loadAll();
		String type = request.getParameter("type");
		response.setContentType("application/json");
		PrintWriter writer = response.getWriter();
		
		if("dist".equals(type)) {
			//石家庄，唐山，秦皇岛，邯郸，邢台，保定，张家口，承德，沧州，廊坊，衡水
			int[] country = {0,0,0,0,0,0,0,0,0,0,0};
			int[] province = {0,0,0,0,0,0,0,0,0,0,0};
			for(Platform platform:platforms) {
				if (platform.getGrade() == Platform.NATIONAL || platform.getGrade() == 3) {	//国家级
					int city = Integer.parseInt(platform.getDistrict()) / 100 % 100;
					System.out.println(city);
					country[city - 1] += 1;
				}
				if (platform.getGrade() == Platform.PROVINCIAL || platform.getGrade() == 3) {
					int city = Integer.parseInt(platform.getDistrict()) / 100 % 100;
					System.out.println(city);
					province[city - 1] += 1;
				}
			}
			String countryArrStr = arrayToString(country);
			String provinceArrStr = arrayToString(province);
			String json = "{\"country\":" + countryArrStr + ",\"province\":" + provinceArrStr + "}";
			writer.print(json);
		}else if ("grade".equals(type)) {
			int country = 0;
			int province = 0;
			int cp = 0;
			for(Platform platform:platforms) {
				if (platform.getGrade() == 1) {
					country += 1;
				}else if (platform.getGrade() == 2) {
					province += 1;
				}else if (platform.getGrade() ==3) {
					cp += 1;
				}
			}
			writer.print("[[\"省级\",		" + province + "],\r\n" + 
					"							[\"国家级\",		" + country + "],\r\n" + 
					"							[\"国家级，省级\",	" + cp + "]]");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private String arrayToString(int[] arr) {
		StringBuilder sb = new StringBuilder(arr.length*3); // StringBuilder(arr.length*3)性能比StringBuilder()高
		sb.append("[");
		int offset = arr.length - 1;
		for( int i = 0; i < offset; i++ )
		    sb.append(arr[i]).append(", ");
		sb.append(arr[offset]).append("]");
		return sb.toString();
	}
}
