<%-- 
    Document   : LessonList
    Created on : Nov 5, 2021, 9:13:20 AM
    Author     : User
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="bc" class="dao.SubjectDAO" scope="request"></jsp:useBean>
            <title>JSP Page</title>
        </head>
        <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>
        <center>
            <h1>Lesson List</h1>
        </center>

        <form id="myForm" action="LessonList" style="margin-bottom: 20px;margin-top: 10px;" method="POST">
            <div class="form-group row">
                <div class="col-3">
                    <select  class="form-control here"  name="status" style="height: 40px">
                        <option value="">Any</option>
                        <option ${status=='unpublished' ?"selected":""} value="unpublished">Unpublish</option>
                    <option ${status=='published' ?"selected":""} value="published">Publish</option>
                </select>
            </div>  
            <div  class="col-3">
                <select class="form-control here" name="subject" style="height: 40px">
                    <option value="">Any</option>
                    <c:forEach items="${bc.byStatus}" var="x">
                        <option ${subject==x.id ?"selected":""} value="${x.id}">${x.title}</option>                                
                    </c:forEach>
                </select>
            </div>
            <div class="col-5">
                <input class="form-control here" type="text" value="${search}" name="search">
            </div>
            <div class="col-1">
                <input class="btn btn-primary"  type="submit" value="enter" style="height: 40px ;width:60px ">
            </div>
        </div>
    </form>
    <c:if test="${list.size()==0||list==null}">
        <center>
            <h1>No search result</h1>
        </center>
    </c:if >


    <table class="table table-striped table-dark">
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Brief</th>
            <th>Status</th> 

        </tr>
        <c:forEach items="${list}" var="x">
            <tr>
                <td>${x.lessonId}</td>
                <td>${x.title}</td>
                <td>${x.brief}</td>
                <td>${x.status}</td>
                <td>
                    <a href="LessonDetail?qId=${x.lessonId}">View</a>
                    &nbsp;&nbsp;
                    <c:if test="${x.status == 'published'}">
                        <a href="LessonDetail?qId=${x.lessonId}&op=deactivate">Unpublish</a>
                    </c:if>
                    <c:if test="${x.status == 'unpublished'}">
                        <a href="LessonDetail?qId=${x.lessonId}&op=activate">Publish</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
    <nav aria-label="Pages">
        <ul class="pagination justify-content-center">
            <li class="page-item">
                <a a class="page-link" href="${url}1&subject=${subject}&status=${status}&search=${search}" >|<<</a>
            </li>
            <c:forEach begin="${start}" end="${finish}" var="i">            
                <li class="page-item">
                    <a a class="page-link" href="${url}${i}&subject=${subject}&status=${status}&search=${search}" >${i}</a>
                </li>
            </c:forEach>        
            <li class="page-item">
                <a a class="page-link" href="${url}${end}&subject=${subject}&status=${status}&search=${search}" >>>|</a>
            </li>
        </ul>
    </nav>
    <script src="js/manager.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <jsp:include page="Footer.jsp" flush="true"></jsp:include>
</body>
</html>
