<!-- HTML file for Viewing All Bookings -->
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
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <title>All Bookings</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css-1/general.css">
    </head>
<body>
<header>
    <div>
        <h1> LMS </h1>
        <h4> - Admin </h4>
    </div>

</header>
<main>
    <h2 class="form__title">All Bookings</h2>

    <section>
        <table>
            <thead>
              <tr>
                  <th>Lab ID</th>
                  <th>Booking ID</th>
                  <th>Date</th>
                  <th>Time in</th>
                  <th>Time out</th>
                  <th>User ID</th>
              </tr>
            </thead>
            <tbody>
              <tr>
              <%
              	try{
        			Class.forName("com.mysql.cj.jdbc.Driver");
        			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
        			PreparedStatement stmt = con.prepareStatement("SELECT * FROM BOOKING");
              		ResultSet results = stmt.executeQuery();
              		
              		while(results.next()){
              	%>
              		<tr>
              			<td><%=results.getInt("Lab_no")%></td>
              			<td><%=results.getInt("Booking_no")%></td>
              			<td><%=results.getString("Date")%></td>
              			<td><%=results.getString("Time_in")%></td>
              			<td><%=results.getString("Time_out")%></td>
              			<td><%=results.getString("Booker_id")%></td>
              		</tr>
              	<%	
              		}	
              	
              	}catch(Exception e){
              		e.printStackTrace();
              	}
              
              %>
              </tr>
            </tbody>
          </table>
    </section>

    <!--Back to Homepage Link-->
    <p class="form__text">
        <a class="form__link" href="admin.jsp" id="linkHomepage">Back</a>
    </p>
</main>
<script src="js-1/addUsers.js"> </script>
</body>