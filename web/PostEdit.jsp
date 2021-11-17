<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="col-12 col-sm-12 col-md-8 col-lg-8">
                <form action="postedit" method="post">
                    <div class="blog_post">
                        <h1>Edit Post</h1>
                        <label>ID:</label>
                        <input value="${detail.postid}" name="postid" type="text" readonly required>
                        <br>
                        <br>
                        <label>Title:</label>
                        <input value="${detail.title}" name="title" type="text" class="form-control" required>
                        <br>
                        <br>
                        <label>Thumbnail:</label>
                        <img src="${detail.thumbnail}" alt="" class="img-fluid">
                        <br>
                        <br>
                        <input value="${detail.thumbnail}" name="thumbnail" type="text" class="form-control" required>
                        <br>
                        <br>
                        <label>Brief:</label>
                        <textarea name="brief" class="form-control" required>${detail.brief}</textarea>
                        <br>
                        <br>
                        <label>Detail</label>
                        <textarea id="editor" name="detail" class="form-control" required>${detail.detail}</textarea>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-success" value="Change">
                    </div>
                </form>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/31.0.0/classic/ckeditor.js"></script>
        <script>
            ClassicEditor
                    .create(document.querySelector('#editor'))
                    .catch(error => {
                        console.error(error);
                    });
        </script>
    </body>
</html>
