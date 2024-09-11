package com.cpsc471.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class completeRequest
 */
@WebServlet("/completed")
public class completeRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String eid = request.getParameter("equipID");
		RequestDispatcher d = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
			PreparedStatement stmt = con.prepareStatement("DELETE FROM REPORTS where E_no = ?");
			stmt.setString(1, eid);
			
			stmt.executeUpdate();
			d = request.getRequestDispatcher("service.jsp");
			d.forward(request, response);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
