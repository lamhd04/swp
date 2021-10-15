<%-- 
    Document   : notification
    Created on : Sep 29, 2021, 11:26:30 PM
    Author     : hungl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body{
            padding:0px;
            margin:0px;
            background: 
                linear-gradient(
                rgba(0, 0, 0, 0.5),
                rgba(0, 0, 0, 0.5)
                ),
                url(images/banner/banner_4.jpg);
            background-size: cover;
            height: 100vh;
        }
        .noti{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            text-align: center;
        }
        .noti h1{
            font-size: 50px;
            margin-left: 20px;
            margin-right: 20px;
        }
    </style>
    <body>
        <div  class="col-lg-6 col-sm-12">
            <form action="ResetPasswordServlet" method="post">
                <div class="noti">
                    <h1 class="noti" > ${msg} </h1>
                </div>
            </form>
        </div>
    </body>
</html>
