<%-- 
    Document   : resetPass
    Created on : Sep 29, 2021, 10:48:38 PM
    Author     : hungl
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="dao.ExpireMailDAO"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">        
    </head>
    <style>
        body{
            padding:0px;
            margin:0px;
            background:linear-gradient(
                rgba(0, 0, 0, 0.5),
                rgba(0, 0, 0, 0.5)
                ), url('images/blog/blog3-2.jpg');
            background-size: cover;
            
            font-size: 16px;
            background-size: cover;
        }
        #wrapper{
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #form-rp{
            max-width: 400px;
            background: rgba(0, 0, 0 , 0.8);
            flex-grow: 1;
            padding: 30px 30px 40px;
            box-shadow: 0px 0px 17px 2px rgba(255, 255, 255, 0.8);
        }
        .form-heading{
            font-size: 25px;
            color: #f5f5f5;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group{
            border-bottom: 1px solid #fff;
            margin-top: 15px;
            margin-bottom: 20px;
            display: flex;
        }
        .form-group i{
            color: #fff;
            font-size: 14px;
            padding-top: 5px;
            padding-right: 10px;
        }
        .form-input{
            background: transparent;
            border: 0;
            outline: 0;
            color: #f5f5f5;
            flex-grow: 1;
        }
        .form-input::placeholder{
            color: #f5f5f5;
        }
        #eye i{
            padding-right: 0;
            cursor: pointer;
        }
        .form-submit{
            background: transparent;
            border: 1px solid #f5f5f5;
            color: #fff;
            width: 100%;
            text-transform: uppercase;
            padding: 6px 10px;
            transition: 0.25s ease-in-out;
            margin-top: 30px;
        }
        .form-submit:hover{
            border: 1px solid #54a0ff;
        }
    </style>
    <body>
        <div id="wrapper">
            <%
                SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
                ExpireMailDAO emdao = new ExpireMailDAO();
                Date dateExpire = emdao.getdueDate(Integer.parseInt(request.getParameter("id")));
                Calendar now = Calendar.getInstance();
                if (Date.valueOf(sm.format(now.getTime())).compareTo(dateExpire) <= 0) {
            %>
            <form action="ResetPasswordServlet?id=<%= request.getParameter("id")%>" method="post" id="form-rp">
                <h1 class="form-heading">Repassword</h1>
                <font style="color:red">${Errorpassword}</font>
                <div class="form-group">
                    <i class="far fa-key"></i>
                    <input type="text" class="form-input" value="${pass}" name="npassword" placeholder="Enter new password">
                </div>
                <div class="form-group">
                    <i class="fas fa-key"></i>
                    <input type="password" class="form-input" name="npassword1" placeholder="Enter new password again">
                    <div id="eye">
                        <i class="far fa-eye"></i>
                    </div>
                </div>
                <input type="submit" value="Send" class="form-submit">
            </form>
            <%
            } else {
            %>
            <form>
            <h1 style="color: white">Mail is expired! Please request to send mail again.</h1>                       
            <h2 style="text-align: center"> <a style="text-decoration: none;color: wheat" href="Login.jsp"> Back to Login</a></h2>
            </form>>
            <%
                }
            %>
        </div>

    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="js/app.js"></script>
</html>





