<%-- 
    Document   : Header
    Created on : Oct 2, 2021, 10:16:15 PM
    Author     : Nhat Anh PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta name="keywords" content="HTML,CSS,XML,JavaScript">
        <meta name="author" content="Ecology Theme">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Eduwise - Education HTML5 Template</title>
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">

        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Goole Font -->
        <link href="https://fonts.googleapis.com/css?family=Rubik:400,500,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,900" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/assets/bootstrap.min.css">
        <!-- Font awsome CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/assets/font-awesome.min.css">    
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/assets/flaticon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/assets/magnific-popup.css">    
        <!-- owl carousel -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/assets/owl.carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/assets/owl.theme.css">     
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/assets/animate.css"> 
        <!-- Slick Carousel -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/assets/slick.css">  
        <!-- Mean Menu-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/assets/meanmenu.css">
        <!-- main style-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/demo.css">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            header .edu_nav nav .navbar li a{
                padding: 28px
            }
        </style>
    </head>
    <body>
        <header class="header_inner about_page">
            <!-- Preloader -->   
            <div class="header_top">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-lg-12">
                            <div class="info_wrapper">
                                <div class="contact_info">                   
                                    <ul class="list-unstyled">
                                        <li><i class="flaticon-phone-receiver"></i>+84 01234567</li>
                                        <li><i class="flaticon-mail-black-envelope-symbol"></i>G1@gmail.com</li>
                                    </ul>                    
                                </div>
                                <div class="login_info"> 
                                    <c:if test="${sessionScope.acc==null}">
                                        <ul class="d-flex">                                       
                                            <li class="nav-item"><a href="Signup.jsp" class="nav-link sign-in js-modal-show"><i class="flaticon-user-male-black-shape-with-plus-sign"></i>Sign Up</a></li>
                                            <li class="nav-item"><a href="Login.jsp" class="nav-link join_now js-modal-show"><i class="flaticon-padlock"></i>Log In</a></li>
                                        </ul>
                                    </c:if>
                                    <c:if test="${sessionScope.acc!=null}">
                                        <ul class="d-flex">                                       

                                            <li class="nav-item"><a href="AccountControl?op=logout" class="nav-link join_now js-modal-show"><i class="flaticon-padlock"></i>Log Out</a></li>
                                        </ul>
                                    </c:if>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="edu_nav" style="max-height: 100px;border-bottom: 2px solid">
                <div class="container-fluid" style="max-height: 80px">
                    <nav class="navbar navbar-expand-md navbar-light bg-faded" style="max-height: 80px">
                        <a class="navbar-brand" href="index-2.html"><img src="${pageContext.request.contextPath}/images/logo.png" alt="logo"></a>
                        <div class="collapse navbar-collapse main-menu" id="navbarSupportedContent">
                            <ul class="navbar-nav nav lavalamp ml-auto menu">
                                <c:choose>
                                    <c:when test="${sessionScope.acc.permission == 'Admin'}">
                                        <li class="nav-item"><a href="AccountControl?op=profile&userId=${sessionScope.acc.userId}" class="nav-link">Admin Menu</a>
                                            <ul class="navbar-nav nav mx-auto">
                                                <li class="nav-item"><a href="AdminControl?op=settinglist" class="nav-link">Setting List</a></li>
                                                <li class="nav-item"><a href="AdminControl?op=userlist" class="nav-link">User List</a></li>
                                            </ul>
                                        </li>
                                    </c:when>
                                    <c:when test="${sessionScope.acc.permission == 'Expert'}">
                                        <li class="nav-item"><a href="AccountControl?op=profile&userId=${sessionScope.acc.userId}" class="nav-link">Expert Menu</a>
                                            <ul class="navbar-nav nav mx-auto">
                                                <li class="nav-item"><a href="QuestionPaging" class="nav-link">Question List</a></li>
                                                <li class="nav-item"><a href="QuizListServlet" class="nav-link">Quiz List</a></li>
                                            </ul>
                                        </li>
                                    </c:when>
                                </c:choose>
                                <li class="nav-item"><a href="${pageContext.request.contextPath}/home" class="nav-link ${param.active == 'home'? 'active':''}">Home</a>
                                </li>
                                <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
                                <c:if test="${sessionScope.acc!=null}">
                                <li class="nav-item"><a href="SliderListServlet" class="nav-link">Slider</a></li>
                                </c:if>
                                <c:if test="${sessionScope.acc.permission == 'Marketing'}">
                                <li class="nav-item"><a href="postmanager" class="nav-link">Manager Post</a></li>
                                </c:if>
                                <c:if test="${sessionScope.acc.permission == 'Admin'||sessionScope.acc.permission == 'Expert'||sessionScope.acc.permission == 'Manager' }">
                                <li class="nav-item"><a href="DashBoard.jsp" class="nav-link">Dashboard</a></li>
                                </c:if>
                                <li class="nav-item"><a href="blog.html" class="nav-link">Document</a>
                                    <ul class="navbar-nav nav mx-auto">
                                        <li class="nav-item"><a href="DocumentControl" class="nav-link">Document List</a></li>

                                    </ul> 
                                </li>
                                <li class="nav-item"><a href="#" class="nav-link">Pages</a>
                                    <ul class="navbar-nav nav mx-auto">
                                        <li class="nav-item"><a href="post" class="nav-link">Post</a>
                                        <li class="nav-item"><a href="exam" class="nav-link">Exam</a>
                                    </ul>                            
                                </li>
                                <li class="nav-item"><a href="${pageContext.request.contextPath}/class" class="nav-link ${param.active == 'class'? 'active':''}">Classes</a>
                                <li class="nav-item"><a href="${pageContext.request.contextPath}/subjects" class="nav-link ${param.active == 'subject'? 'active':''}">Subjects</a>
                                </li>
                            </ul>
                        </div>
                    </nav><!-- END NAVBAR -->
                </div> 
            </div>

        </header>
</html>
