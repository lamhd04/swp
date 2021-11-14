<%-- 
    Document   : LessonDetail
    Created on : Nov 7, 2021, 7:33:17 PM
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
            <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script src="https://cdn.ckeditor.com/ckeditor5/31.0.0/classic/ckeditor.js"></script>
            <!------ Include the above in your HEAD tag ---------->

            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                <c:if test="${requestScope.lesson.lessonId>0}">
                                    <div class="col-md-8">
                                        <h4>Lesson Detail</h4>
                                        <hr>
                                    </div>
                                    <div class="col-md-4">
                                        <a class="btn btn-success" href="LessonDetail">Add New</a>
                                    </div>
                                </c:if>
                                <c:if test="${requestScope.lesson.lessonId<1}">
                                    <div class="col-md-12">
                                        <h4>Lesson Detail</h4>
                                        <hr>
                                    </div>
                                </c:if>
                            </div>                                   
                            <div class="row">
                                <div class="col-md-12">
                                    <form action="LessonDetail" method="POST"> 
                                        <div class="form-group row">
                                            <font color = "red">${errortitle}</font>
                                            <label class="col-4 col-form-label">Title</label> 
                                            <div class="col-8">
                                                <input name="title" placeholder="Title" class="form-control here" type="text" value="${lesson.title}" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <font color = "red">${errorbrief}</font>
                                            <label class="col-4 col-form-label">Brief</label> 
                                            <div class="col-8">
                                                <input name="brief" placeholder="Brief" class="form-control here" type="text" value="${lesson.brief}" required>
                                            </div>
                                        </div> 
                                        <div class="form-group row">
                                            <label class="col-4 col-form-label">Subject</label> 
                                            <div class="col-8">
                                                <select class="form-control here" name="subject" style="height: 40px" required>
                                                    <c:forEach items="${bc.byStatus}" var="x">
                                                        <option ${lesson.subject==x.title?"selected":""}  value="${x.id}">${x.title}</option>
                                                    </c:forEach> 
                                                </select>
                                            </div>
                                        </div> 
                                        <div class="form-group row">
                                            <label class="col-4 col-form-label">Status</label> 
                                            <div class="col-8">
                                                <input ${lesson.status=='published'?"checked":""} type="radio" name="status" value="published" required>Publish
                                                <input ${lesson.status=='unpublished'?"checked":""} type="radio" name="status" value="unpublished">Unpublish
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-4 col-form-label">Content</label> 
                                            <div class="col-8">
                                                <font color = "red">${errorcontent}</font>
                                                <textarea id="editor" name="content" class="form-control here" >${lesson.content}</textarea>
                                            </div>
                                        </div>
                                        <input type="text" value="${lesson.lessonId}" name="lessonId" hidden>
                                        <div class="form-group row">
                                            <div class="offset-4 col-8">
                                                <button name="submit" type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </div>
                                        <center>
                                            <font color = "green">${alert}</font>
                                        </center>                                     
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            ClassicEditor
                    .create(document.querySelector('#editor'))
                    .catch(error => {
                        console.error(error);
                    });
        </script>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>
