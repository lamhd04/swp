<%-- 
    Document   : addSubject
    Created on : Oct 14, 2021, 4:00:36 PM
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
            <form class="p-5" action="subject-add" method="POST">
                <div class="form-group">
                    <label for="exampleFormControlInput1">Title</label>
                    <input name="title"  type="text" class="form-control" id="exampleFormControlInput1" placeholder="title">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Author</label>
                    <input name="author"  type="text" class="form-control" id="exampleFormControlInput1" placeholder="author">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Subject Name</label>
                    <input name="name"  type="text" class="form-control" id="exampleFormControlInput1" placeholder="name">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Category</label>
                    <input name="category" type="text" class="form-control" id="exampleFormControlInput1" placeholder="category">
                </div>
                <div class="d-flex ">
                    <span class="mr-auto">
                        <input type="checkbox" name="featured" value="true" /> 
                        Featured Subject 
                    </span>
                    <span class="d-flex">
                        Status 
                        <select name="status" class="form-control form-control-sm">
                            <option value="published">Published</option>
                            <option value="unpublished">UnPublished</option>
                        </select>
                    </span>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Description</label>
                    <textarea name="description" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
                <input type="submit" value="Save"/>
                <a href="subjects">Back</a>
            </form>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>>
