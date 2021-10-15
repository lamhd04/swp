<%-- 
    Document   : ListUser
    Created on : Sep 16, 2021, 9:27:20 PM
    Author     : Nhat Anh PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        table, td, th {  
            border: 1px solid #ddd;
            text-align: left;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 15px;
        }
    </style>
    <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>
        <h2>List Users</h2>
        <table>
            <tr>
                <th>Fullname</th>
                <th>Money</th>
            </tr>
            <tr>
                <td>${User.UserName}</td>
                <td>${User.Money}</td>
            </tr>
        </table>
    </body>
</html>
