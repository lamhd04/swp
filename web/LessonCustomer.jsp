<%-- 
    Document   : LessonCustomer
    Created on : Nov 16, 2021, 12:20:35 PM
    Author     : User
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <jsp:useBean id="a" class="dao.SettingDAO" scope="request"></jsp:useBean>
            <title>JSP Page</title>
        </head>
        <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-md-11">
                        <div class="card">
                            <div class="card-body">
                                <div>
                                    <center>
                                        <div class="card-title" style="text-transform: uppercase">
                                            <b>${lesson.title}</b>
                                        </div>
                                    </center>                                   
                                    <div>
                                        <p class="card-text">${lesson.brief}</p>
                                        <p class="card-text">${lesson.content}</p>
                                </div>
                            </div>                             
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>
