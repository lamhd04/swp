<html>
    <head>
        <meta charset="utf-8">
        <title>RegistrationForm_v1 by Colorlib</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- MATERIAL DESIGN ICONIC FONT -->
        <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

        <!-- STYLE CSS -->
        <link rel="stylesheet" href="css/style1.css">
    </head>

    <body>

        <div class="wrapper" style="background-image: url('images/banner/banner_2.jpg');">
            <div class="inner">
                <div class="image-holder">
                    <img src="images/blog/blog_3.jpg" alt="">
                </div>
                <form action="login" method="post">
                    <h3>Login Form</h3>

                    <font color="red">${msg}</font>
                    <div class="form-wrapper">

                        <input type="text" placeholder="Email Address" class="form-control" name ="email">
                        <i class="zmdi zmdi-email"></i>
                    </div>


                    <div class="form-wrapper">

                        <input type="password" placeholder="Password" class="form-control" name = "password">
                        <i class="zmdi zmdi-lock"></i>
                    </div>
                    <div>
                        <a style="text-decoration: none;" href="ForgotPassword.jsp"> Forgotten Password?</a>
                    </div>
                    <button>Login
                        <i class="zmdi zmdi-arrow-right"></i>
                    </button>

                </form>
            </div>
        </div>

    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>