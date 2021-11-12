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

        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp" flush="true">
            <jsp:param name="active" value="class"/>
        </jsp:include>
        <c:if test="${message !=null && message !=''}">
            <script type="text/javascript">
                var message = '${message}';
                if (message === 'success') {
                    alert("add success");
                }else if(message ==='exist'){
                    alert("Class name is duplicated !")
                } else {
                    alert("add fail");
                }
                window.location.href = '${pageContext.request.contextPath}/class';
            </script>
        </c:if>
        <div class="container">
            <h4>ADD CLASS:</h4>
            <br><br>
            <form action="${pageContext.request.contextPath}/class/add" method="POST">
                <div class="form-group">
                    <label for="email">Class Name</label>
                    <input type="text" class="form-control" id="className" placeholder="Enter Class Name" name="className">
                </div>
                <div class="form-group">
                    <label for="pwd">Owner</label>
                    <select  class="form-control" name="owner">
                        <c:forEach var="item" items="${ownerList}">
                            <option value="${item.getUserId()}">${item.getFullname()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="email">Status</label>
                    <select  class="form-control" name="status">
                        <option value="Started">Started</option>
                        <option value="NStarted">Not Started</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary" style="padding: 15px 30px">Submit</button>
            </form>
            <br>
        </div>

        <jsp:include page="Footer.jsp" flush="true"></jsp:include>

    </body>
</html>
