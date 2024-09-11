<!-- HTML file for Creating a Booking -->
<%@
page import = "java.io.IOException,
java.sql.Connection,
java.sql.DriverManager,
java.sql.PreparedStatement,
java.sql.ResultSet,

javax.servlet.RequestDispatcher,
javax.servlet.ServletException,
javax.servlet.annotation.WebServlet,
javax.servlet.http.HttpServlet,
javax.servlet.http.HttpServletRequest,
javax.servlet.http.HttpServletResponse,
javax.servlet.http.HttpSession"
%>
<!-- HTML file for Adding New Users -->
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <title>Create Booking</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css-1/general.css">
    </head>
<body>
<header>
    <div>
        <h1> LMS </h1>
        <h4> - General </h4>
    </div>

</header>
<main>
        <form method = "post" class="form form--hidden" action ="createBooking" id="createAccount">
            <h1 class="form__title">Select A Booking</h1>
            <div class="form__message form__message--error"></div>
        <section>
            <h2 class="form__title">Available Times</h2>
            <table>
              <thead>
                <tr>
                    <th>Lab ID</th>
                    <th>Date</th>
                    <th>Time In</th>
                    <th>Time Out</th>
                </tr>
              </thead>
              <tbody>
              <tr>
              <%
              	try{
        			Class.forName("com.mysql.cj.jdbc.Driver");
        			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
        			PreparedStatement stmt = con.prepareStatement("SELECT DISTINCT Location, Date, Time_in, Time_out FROM LAB, BOOKING WHERE LAB.Lab_no = BOOKING.Lab_no AND Booker_id IS NULL");
              		ResultSet results = stmt.executeQuery();
              		
              		while(results.next()){
              	%>
              		<tr>
              			<td><%=results.getString("Location")%></td>
              			<td><%=results.getString("Date")%></td>
              			<td><%=results.getString("Time_in")%></td>
              			<td><%=results.getString("Time_out")%></td>
              		</tr>
              	<%	
              		}	
              	
              	}catch(Exception e){
              		e.printStackTrace();
              	}
              
              %>
              </tbody>
            </table>
        </section>
            <!--Email and Password Containers-->

    		<div class="form__input-group">
        		<select id="date" name="date">
            		<option value="" disabled selected>Select Date:</option>
        	    <%
              	try{
        			Class.forName("com.mysql.cj.jdbc.Driver");
        			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
        			PreparedStatement stmt = con.prepareStatement("SELECT DISTINCT Date FROM BOOKING WHERE Booker_id IS NULL");
              		ResultSet results = stmt.executeQuery();
              		
              		
              		while(results.next()){
              	%>
            		<option value="<%=results.getString("Date")%>"><%=results.getString("Date")%></option>
              	<%	
              		}	
              	
              	}catch(Exception e){
              		e.printStackTrace();
              	}
              
              %>
        		</select>
        		</div>
    		<div class="form__input-group">
        		<select id="time" name="time">
            		<option value="" disabled selected>Select Time in:</option>
        	    <%
              	try{
        			Class.forName("com.mysql.cj.jdbc.Driver");
        			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
        			PreparedStatement stmt = con.prepareStatement("SELECT DISTINCT Time_in FROM BOOKING WHERE Booker_id IS NULL");
              		ResultSet results = stmt.executeQuery();
              		
              		
              		while(results.next()){
              	%>
            		<option value="<%=results.getString("Time_in")%>"><%=results.getString("Time_in")%></option>
              	<%	
              		}	
              	
              	}catch(Exception e){
              		e.printStackTrace();
              	}
              
              %>
        		</select>
        		</div>
        	<div class="form__input-group">
        	    <select id="Lab" name="Lab">
            		<option value="" disabled selected>Select status from options:</option>
        	    <%
              	try{
        			Class.forName("com.mysql.cj.jdbc.Driver");
        			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
        			PreparedStatement stmt = con.prepareStatement("SELECT DISTINCT LAB.Lab_no, Location FROM LAB, BOOKING WHERE LAB.Lab_no = BOOKING.Lab_no AND Booker_id IS NULL");
        			ResultSet results = stmt.executeQuery();
              		
              		
              		while(results.next()){
              	%>
            		<option value="<%=results.getInt("Lab_no")%>"><%=results.getString("Location")%></option>
              	<%	
              		}	
              	
              	}catch(Exception e){
              		e.printStackTrace();
              	}
              
              %>
        	</select>
    </div>

    <!--Create Account Button-->
    <button class="form__button" type="submit">Confirm Booking</button>
    </form>

    <!--Back to Homepage Link-->
    <p class="form__text">
        <a class="form__link" href="general.jsp" id="linkHomepage">Back</a>
    </p>
</main>
<script src="js-1/addUsers.js"> </script>
</body>