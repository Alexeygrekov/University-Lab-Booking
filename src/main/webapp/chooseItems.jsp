<!-- HTML file for Choosing Resources and Equipment for Booking-->
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
    <title>Select Items</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css-1/createBooking.css">
    </head>
<body>
<header>
    <div>
        <h1> LMS </h1>
        <h4> - General </h4>
    </div>

</header>
<main>
    <section>
        <div class="search__input-group">
            <input class="search__input" type="text" id="search" placeholder="Search...">
            <button class="search__button" id="searchButton">Search</button>
          </div>
    </section>

    <form class="form" id="resource">
    <section>
        <h2 class="form__title">Resources Available</h2>
        <div style="height: 200px; overflow: auto">
        <div style="overflow-x:auto;">
        <table class= "table__items" id="resourcesAvail">
            <thead>
              <tr>
                  <th>Resource ID</th>
                  <th>Resource Name</th>
                  <th>Quantity Available(g or mL)</th>
              </tr>
            </thead>
            <tbody>
            <tr>
              <%
              	try{
        			Class.forName("com.mysql.cj.jdbc.Driver");
        			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
        			PreparedStatement stmt = con.prepareStatement("SELECT * FROM RESOURCES");
              		ResultSet results = stmt.executeQuery();
              		
              		
              		while(results.next()){
              	%>
              		<tr>
              			<td><%=results.getInt("R_no")%></td>
              			<td><%=results.getString("R_name")%></td>
              			<td><%=results.getInt("Amount_avail")%></td>
              		</tr>
              	<%	
              		}	
              	
              	}catch(Exception e){
              		e.printStackTrace();
              	}
              
              %>

            </tbody>
        </table>
        </div>
        </div>
    </section>
    <section>
        <button class="form__button-back" type="submit" id="selectEquip">Choose from Equipment</button>
    </section>
    </form>

    <form class="form form--hidden" id="equip">
    <section>
        <h2 class="form__title">Equipment Available</h2>
        <div style="height: 200px; overflow: auto">
        <div style="overflow-x:auto;">
        <table class="table__items" id="equipAvail">
            <thead>
                <tr>
                    <th>Equipment ID</th>
                    <th>Equipment Name</th>
                    <th>Quantity Available</th>
                </tr>
            </thead>
            <tbody>
            <tr>
              <%
              	try{
        			Class.forName("com.mysql.cj.jdbc.Driver");
        			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LabMS", "cpsc471", "cpsc471"); 
        			PreparedStatement stmt = con.prepareStatement("SELECT * FROM EQUIPMENT");
              		ResultSet results = stmt.executeQuery();
              		
              		
              		while(results.next()){
              	%>
              		<tr>
              			<td><%=results.getInt("E_no")%></td>
              			<td><%=results.getString("E_name")%></td>
              			<td><%=results.getInt("Quantity")%></td>
         
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
        </div>
        </div>
    </section>
    <section>
        <button class="form__button-back" type="submit" id="selectResource">Choose from Resources</button>
    </section>
    </form>
    
    <h2 class="form__title">Add Items</h1>
    <div class="form__message"></div>
    <form method ="post" id="addItems" action = "chooseItems">
        <div class="form__input-group">
            <input type="text" name ="id" id="id" class="form__input" placeholder="Resource/Equipment ID">
            <div class="form__input-error-message"></div>
        </div>
        <div class="form__input-group">
            <input type="text" name = "quantity" id="quant" class="form__input" placeholder="Quantity">
            <div class="form__input-error-message"></div>
        </div>
        <div class="form__input-group">
        <select id="table" name="table">
            <option value="" disabled selected>Select Item:</option>
            <option value="Resource">Resource</option>
            <option value="Equipment">Equipment</option>
        </select>
    </div>
        <section>
            <button class="form__button" type="submit" id="addCart">Reserve Item</button>
        </section>
    </form>

    <section>
        <button class="form__button" type="submit" id="finishBook" formaction ="general.jsp">Complete Booking</button>
    </section>

    <!--Back to Booking Link-->
    <p class="form__text">
        <a class="form__link" href="createBooking.jsp" id="linkBooking">Back</a>
    </p>
    
</main>
<script src="js-1/chooseItems.js"> </script>
</body>