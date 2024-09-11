package com.cspc471.registration;

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class studentLogin
 */
@WebServlet("/studentLogin")
public class studentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("loginEmail");
		String password = request.getParameter("loginPassword");
		String usertype ="Student";
		HttpSession session = request.getSession();
		RequestDispatcher d = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
			PreparedStatement stmt = con.prepareStatement("select * from users where Email = ? and Password =? and Usertype=?");
			stmt.setString(1, email);
			stmt.setString(2, password);
			stmt.setString(3, usertype);
			ResultSet results = stmt.executeQuery();
			
			
			if(results.next()==true) {
				session.setAttribute("name", results.getString("User_id"));
				d = request.getRequestDispatcher("general.jsp");
			}
			
			else {
				usertype = "Admin";
				stmt.setString(3, usertype);
				results = stmt.executeQuery();
				
				if(results.next()==true) {
					session.setAttribute("name", results.getString("User_id"));
					d = request.getRequestDispatcher("admin.jsp");
				}
				else {
					usertype = "Maintainence";
					stmt.setString(3, usertype);
					results = stmt.executeQuery();
					if(results.next()==true) {
						session.setAttribute("name", results.getString("User_id"));
						d = request.getRequestDispatcher("service.jsp");
					}
					else {
						usertype = "Lab Manager";
						stmt.setString(3, usertype);
						results = stmt.executeQuery();
						
						if(results.next()==true) {
							session.setAttribute("name", results.getString("User_id"));
							d = request.getRequestDispatcher("manager.jsp");
						}
						else {
							request.setAttribute("status", "failed");
							d = request.getRequestDispatcher("index.jsp");
						}
					}
				}
			}
			d.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
