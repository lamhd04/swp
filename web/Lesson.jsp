<%-- 
    Document   : Lesson
    Created on : Nov 16, 2021, 12:04:08 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="a" class="dao.SettingDAO" scope="request"></jsp:useBean>
            <!-- Required meta tags -->
            	
            <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
            <meta charset="UTF-8">
            <meta name="description" content="">
            <meta name="keywords" content="HTML,CSS,XML,JavaScript">
            <meta name="author" content="Ecology Theme">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document List</title>
            <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
            <!-- Goole Font -->
            <link href="https://fonts.googleapis.com/css?family=Rubik:400,500,700" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet"> 
            <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,900" rel="stylesheet"> 
            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="css/assets/bootstrap.min.css">
            <!-- Font awsome CSS -->
            <link rel="stylesheet" href="css/assets/font-awesome.min.css">    
            <link rel="stylesheet" href="css/assets/flaticon.css">
            <link rel="stylesheet" href="css/assets/magnific-popup.css">    
            <!-- owl carousel -->
            <link rel="stylesheet" href="css/assets/owl.carousel.css">
            <link rel="stylesheet" href="css/assets/owl.theme.css">     
            <link rel="stylesheet" href="css/assets/animate.css"> 
            <!-- Slick Carousel -->
            <link rel="stylesheet" href="css/assets/slick.css">  
            <!-- Mean Menu-->
            <link rel="stylesheet" href="css/assets/meanmenu.css">
            <!-- main style-->
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/responsive.css">
            <link rel="stylesheet" href="css/demo.css">
        </head>
        <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>
            
            <section class="blog_wrapper">
            <div class="container">
                <h1>Lessons</h1>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-8 col-lg-8">  
                        <c:choose>
                            <c:when test="${!lesson.isEmpty()}">
                                <c:forEach var="x" items="${lesson}">
                                    <a href="LessonDetail?qId=${x.lessonId}" >
                                        <div class="single_blog" style="margin-bottom: 30px; border: 1px solid #FFC321 ">
                                            <div class="blog_banner">
                                                <img src="" alt="" class="img-fluid">
                                            </div>                        
                                            <div class="post_content_wrapper">
                                                <h3>${x.title}</h3>
                                                <p>${x.brief}</p>               
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach> 
                            </c:when>  
                            <c:otherwise>
                                <p>There is no lesson for this subject yet!</p>
                            </c:otherwise>
                        </c:choose> 
                    </div>
                </div>
            </div> 
            <%--            
            <nav aria-label="Pages">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a a class="page-link" href="${url}1" >|<<</a>
                    </li>
                    <c:forEach begin="${x}" end="${y}" var="i">            
                        <li class="page-item">
                            <a a class="page-link" href="${url}${i}" >${i}</a>
                        </li>
                    </c:forEach>        
                    <li class="page-item">
                        <a a class="page-link" href="${url}${end}" >>>|</a>
                    </li>
                </ul>
            </nav>
            --%>
        </section>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>
