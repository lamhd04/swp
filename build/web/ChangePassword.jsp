<%-- 
    Document   : ChangePassword
    Created on : Sep 26, 2021, 12:27:44 PM
    Author     : HaGau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="changepass">
            <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <!------ Include the above in your HEAD tag ---------->

            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4>Change Password</h4>
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <form>                                                                                                   
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">Email</label> 
                                                <div class="col-8">
                                                    <input name="email" placeholder="Email" class="form-control here" type="text" value="${sessionScope.acc.email}">
                                                </div>
                                            </div> 
                                            <font color="red">${msg}</font>
                                            </br>
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">Old Password</label> 
                                                <div class="col-8">
                                                    <input name="password" placeholder="Enter Old Password" class="form-control here" type="password" required>
                                                </div>
                                            </div>  
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">New Password</label> 
                                                <div class="col-8">
                                                    <input name="newpassword" placeholder="Enter New Password" class="form-control here" type="password" required>
                                                </div>
                                            </div>
                                            <font color="red">${message}</font>
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">Re-Password</label> 
                                                <div class="col-8">
                                                    <input name="repassword" placeholder="Re-Password" class="form-control here" type="password" required>
                                                </div>
                                            </div>                                           
                                            <div class="form-group row">
                                                <div class="offset-4 col-8">
                                                    <button name="submit" type="submit" class="btn btn-primary" alert="Change Password Success!">Update Password</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
