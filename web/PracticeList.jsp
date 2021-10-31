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
        <title>Practice</title>
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
            <jsp:param name="active" value="home"/>
        </jsp:include>
        <div class="container-fluid" style="width: 95%">
            <h4>>>YOUR PRACTICE:</h4>
            <table class="table" style="margin-top: 10px">
                <thead>
                    <tr>
                        <th style="width: 5%">ID</th>
                        <th style="width: 15%">SUBJECT</th>
                        <th style="width: 15%">TYPE</th>
                        <th style="width: 15%">START-TIME</th>
                        <th  style="width: 15%">DURATION</th>
                        <th style="width: 15%">RESULT</th>
                        <th style="width: 7%"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${data}">
                        <tr>
                            <td>${item.getId()}</td>
                            <td>${item.getSubjectName()}</td>
                            <td>${item.getType()}</td>
                            <td>${item.getStartTime()}</td>
                            <td>${item.getDuration()}</td>
                            <td>${item.getResult()} | <span style="color: ${item.getResult() >= item.getPassRate() ? 'green' : 'red'}"> ${item.getResult() >= item.getPassRate() ? 'pass' :'fail'}</span></td>
                            <td><a href="#">view detail</a></td>
                        </tr> 
                    </c:forEach>                  
                </tbody>
            </table>
            <c:if test="${totalPage > 1}">
                <ul class="pagination">
                    <c:forEach var="i" begin="1" end="${totalPage}" step="1">
                        <li class="${i == index ?'active' :''}"><a href="${pageContext.request.contextPath}/practice-list?index=${i}">${i}</a></li>
                        </c:forEach>
                </ul>
            </c:if>
        </div>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>

    </body>
</html>
