<!-- HTML file for Adding Booking Slots for Lab -->
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
    <title>Change Lab Hours</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css-1/addBooking.css">
    </head>
<body>
<header>
    <div>
        <h1> LMS </h1>
        <h4> - Manager </h2>
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
        			PreparedStatement stmt = con.prepareStatement("SELECT Lab_no, Booking_no, Date, Time_in, Time_out FROM BOOKING");

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
              </tbody>
            </table>
        </section>
        
    <form id = "newBookings" method ="post" action = "newBooking">
    <h2 class="form__title">Add Booking Availability</h2>

        <section>
            <h4 class="form__title">Choose A Date</h4>
            <input type="text" id="dateInput" name="dateInput" placeholder="DD/MM/YYYY">
        </section>

        <section>
            <h4 class="form__title">Time In</h4>
            <select id="timeIn" name="timeIn">
              <option value="" disabled selected>Select Hour:</option>
              <option value="07:00">7:00am</option>
              <option value="08:00">8:00am</option>
              <option value="09:00">9:00am</option>
              <option value="10:00">10:00am</option>
              <option value="11:00">11:00am</option>
              <option value="12:00">12:00pm</option>
              <option value="13:00">1:00pm</option>
              <option value="14:00">2:00pm</option>
              <option value="15:00">3:00pm</option>
              <option value="16:00">4:00pm</option>
              <option value="17:00">5:00pm</option>
              <option value="18:00">6:00pm</option>
              <option value="19:00">7:00pm</option>
              <option value="20:00">8:00pm</option>
              <option value="21:00">9:00pm</option>
            </select>
          </section>
    
          <section>
            <h4 class="form__title">Time Out</h4>
            <select id="timeOut" name="timeOut">
              <option value="" disabled selected>Select Hour:</option>
              <option value="07:00">7:00am</option>
              <option value="08:00">8:00am</option>
              <option value="09:00">9:00am</option>
              <option value="10:00">10:00am</option>
              <option value="11:00">11:00am</option>
              <option value="12:00">12:00pm</option>
              <option value="13:00">1:00pm</option>
              <option value="14:00">2:00pm</option>
              <option value="15:00">3:00pm</option>
              <option value="16:00">4:00pm</option>
              <option value="17:00">5:00pm</option>
              <option value="18:00">6:00pm</option>
              <option value="19:00">7:00pm</option>
              <option value="20:00">8:00pm</option>
              <option value="21:00">9:00pm</option>
            </select>
          </section>

        <div class="form__input-group">
            <input type="text" id="labID" name ="labID" class="form__input" placeholder="Lab ID">
            <div class="form__input-error-message"></div>
        </div>

        <div class="form__input-group">
            <input type="text" id="bookingID" name ="bookingID" class="form__input" placeholder="Booking ID">
            <div class="form__input-error-message"></div>
        </div>

    <!--Add Bookings Button-->
    <button class="form__button" type="submit">Add Availability</button>
    </form>
            <section>
            <h2 class="form__title">Remove Booking</h2>
            <form method ="post" id="deleteBooking" action ="removeBooking">
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

    <!--Back to Homepage Link-->
    <p class="form__text">
        <a class="form__link" href="manager.jsp" id="linkHomepage">Back</a>
    </p>
</main>
<script src="../js/modifyLabHours.js"> </script>
</body>