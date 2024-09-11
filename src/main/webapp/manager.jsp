<!-- HTML file for General User's home page -->
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
    <title>Home</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css-1/general.css">
    </head>
<body>
    <header>
        <div>
            <h1> LMS </h1>
            <h4> - Manager </h4>
            </div>

    </header>
    <main>
        <section>
            <h2 class="form__title">Upcoming Bookings</h2>
            <table>
              <thead>
                <tr>
                    <th>Lab ID</th>
                    <th>Booking ID</th>
                    <th>Date</th>
                    <th>Time In</th>
                    <th>Time Out</th>
                    <th>Booker ID</th>
                </tr>
              </thead>
              <tbody>
                <tr>
              <%
              	try{
        			Class.forName("com.mysql.cj.jdbc.Driver");
        			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
        			PreparedStatement stmt = con.prepareStatement("SELECT * FROM booking WHERE Booker_id IS NOT NULL");
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
              </tbody>
            </table>
        </section> 
        <section>
            <form>
                <button class="form__button" type="submit" formaction ="modifyInventory.jsp">Manage Lab Inventory</button>
            </form>
        </section>
        <section>
            <form>
                <button class="form__button" type="submit" formaction ="addBooking.jsp">Change Lab Availability</button>
            </form>
        </section>

        <section>
            <form>
                <button class="form__button-logout" type="submit" formaction="Logout">Log Out</button>
            </form>
        </section>
    </main>
    <script src="js-1/main.js"> </script>
</body>