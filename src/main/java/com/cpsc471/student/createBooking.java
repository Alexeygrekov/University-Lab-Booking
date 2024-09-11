package com.cpsc471.student;

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class createBooking
 */
@WebServlet("/createBooking")
public class createBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String lab = request.getParameter("Lab");
		HttpSession session = request.getSession();
		RequestDispatcher d = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
			
			PreparedStatement stmt = con.prepareStatement("UPDATE booking SET Booker_id = ? WHERE Lab_no = ? AND Time_in = ? AND Date = ? AND Booker_id IS NULL LIMIT 1");
			String curr = (String)session.getAttribute("name");
			stmt.setString(1, curr);
			stmt.setString(2, lab);
			stmt.setString(3, time);
			stmt.setString(4, date);
			stmt.executeUpdate();
			d = request.getRequestDispatcher("chooseItems.jsp");
			d.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
