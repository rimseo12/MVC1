package net.bbs.table;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bbs.common.DBBbs;
import net.bbs.common.DBBbsDTO;


@WebServlet("/delete.gallery")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
 
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		
		int Tnum=Integer.parseInt(request.getParameter("t_num"));
		DBBbs gg=new DBBbs();
		gg.dbDelete(Tnum);
		
		response.sendRedirect("bbsList.jsp");
	}
}
