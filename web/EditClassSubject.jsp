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
            button {
                padding: 7px 4px;
                font-size: 20px;
                border: 1px solid #999999;
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
                    alert("remove success");
                } else {
                    alert("remove fail");
                }
                window.location.href = '${pageContext.request.contextPath}/class/edit-subject?classId=${classId}';
            </script>
        </c:if>
        <div class="container-fluid" style="width: 95%">
            <form action="${pageContext.request.contextPath}/class/edit-subject" method="POST" >
                <input type="text" name="subjectName" value="${keyword}" placeholder="enter subject name to add..." required/>
                <input type="hidden" name="classId" value="${classId}"/>
                <button>Add</button>
            </form>
            <table class="table" style="margin-top: 10px">
                <thead>
                    <tr>
                        <th style="width: 5%">ID</th>
                        <th style="width: 40%">Subject Name</th>
                        <th style="width: 30%">Categroy</th>
                        <th style="width: 10%"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${data}">
                        <tr>
                            <td>${item.getId()}</td>
                            <td>${item.getName()}</td>
                            <td>${item.getCategory()}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/class/remove-subject?classId=${classId}&subjectId=${item.getId()}">Remove</a>
                            </td>
                        </tr> 
                    </c:forEach>                  
                </tbody>
            </table>
            <c:if test="${totalPage > 1}">
                <ul class="pagination">
                    <c:forEach var="i" begin="1" end="${totalPage}" step="1">
                        <li class="${i == index ?'active' :''}"><a href="${pageContext.request.contextPath}/class?index=${i}">${i}</a></li>
                        </c:forEach>
                </ul>
            </c:if>
        </div>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>

    </body>
</html>
