<!-- HTML file for Login, Create Account, and Forgot Password functionality -->

<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <title>Login / Sign Up</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css-1/index.css">
</head>
<body>

<input type ="hidden" id="status" value = "<%= request.getAttribute("status") %>">

    <div class="container">

        <!--Login Form-->
        <form method="post" class="form" action ="studentLogin" id="login">
            <h1 class="form__title">Welcome Back</h1>
            <div class="form__message form__message--error"></div>

            <!--Email and Password Containers-->
            <div class="form__input-group">
                <input type="text" name="loginEmail" id="loginEmail" class="form__input" autofocus placeholder="Email">
                <div class="form__input-error-message"></div>
            </div>
            <div class="form__input-group">
                <input type="password" name ="loginPassword" id="loginPassword" class="form__input" autofocus placeholder="Password">
                <div class="form__input-error-message"></div>
            </div>

            <!--Login Button-->
            <button class="form__button" type="submit">Sign In</button>

            <!--Forgot Password/Create Account Links-->

            <p class="form__text">
                <a class="form__link" href="./" id="linkCreateAccount">Don't have an account? Create account</a>
            </p>
        </form>
        
        <!--Create Account Form-->
        <form method = "post" class="form form--hidden" action ="register" id="createAccount">
            <h1 class="form__title">Create Account</h1>
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
                <input type="text" name= "id" id="studentID" class="form__input" autofocus placeholder="Student ID#">
                <div class="form__input-error-message"></div>
            </div>
            <div class="form__input-group">
                <input type="password" name ="re_pass" id="signupPassword1" class="form__input" autofocus placeholder="Password">
                <div class="form__input-error-message"></div>
            </div>
            <div class="form__input-group">
                <input type="password" id="signupPassword2" class="form__input" autofocus placeholder="Re-enter Password">
                <div class="form__input-error-message"></div>
            </div>

            <!--Create Account Button-->
            <button class="form__button" type="submit">Create Account</button>

            <!--Login Link-->
            <p class="form__text">
                <a class="form__link" href="./" id="linkLogin">Already have an account? Log in</a>
            </p>
        </form> 


    </div>
    <script src="js-1/index.js"> </script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type ="text/javascript">
	var status = document.getElementById("status").value;
	if(status == "success"){
		swal("Welcome","Account Created Successfully", "success");
	}
	else if(status == "failed"){
		swal("Login Failed","Incorrect Information", "error");
	}
	</script>
	

</body>