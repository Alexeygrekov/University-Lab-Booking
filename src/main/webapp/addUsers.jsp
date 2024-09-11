<!-- HTML file for Adding New Users -->
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <title>Add User</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css-1/general.css">
    </head>
<body>
<header>
    <div>
        <h1> LMS </h1>
        <h2> - Admin </h2>
    </div>
</header>
<main>
        <form method = "post" class="form form--hidden" action ="adminAddUsers" id="createAccount">
            <h1 class="form__title">Add a User</h1>
            <div class="form__message form__message--error"></div>

            <!--Email and Password Containers-->
            <div class="form__input-group">
                <input type="text" name ="fname" id="firstName" class="form__input" autofocus placeholder="First Name">
                <div class="form__input-error-message"></div>
            </div>
            <div class="form__input-group">
                <input type="text" name ="lname" id="lastName" class="form__input" autofocus placeholder="Last Name">
                <div class="form__input-error-message"></div>
            </div>
            <div class="form__input-group">
                <input type="text" name ="email" id="signupEmail" class="form__input" autofocus placeholder="Email">
                <div class="form__input-error-message"></div>
            </div>
            <div class="form__input-group">
                <input type="text" name= "id" id="studentID" class="form__input" autofocus placeholder="User ID#">
                <div class="form__input-error-message"></div>
            </div>
            <div class="form__input-group">
                <input type="text" name ="re_pass" id="signupPassword1" class="form__input" autofocus placeholder="Password">
                <div class="form__input-error-message"></div>
            </div>
    <div class="form__input-group">
        <select id="status" name="role">
            <option value="" disabled selected>Select status from options:</option>
            <option value="Student">Student</option>
            <option value="Lab Manager">Lab Manager</option>
            <option value="Maintainence">Maintainence</option>
            <option value="Admin">Admin</option>
        </select>
    </div>

    <!--Create Account Button-->
    <button class="form__button" type="submit">Create Account</button>
    </form>

    <!--Back to Homepage Link-->
    <p class="form__text">
        <a class="form__link" href="../homepages/admin.html" id="linkHomepage">Back</a>
    </p>
</main>
<script src="js-1/addUsers.js"> </script>
</body>