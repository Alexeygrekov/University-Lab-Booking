<!-- HTML file for Admin's home page -->
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
        <h4> - Admin </h4>
    </div>

</header>
<main>
    <section>
        <form>
            <button class="form__button" type="submit" formaction ="viewAllLabs.jsp">View All Labs</button>
        </form>
    </section>
    <section>
        <form>
            <button class="form__button" formaction ="viewAllUsers.jsp" type="submit">View All Users</button>
        </form>
    </section>
    <section>
        <form>
            <button class="form__button" type="submit" formaction ="addUsers.jsp">Add New Users</button>
        </form>
    </section>
    <section>
        <form>
            <button class="form__button" type="submit" formaction="viewAllBookings.jsp">View All Bookings</button>
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
