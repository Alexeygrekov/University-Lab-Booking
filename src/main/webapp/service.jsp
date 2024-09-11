<!-- HTML file for Maintainence home page -->
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
            <h4> - Service </h4>
        </div>

    </header>
    <main>
        <section>
            <h2 class="form__title">Current Service Requests</h2>
            <table>
              <thead>
                <tr>
                    <th>Service ID</th>
                    <th>Equipment ID</th>
                    <th>Reason for Service</th>
                </tr>
              <%
              	try{
        			Class.forName("com.mysql.cj.jdbc.Driver");
        			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
        			PreparedStatement stmt = con.prepareStatement("SELECT * FROM REPORTS");
              		ResultSet results = stmt.executeQuery();
              		
              		while(results.next()){
              	%>
              		<tr>
              			<td><%=results.getInt("S_no")%></td>
              			<td><%=results.getInt("E_no")%></td>
              			<td><%=results.getString("Description")%></td>
              		</tr>
              	<%	
              		}	
              	
              	}catch(Exception e){
              		e.printStackTrace();
              	}
              
              %>
            </table>
        </section> 
        
        <section>
            <h2 class="form__title">Maintenance & Repair Completion Form</h2>
            <form method = "post" action = "completed">
                <div class="form__input-group">
                    <input type="text" name="equipID" id="equipID" class="form__input" autofocus placeholder="Equipment ID">
                    <div class="form__input-error-message"></div>
                </div>
                <button class="form__button" type="submit">Submit</button>
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