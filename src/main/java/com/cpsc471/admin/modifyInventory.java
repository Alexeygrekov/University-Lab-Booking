package com.cpsc471.admin;

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
 * Servlet implementation class modifyInventory
 */
@WebServlet("/modifyInventory")
public class modifyInventory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String quan = request.getParameter("quantity");
		String itemName = request.getParameter("Name");
		String action = request.getParameter("operation");
		String table = request.getParameter("table");
		String addQuan = "0";
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
					int newQuan = oldQuan + Integer.valueOf(quan);
					int newQuan2 = oldQuan - Integer.valueOf(quan);
					
					addQuan = Integer.toString(newQuan);
					subQuan = Integer.toString(newQuan2);
				}

				
				
				if(action.equals("Add")) {
					PreparedStatement stmt2 = con.prepareStatement("INSERT INTO Equipment(E_no, E_name, Quantity) values(?,?,?) ON DUPLICATE KEY UPDATE Quantity =?");
					stmt2.setString(1, id);
					stmt2.setString(2, itemName);
					stmt2.setString(3, quan);
					stmt2.setString(4, addQuan);
					stmt2.executeUpdate();
				}
				else if(action.equals("Subtract")) {
					PreparedStatement stmt2 = con.prepareStatement("INSERT INTO Equipment(E_no, E_name, Quantity) values(?,?,?) ON DUPLICATE KEY UPDATE Quantity =?");
					stmt2.setString(1, id);
					stmt2.setString(2, itemName);
					stmt2.setString(3, quan);
					stmt2.setString(4, subQuan);
					stmt2.executeUpdate();
				}
			}
			else if(table.equals("Resource")) {
				PreparedStatement stmt = con.prepareStatement("SELECT amount_avail FROM RESOURCES WHERE R_no=?");
				stmt.setString(1, id);
				ResultSet results = stmt.executeQuery();
				
				if(results.next()) {
					int oldQuan = results.getInt("amount_avail");
					int newQuan = oldQuan + Integer.valueOf(quan);
					int newQuan2 = oldQuan - Integer.valueOf(quan);
				
					addQuan = Integer.toString(newQuan);
					subQuan = Integer.toString(newQuan2);
				}
				if(action.equals("Add")) {
					PreparedStatement stmt2 = con.prepareStatement("INSERT INTO Resources(R_no, R_name, amount_avail) values(?,?,?) ON DUPLICATE KEY UPDATE amount_avail =?");
					stmt2.setString(1, id);
					stmt2.setString(2, itemName);
					stmt2.setString(3, quan);
					stmt2.setString(4, addQuan);
					stmt2.executeUpdate();
				}
				else if(action.equals("Subtract")) {
					PreparedStatement stmt2 = con.prepareStatement("INSERT INTO Resources(R_no, R_name, amount_avail) values(?,?,?) ON DUPLICATE KEY UPDATE amount_avail =?");
					stmt2.setString(1, id);
					stmt2.setString(2, itemName);
					stmt2.setString(3, quan);
					stmt2.setString(4, subQuan);
					stmt2.executeUpdate();
				}
			}
			d = request.getRequestDispatcher("modifyInventory.jsp");
			d.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
