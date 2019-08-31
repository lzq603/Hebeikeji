package com.hbkj.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;

import com.hbkj.dao.PlatformDao;
import com.hbkj.model.Platform;

/**
 * Servlet implementation class TableServlet
 */
@WebServlet("/TableServlet")
public class TableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uploadPath = request.getServletContext().getRealPath(".");
		String filePath = uploadPath + File.separator + "baobiao.xls";
		
		// 表头
		String[] col = {"平台编号","技术领域","级别","市县代码","批准年月","依托单位","平台院长","平台网站"};
		HSSFWorkbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("平台报表");
		// 样式
		CellStyle style =  wb.createCellStyle();
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		
		Row row = sheet.createRow(0);
		row.setHeight((short)300);
		for(int i = 0;i < 8;i++) {
			row.createCell(i).setCellValue(col[i]);
		}
		//设置列宽
		for(int i = 0;i <= 9;i++)
		{
			sheet.setColumnWidth(i, 2634);
		}
		int i = 1;
		PlatformDao platformDao = new PlatformDao();
		List<Platform> platforms = platformDao.loadAll();
		for(Platform p:platforms) {
			row = sheet.createRow(i);
			row.setHeight((short)300);
			row.createCell(0).setCellValue(p.getUser().getPlatformNo());
			row.createCell(1).setCellValue(p.getUser().getField());
			if (p.getGrade() == 1) {
				row.createCell(2).setCellValue("国家级");
			}else if (p.getGrade() == 2) {
				row.createCell(2).setCellValue("省级");
			}else if (p.getGrade() == 3) {
				row.createCell(2).setCellValue("国家级，省级");
			}
			row.createCell(3).setCellValue(p.getDistrict());
			row.createCell(4).setCellValue(p.getUser().getApprovalDate());
			row.createCell(5).setCellValue(p.getOrganization().getName());
			row.createCell(6).setCellValue(p.getDean().getName());
			row.createCell(7).setCellValue(p.getWebsite());
			i++;
		}
		
		//输出表格
		FileOutputStream outputStream = new FileOutputStream(filePath);
		wb.write(outputStream);
		wb.close();
		outputStream.close();
		
		response.sendRedirect("baobiao.xls");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
