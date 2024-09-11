<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<!-- HTML file for Choosing Resources and Equipment for Booking-->
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
        <h4> - Manager </h4>
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
        <h2 class="form__title">Resource Inventory</h2>
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
             </tr>
            </tbody>
        </table>
        </div>
        </div>
    </section>
    <section>
        <button class="form__button-back" type="submit" id="selectEquip">View Equipment Inventory</button>
    </section>
    </form>

    <form class="form form--hidden" id="equip">
    <section>
        <h2 class="form__title">Equipment Inventory</h1>
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
        <button class="form__button-back" type="submit" id="selectResource">View Resource Inventory</button>
    </section>
    </form>
    
    <h2 class="form__title">Update Inventory</h1>
    <div class="form__message"></div>
    <form method ="post" id="modifyItems" action= "modifyInventory">
    <div class="form__input-group">
        <input type="text" name = "id" id="id" class="form__input" placeholder="Resource/Equipment ID">
        <div class="form__input-error-message"></div>
    </div>
        <div class="form__input-group">
        <input type="text" name = "Name" id="name" class="form__input" placeholder="Item Name(if adding new item)">
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
    <div class="form__input-group">
        <select id="operation" name="operation">
            <option value="" disabled selected>Select Operation:</option>
            <option value="Add">Add</option>
            <option value="Subtract">Subtract</option>
        </select>
    </div>
    <section>
        <button class="form__button" type="submit" id="addCart">Update</button>
    </section>
    </form>

    <!--Back to Homepage Link-->
    <p class="form__text">
        <a class="form__link" href="manager.jsp" id="linkBooking">Back</a>
    </p>
    
</main>
<script src="js-1/modifyInventory.js"> </script>
</body>