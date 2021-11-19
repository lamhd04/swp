<%-- 
    Document   : DocumentCategory
    Created on : Oct 15, 2021, 4:38:19 PM
    Author     : hungl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta name="keywords" content="HTML,CSS,XML,JavaScript">
        <meta name="author" content="Ecology Theme">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Category</title>
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
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]--> 
        <jsp:useBean id="a" class="dao.SettingDAO" scope="request"></jsp:useBean>
        </head>
        <body>

        <jsp:include page="Header.jsp" flush="true"></jsp:include>
            


            <section class="blog_wrapper">
                <div class="container">  
                    <div class="row">

                        <div class="col-12 col-sm-12 col-md-8 col-lg-8">
                        <c:forEach var="list" items="${listDocCate}">
                            <a href="DocumentDetailsServlet?id=${list.docID}" >
                                <div class="single_blog" style="margin-bottom: 30px; border: 1px solid #FFC321 ">
                                    <div class="blog_banner">
                                        <img src="${list.thumbnail}" alt="" class="img-fluid">
                                    </div>                        
                                    <div class="post_content_wrapper">
                                        <div class="post_date"><p>Posted On : ${list.update_date}</p></div>
                                        <h3>${list.title}</h3>
                                        <p>${list.brief}</p>
                                        <p style="color: green">${list.doc_cate}</p>
                                        <ul class="post_bloger">
                                            <li>BY : ${list.author}</li>                                        
                                        </ul>               
                                    </div>
                                </div>
                            </a>
                        </c:forEach>         
                    </div> <!-- End Blog Right Side--->

                    <div class="col-12 col-sm-12 col-md-4 col-lg-4 blog_wrapper_right ">
                        <div class="blog-right-items">

                            <div class="become_a_teacher widget_single">
                                <div class="form-full-box">
                                    <form action="DocumentControl" method="post">
                                        <div class="register-form">
                                            <div class="row">
                                                <div class="col-12 col-xs-12 col-md-12">
                                                    <div class="form-group">
                                                        <label><i class="fa fa-search"></i></label>
                                                        <input class="form-control" name="docsearch" placeholder="Write title you want to search" required="" type="text">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-xs-12 col-md-12 register-btn-box">
                                                    <button class="register-btn" type="submit">Search...</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>


                            <div class="recent_post_wrapper widget_single">
                                <div class="items-title">
                                    <h3 class="title">Featured Document</h3>
                                </div>
                                <c:forEach items="${sessionScope.top5}" var="top">
                                    <a href="DocumentDetailsServlet?id=${top.docID}">
                                        <div class="single-post">
                                            <div class="recent_img">
                                                <img src="${top.thumbnail}"  class="img-fluid">
                                            </div>
                                            <div class="post_title">
                                                <p style="font-weight: 700;color: #333146;font-size: 18px;">${top.title}</p>
                                                <div class="post-date">
                                                    <span>${top.update_date}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>

                            <div class="archives widget_single">
                                <div class="items-title">
                                    <h3 class="title">All Categories</h3>
                                </div>
                                <div class="archives-items">
                                    <c:forEach items="${a.getSettingByType('doc_cate')}" var="cate">
                                        <ul class="list-unstyled">
                                            <li><a href="DocumentCategoryServlet?dcid=${cate.settingValue}" title="">${cate.settingValue} </a></li>
                                        </ul>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div><!-- ./ End  Blog Right Wrapper-->

                </div>
            </div> 
        </section><!-- ./ End  Blog Wrapper-->
