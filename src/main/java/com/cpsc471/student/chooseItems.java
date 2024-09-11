package com.cpsc471.student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class chooseItems
 */
@WebServlet("/chooseItems")
public class chooseItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String quan = request.getParameter("quantity");
		String table = request.getParameter("table");
		String subQuan = "0";
		
		RequestDispatcher d = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
			
			if(table.equals("Equipment")) {
				PreparedStatement stmt = con.prepareStatement("SELECT Quantity FROM EQUIPMENT WHERE E_no=?");
				stmt.setString(1, id);
				ResultSet results = stmt.executeQuery();
				
				
				if(results.next()) 
				{
					int oldQuan = results.getInt("Quantity");
					int newQuan = oldQuan - Integer.valueOf(quan);
					
					subQuan = Integer.toString(newQuan);
				}
				
					PreparedStatement stmt2 = con.prepareStatement("UPDATE EQUIPMENT SET Quantity = ? WHERE E_no = ?");
					stmt2.setString(1, subQuan);
					stmt2.setString(2, id);
					stmt2.executeUpdate();
					
			}
			else if(table.equals("Resource")) {
				PreparedStatement stmt = con.prepareStatement("SELECT amount_avail FROM RESOURCES WHERE R_no=?");
				stmt.setString(1, id);
				ResultSet results = stmt.executeQuery();
				
				if(results.next()) {
					int oldQuan = results.getInt("amount_avail");
					int newQuan = oldQuan - Integer.valueOf(quan);
				
					subQuan = Integer.toString(newQuan);
				}
					PreparedStatement stmt2 = con.prepareStatement("UPDATE RESOURCES SET amount_avail =? WHERE R_no =?");
					stmt2.setString(1, subQuan);
					stmt2.setString(2, id);
					stmt2.executeUpdate();

			}
			d = request.getRequestDispatcher("chooseItems.jsp");
			d.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
