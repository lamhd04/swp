<%-- 
    Document   : QuizResult
    Created on : Nov 17, 2021, 1:03:16 PM
    Author     : Nhat Anh PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    </head>
    <style>
        .container{
            width: 70%;
        }
    </style>
    <body>
        <div class="container">
            <table class="table">
                <tr>
                    <td>Số điểm</td>
                    <td>${score}</td>
                </tr>
                <tr>
                    <td>Câu trả lời đúng</td>
                    <td>${correct}</td>
                </tr>
                <tr>
                    <td>Câu trả lời sai</td>
                    <td>${wrong}</td>
                </tr>
                <tr>
                    <td>Câu chưa trả lời</td>
                    <td>${unans}</td>
                </tr>
            </table>
                <button><a href="QuizReviewServlet"> QuizReview</a></button>
        </div>
                
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    </body>
</html>
