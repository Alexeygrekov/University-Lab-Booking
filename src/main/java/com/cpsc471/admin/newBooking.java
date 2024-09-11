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
 * Servlet implementation class newBooking
 */
@WebServlet("/newBooking")
public class newBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String date = request.getParameter("dateInput");
		String timeIn = request.getParameter("timeIn");
		String timeOut = request.getParameter("timeOut");
		String lab = request.getParameter("labID");
		String booking = request.getParameter("bookingID");
		RequestDispatcher d = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
			PreparedStatement stmt = con.prepareStatement("INSERT INTO BOOKING(Lab_no, Booking_no, Date, Time_in, Time_out, Booker_id) VALUES(?,?,?,?,?,NULL)");
			stmt.setString(1, lab);
			stmt.setString(2, booking);
			stmt.setString(3, date);
			stmt.setString(4, timeIn);
			stmt.setString(5, timeOut);
			stmt.executeUpdate();
			
			d = request.getRequestDispatcher("addBooking.jsp");
			d.forward(request, response);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
