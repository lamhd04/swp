<%-- 
    Document   : subject
    Created on : Oct 14, 2021, 11:12:11 AM
    Author     : lhquan1
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
            <form action="subjects" style="margin-bottom: 20px;margin-top: 10px;padding-left: 1rem">
                Title: <input type="text" name="title" value="${param.title}" />
            Author: <input type="text" name="author" value="${param.author}" />
            Status:
            <select name="status" style="">
                <option value=""></option>
                <option value="published">published</option>
                <option value="unpublished">unpublished</option>
            </select>
            <input type="submit" value="Search" style="width:60px; margin-left: 1rem">
        </form>
        <a href="subject-add">New Subject</a>
        <table class="table table-striped table-dark">
            <tr>
                <th>ID</th>
                <th>title</th>
                <th>author</th>
                <th>status</th>
                <th>action</th>   

            </tr>
            <c:forEach items="${listSubjects}" var="subject">
                <tr>
                    <td>${subject.id}</td>
                    <td>${subject.title}</td>
                    <td>${subject.author}</td>
                    <td>${subject.status}</td>
                    <td>
                        <a href="subject-detail?subjectId=${subject.id}">View</a>
                        &nbsp;&nbsp;
                        <a href="AdminControl?userId=${x.userId}&op=delete">Delete</a>
                    </td>
                </tr>
            </c:forEach>

        </table>  
        <c:if test="${totalPage>1}">
            <nav aria-label="Pages">
                <ul class="pagination justify-content-center">
                    <li class="page-item ${param.pageIndex<=1?"disabled":""}">
                        <a class="page-link" href="${url}pageIndex=${param.pageIndex-1}" >|<<</a>
                    </li>
                    <c:forEach begin="1" end="${totalPage}" var="i">            
                        <li class="page-item ${param.pageIndex eq i?"active":""}">
                            <a class="page-link" href="${url}pageIndex=${i}" >${i}</a>
                        </li>
                    </c:forEach>        
                    <li class="page-item ${param.pageIndex>=totalPage?"disabled":""}">
                        <a class="page-link" href="${url}pageIndex=${param.pageIndex+1}" >>>|</a>
                    </li>
                </ul>
            </nav>
        </c:if>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>
