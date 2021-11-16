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
        <style>
            form{
                font-size: 22px;
            }
            .form-group {
                font-size: 22px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp" flush="true">
              <jsp:param name="active" value="subject"/>
        </jsp:include>
            <div class="container tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active p-5" id="nav-overview" role="tabpanel" aria-labelledby="nav-overview-tab">
                    <form action="subject-detail" method="POST">
                        <input type="hidden" name="subjectId" value="${subject.id}" />
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Subject Name:</label>
                        <input name="name" style=" font-size: 22px" value="${subject.name}" type="text" class="form-control" id="name" placeholder="name@example.com">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Category:</label>
                        <select class="form-control" name="category" style="font-size: 22px">
                            <c:forEach var="item" items="${cateList}">
                                <option value="${item.getId()}" ${item.getId() == subject.category ? 'selected' :''}>${item.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Status:</label>
                        <select class="form-control" name="status" style="font-size: 22px">
                            <option value="published" ${subject.status == 'published' ? 'selected':''}>Published</option>
                            <option value="unpublished" ${subject.status == 'unpublished' ? 'selected':''}>UnPublished</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Description:</label>
                        <textarea name="description" style=" font-size: 22px" class="form-control" id="description" rows="3">${subject.description}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Featured Subject:</label>&nbsp;&nbsp;
                        <input style="font-size: 22px;width:20px;height:20px;" type="checkbox" name="featured" ${subject.featured ?'checked':''} /> 
                    </div>

                    <button class="btn btn-primary" style="font-size: 26px">Submit</button> <br><br>
                    <a style="font-size: 20px;text-decoration: underline" href="subjects">Back</a>
                    <a href="LessonBySubject?subID=${subject.id}">View Lesson</a>
                </form>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>
