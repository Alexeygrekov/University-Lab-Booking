package com.cpsc471.student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class serviceRequest
 */
@WebServlet("/serviceRequest")
public class serviceRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String eid = request.getParameter("eid");
		String desc = request.getParameter("desc");
		RequestDispatcher d = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
			PreparedStatement stmt = con.prepareStatement("INSERT INTO REPORTS(E_no,Description) values(?,?)");
			stmt.setString(1, eid);
			stmt.setString(2, desc);
			
			int row = stmt.executeUpdate();
			d = request.getRequestDispatcher("general.jsp");
			
			if(row>0) {
				request.setAttribute("status", "success");
			}
			d.forward(request, response);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
