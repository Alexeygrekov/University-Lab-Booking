package com.cpsc471.admin;

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
 * Servlet implementation class adminAddUsers
 */
@WebServlet("/adminAddUsers")
public class adminAddUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("id");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String pwd = request.getParameter("re_pass");
		String usertype = request.getParameter("role");
		String nothing = null;
		RequestDispatcher d = null;
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
			PreparedStatement stmt = con.prepareStatement("INSERT INTO USERS(User_id,Fname,Lname,Email,Password,Usertype) values(?,?,?,?,?,?)");
			stmt.setString(1, uid);
			stmt.setString(2, fname);
			stmt.setString(3, lname);
			stmt.setString(4, email);
			stmt.setString(5, pwd);
			stmt.setString(6, usertype);
			int row = stmt.executeUpdate();
			int row2=-1;
			System.out.println(usertype);
			
			if(usertype.equals("Student")) {
				PreparedStatement stmt2= con.prepareStatement("INSERT INTO STUDENT(StudentID,Fname,Lname,Email,Password) values(?,?,?,?,?)");
				System.out.println(usertype);
				stmt2.setString(1, uid);
				stmt2.setString(2, fname);
				stmt2.setString(3, lname);
				stmt2.setString(4, email);
				stmt2.setString(5, pwd);
				row2 = stmt2.executeUpdate();
			}
			else{
				PreparedStatement stmt2 = con.prepareStatement("INSERT INTO EMPLOYEE(EmployeeID, Fname, Lname, Email, Password) values(?,?,?,?,?)");
				stmt2.setString(1,uid);
				stmt2.setString(2, fname);
				stmt2.setString(3,lname);
				stmt2.setString(4,email);
				stmt2.setString(5,pwd);
				row2 = stmt2.executeUpdate();
				
				if(usertype.equals("Maintainence")) {
					PreparedStatement stmt3 = con.prepareStatement("INSERT INTO MAINTAINENCE(Employee_id) values(?)");
					stmt3.setString(1, uid);
					
					int row3 = stmt3.executeUpdate();
				}
				else if(usertype.equals("Lab Manager")) {
					PreparedStatement stmt4 = con.prepareStatement("INSERT INTO LAB_Manager(Employee_id, lab_certification) values(?,?)");
					stmt4.setString(1, uid);
					stmt4.setString(2, nothing);
					
					int row4 = stmt4.executeUpdate();
				}
				else if(usertype.equals("Admin")) {
					PreparedStatement stmt5 = con.prepareStatement("INSERT INTO ADMIN(employeeID, status) values(?,?)");
					stmt5.setString(1, uid);
					stmt5.setString(2, nothing);
					
					int row5 = stmt5.executeUpdate();
				}
			}
			
			d = request.getRequestDispatcher("admin.jsp");
			if(row >0 && row2>0) {
				d.forward(request, response);
			}
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
