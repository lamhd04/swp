<%-- 
    Document   : Home
    Created on : Sep 16, 2021, 8:09:30 PM
    Author     : HaGau
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <style>
            .carousel .item{
                height: 300px
            }
            @media (min-width: 768px){
                .container{margin-top: 10px}
            }
            form{
                display: block;
                text-align: center;
                margin-top: 8px;
                margin-bottom: 25px
            }
            form input[type=text] {
                padding: 7px 0px;
                width: 77%;
                margin-top: 18px;
                font-size: 20px;
                color: black
            }
        </style>
    </head>
    <body>

        <jsp:include page="Header.jsp" flush="true">
            <jsp:param name="active" value="class"/>
        </jsp:include>
        <c:if test="${message !=null && message !=''}">
            <script type="text/javascript">
                var message = '${message}';
                if(message === 'fail'){
                    alert("remove fail");
                }else{
                    alert("remove succes");
                }
                window.location.href='${pageContext.request.contextPath}/class/edit-user?classId=${classId}';
            </script>
        </c:if>
        <div class="container-fluid" style="width: 95%">
            <br>
            <form action="${pageContext.request.contextPath}/class/remove-user" method="POST" >
                <label>Please enter reason remove user: <span style="font-size: 24px; color: red">${user.getFullname()}</span></label><br>
                <textarea cols="100" rows="5" style="font-size: 24px" name="reason"></textarea>
                <input type="hidden" name="classId" value="${classId}"/><br><br>
                <input type="hidden" name="userId" value="${user.getUserId()}"/>
                <button class="btn btn-primary" style="padding: 10px 20px">Remove</button>
            </form>
        </div>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>

    </body>
</html>
