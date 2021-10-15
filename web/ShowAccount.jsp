<%-- 
    Document   : ShowAccount
    Created on : Sep 17, 2021, 5:02:23 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>
            <form action="UserPaging" style="margin-bottom: 20px;margin-top: 10px;">
                <div class="form-group row">
                    <div class="col-1">
                        <select class="form-control here" name="order" style="height: 40px ;">
                            <option value="Asc">ASC</option>
                            <option value="desc">DESC</option>
                        </select>
                    </div>
                    <div class="col-2">
                        <select class="form-control here" name="type" style="height: 40px">
                            <option value="userId">ID</option>
                            <option value="fullname">Name</option>
                            <option value="email">email</option>
                            <option value="phone">phone</option>
                            <option value="address">address</option>
                            <option value="">Reset</option>
                        </select>
                    </div>
                    <div class="col-2">
                        <select class="form-control here" name="condition" style="height: 40px">
                            <option value="and userTitle='Mr'">Male</option>
                            <option value="and userTitle='Mrs'">Female</option>
                            <option value="and permission='1'">Admin</option>
                            <option value="">Reset</option>
                        </select>
                    </div>
                    <div class="col-6">
                        <input class="form-control here" type="text" value="${fullname}">
                </div>
                <div class="col-1">
                    <input class="btn btn-primary"  type="submit" value="enter" style="height: 40px ;width:60px ">
                </div>
            </div>
        </form>

        <table class="table table-striped table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Title</th>
                <th>Phone</th>   
                <th>Address</th> 
                <th>Role</th>
                <th>Status</th>

            </tr>
            <c:forEach items="${list}" var="x">
                <tr>
                    <td>${x.userId}</td>
                    <td>${x.fullname}</td>
                    <td>${x.email}</td>
                    <td>${x.userTitle}</td>
                    <td>${x.phone}</td>
                    <td>${x.address}</td>
                    <td>${x.permission}</td>
                    <td>${x.status}</td>
                    <td>
                        <a href="AdminControl?userId=${x.userId}&op=view">View</a>
                        &nbsp;&nbsp;

                        <c:if test="${x.status == 'active'}">
                            <a href="AdminControl?userId=${x.userId}&op=deactivate">Deactivate</a>
                        </c:if>
                        <c:if test="${x.status == 'inactive'}">
                            <a href="AdminControl?userId=${x.userId}&op=activate">Activate</a>
                        </c:if>

                    </td>
                </tr>
            </c:forEach>

        </table>  
        <nav aria-label="Pages">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a a class="page-link" href="${url}1&order=${order}&conditon=${condition}" >|<<</a>
                </li>
                <c:forEach begin="${x}" end="${y}" var="i">            
                    <li class="page-item">
                        <a a class="page-link" href="${url}${i}&order=${order}&conditon=${condition}" >${i}</a>
                    </li>
                </c:forEach>        
                <li class="page-item">
                    <a a class="page-link" href="${url}${end}&order=${order}&conditon=${condition}" >>>|</a>
                </li>
            </ul>
        </nav>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>
