<!-- HTML file for General User's home page -->

<%

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if(session.getAttribute("name")==null){
		response.sendRedirect("index.jsp");
	}
%>
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
<script>
    if (window.history.replaceState) {
        window.history.replaceState( null, null, window.location.href );
    }
</script>
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
    <input type ="hidden" id="status" value = "<%= request.getAttribute("status") %>">
        <div>
            <h1> LMS </h1>
            <h4> - General </h4>
        </div>

    </header>
    <main>
        <section>
            <h2 class="form__title">Upcoming Bookings</h2>
            <table>
              <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Lab Room</th>
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
        			PreparedStatement stmt = con.prepareStatement("SELECT Lab_no, Booking_no, Date, Time_in, Time_out FROM BOOKING where Booker_id =?");
        			String curr = (String)session.getAttribute("name");
        			stmt.setString(1, curr); 
              		ResultSet results = stmt.executeQuery();
              		
              		while(results.next()){
              	%>
              		<tr>
              		    <td><%=results.getInt("Booking_no")%></td>
              			<td><%=results.getInt("Lab_no")%></td>
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
              </tr>
              </tbody>
            </table>
        </section> 

        <section>
            <h2 class="form__title">Reserve Lab Seat</h2>
            <form>
                <button class="form__button" type="submit" formmethod ="post" formaction = "completeBooking">Create Booking</button>
            </form>
        </section>
        
        <section>
            <h2 class="form__title">Delete Booking</h2>
            <form method ="post" id="deleteBooking" action ="deleteBooking">
                    <div class="form__input-group">
                    <input type="text" name ="bookingID" id="bookingID" class="form__input" placeholder="Booking ID">
                    <div class="form__input-error-message"></div>
                    </div>

                    <div class="form__input-group">
                    <input type="text" name ="labID" id="labID" class="form__input" placeholder="Lab ID">
                    <div class="form__input-error-message"></div>
                    </div>
                <button class="form__button-delete" type="submit">Delete</button>
            </form>
        </section>
        
        <section>
            <h2 class="form__title">Request Equipment Service</h2>
            <form method ="post" action="serviceRequest">
                <div class="form__input-group">
                    <input type="text" name ="eid" id="equipID" class="form__input" autofocus placeholder="Equipment ID">
                    <div class="form__input-error-message"></div>
        
                    <input type="text" name="desc" id="serviceMessage" class="form__input" autofocus placeholder="Reason for Service Request">
                    <div class="form__input-error-message"></div>
                </div>
                <button class="form__button" type="submit">Send</button>
            </form>
        </section>
        <section>
            <form>
                <button class="form__button-logout" type="submit" formaction="Logout">Log Out</button>
            </form>
        </section>
       </main>
    <script src="js-1/general.js"> </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type ="text/javascript">
	var status1 = document.getElementById("status").value;
	if(status1 == "success"){
		swal("Thank You!","Service Report Created", "success");
	}
	</script>
</body>
