<%-- 
    Document   : Signup
    Created on : Sep 29, 2021, 8:43:46 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                    <img src="images/blog/blog_2.jpg" alt="">
                </div>
                <form id="form" action="SignupServlet" method="POST" onsubmit="return onSubmitForm()">
                    <h3>Registration Form</h3>
                    <div class="form-wrapper">
                        <input type="text" placeholder="FullName" class="form-control" name ="name" required value="${name}">

                    </div>
                    <font color = "red">${Erroremail}</font>
                    <div class="form-wrapper">
                        <input type="email" placeholder="Email Address" class="form-control" name ="email" value="${email}" required>
                        <i class="zmdi zmdi-email"></i>
                    </div>

                    <div class="form-wrapper">
                        <select name="sex" id="" class="form-control">
                            <option value="" disabled selected>Gender</option>
                            <option value="Mr" >Male</option>
                            <option value="Mrs">Female</option>
                            <option value="Other">Other</option>
                        </select>
                        <i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
                    </div>
                    <div class="form-wrapper">
                        <font color = "red" id="message">${Errorpassword}</font>
                        <input type="password" id="password" placeholder="Password" class="form-control" name = "password" 
                               onfocusout="notifyMatchPassword()" required>
                        <i class="zmdi zmdi-lock"></i>
                    </div>
                    <div class="form-wrapper">

                        <input type="password" id="repassword" placeholder="Confirm Password" class="form-control" name = "repassword"  
                               onfocusout="notifyMatchPassword()" required>
                        <i class="zmdi zmdi-lock"></i>
                    </div>

                    <div class="form-wrapper">
                        <font color = "red">${Errorphone}</font>
                        <input type="text" placeholder="Phone Number" class="form-control" name ="phone" required value="${phone}">
                        <i class="zmdi zmdi-email"></i>
                    </div>
                    <div class="form-wrapper">
                        <input type="text" placeholder=" Address" class="form-control" name ="add" required value = "${add}">
                        <i class="zmdi zmdi-email"></i>
                    </div>
                    <button>Register
                        <i class="zmdi zmdi-arrow-right"></i>
                    </button>
                </form>
            </div>
        </div>

    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
    <script>
        function notifyMatchPassword() {
            var isMatching = isMatchPassword();
            if (!isMatching) {
                document.getElementById('message').style.color = 'red';
                document.getElementById('message').innerHTML = 'password not match';
            } else {
                document.getElementById('message').innerHTML = '';
            }
        }
        function isMatchPassword() {
            var passVal = document.getElementById('password').value;
            var repassVal = document.getElementById('repassword').value;
            if (passVal.length !== 0) {
                if (repassVal.length !== 0) {
                    if (passVal !== repassVal) {
                        return false;
                    }
                }
            }
            return true;
        }
        function isEmpty(tagId) {
            var value = document.getElementById(tagId).value;
            if (value.length === 0) {
                return true;
            }
            return false;
        }
        function onSubmitForm() {
            if (isEmpty('password') || isEmpty('repassword') || !isMatchPassword()) {
                return false;
            }
            return true;
        }
    </script>
</html>
<!---
<h1>
    Register Account</h1>
<form action="SignupServlet" >
    <p>
        Fullname</p>
    <input type="text" placeholder="Username" name="name" required>
    <p>
        Gender</p>
    <input type="text" placeholder="gender" name="sex" required>
    <p>
        Email</p>
    <input type="text" placeholder="Useremail" name="email" required>

    <p>
        Password</p>
    <input type="password" placeholder="Password" name="password" required>
    <p>
    <p>
        Repassword</p>
    <input type="password" placeholder="Password" name="repassword" required>
    <p>

    <p>
        Mobile</p>
    <input type="text" placeholder="mobile" name="phone" required>
    <p>
        Address</p>
    <input type="text" placeholder="address" name="add" required>
    <input type="submit" value="Register">
    <a href="Login.jsp">Already have Account?</a>
</form>
</div>
</div>
---->



