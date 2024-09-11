package com.cspc471.registration;

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
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String password = request.getParameter("re_pass");
		String id = request.getParameter("id");
		String usertype = "Student";
		
		
//		PrintWriter out = response.getWriter();
//		out.print(fname);
//		out.print(lname);
//		out.print(email);
//		out.print(password);
		RequestDispatcher d = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
			PreparedStatement stmt = con.prepareStatement("INSERT INTO USERS(User_id,Fname,Lname,Email,Password,Usertype) values(?,?,?,?,?,?)");
			stmt.setString(1, id);
			stmt.setString(2, fname);
			stmt.setString(3, lname);
			stmt.setString(4, email);
			stmt.setString(5, password);
			stmt.setString(6, usertype);
			
			PreparedStatement stmt2= con.prepareStatement("INSERT INTO STUDENT(StudentID,Fname,Lname,Email,Password) values(?,?,?,?,?)");
			stmt2.setString(1, id);
			stmt2.setString(2, fname);
			stmt2.setString(3, lname);
			stmt2.setString(4, email);
			stmt2.setString(5, password);
			
			int row = stmt.executeUpdate();
			int row2 = stmt2.executeUpdate();
			d = request.getRequestDispatcher("index.jsp");
			
			if(row>0 && row2>0) {
				request.setAttribute("status", "success");
				
			}
			else {
				request.setAttribute("status", "failed");
			}
			d.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
