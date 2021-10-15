<%-- 
    Document   : settingList
    Created on : Sep 30, 2021, 2:39:41 PM
    Author     : Nhat Anh PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Setting</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>
        <form action="SettingServlet" style="margin-bottom: 20px;margin-top: 10px;">
           
            <select name="order" style="height: 40px ;">
                <option value="Asc">ASC</option>
                <option value="desc">DESC</option>
            </select>
            
            <select name="condition" style="height: 40px">
                <option value="settingId">ID</option>
                <option value="type">type</option>
                <option value="settingValue">Value</option>
                <option value="settingOrder">Order</option>
                <option value="status">status</option>
            </select>
            <input type="submit" value="enter" style="height: 40px ;width:60px ">
            <a class="btn btn-primary" href="settingAdd.jsp" style="height: 40px; ">Add New</a>
        </form>
        
        <table class="table table-striped table-dark">
            <tr>
                <th>ID</th>
                <th>Type</th>
                <th>Value</th>
                <th>Order</th>
                <th>Status</th>                
            </tr>
            <c:forEach items="${sList}" var="x">
                <tr>
                    <td>${x.settingId}</td>
                    <td>${x.type}</td>
                    <td>${x.settingValue}</td>
                    <td>${x.settingOrder}</td>
                    <td>${x.status}</td>
                    <td>
                        <a href="SettingControl?sid=${x.settingId}&op=update">Edit</a>
                        &nbsp;&nbsp;
                        <a href="SettingControl?sid=${x.settingId}&op=delete">Delete</a>
                    </td>
                </tr>
            </c:forEach>

        </table>  
        <nav aria-label="Pages">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a a class="page-link" href="SettingServlet?index=1&order=${order}&conditon=${condition}" >|<<</a>
                </li>
                <c:forEach begin="${x}" end="${y}" var="i">            
                    <li class="page-item">
                        <a a class="page-link" href="SettingServlet?index=${i}&order=${order}&conditon=${condition}" >${i}</a>
                    </li>
                </c:forEach>        
                <li class="page-item">
                    <a a class="page-link" href="SettingServlet?index=${endPage}&order=${order}&conditon=${condition}" >>>|</a>
                </li>
            </ul>
        </nav>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>
