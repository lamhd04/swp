<%-- 
    Document   : Document
    Created on : Oct 15, 2021, 4:28:21 PM
    Author     : hungl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="a" class="dao.DocumentDAO" scope="request"></jsp:useBean>
            <!-- Required meta tags -->
            	
            <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
            <meta charset="UTF-8">
            <meta name="description" content="">
            <meta name="keywords" content="HTML,CSS,XML,JavaScript">
            <meta name="author" content="Ecology Theme">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Eduwise - Education HTML5 Template</title>
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
            <header class="header_inner blog_page">
                <div class="intro_wrapper">
                    <div class="container">  
                        <div class="row">        
                            <div class="col-sm-12 col-md-8 col-lg-8">
                                <div class="intro_text">
                                    <h1>Document List</h1>
                                    <div class="pages_links">
                                        <a href="#" title="">Home</a>
                                        <a href="DocumentControl" title="" class="active">Document</a>
                                    </div>
                                </div>
                            </div>              

                        </div>
                    </div> 
                </div> 
            </header>
            <section class="blog_wrapper">
            <c:if test="${docsearch != ''}">
                <p class=" col-12 col-sm-12 col-md-4 col-lg-4" style="font-size: 20px;text-align: center;font-weight: bold;color: black">Result for: ${docsearch}</p>
            </c:if>
            <div class="container">  
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-8 col-lg-8">  
                        <c:choose>
                            <c:when test="${!list.isEmpty()}">
                                <c:forEach var="x" items="${list}">
                                    <a href="DocumentDetailsServlet?id=${x.id}" >
                                        <div class="single_blog" style="margin-bottom: 30px; border: 1px solid #FFC321 ">
                                            <div class="blog_banner">
                                                <img src="${x.thumbnail}" alt="" class="img-fluid">
                                            </div>                        
                                            <div class="post_content_wrapper">
                                                <div class="post_date"><p>Posted On : ${x.update_date}</p></div>
                                                <h3>${x.title}</h3>
                                                <p>${x.brief_info}</p>
                                                <ul class="post_bloger">
                                                    <li>BY : ${x.author}</li>                                        
                                                </ul>               
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach> 
                            </c:when>  
                            <c:otherwise>
                                <p>Cannot find document!</p>
                            </c:otherwise>
                        </c:choose> 

                    </div>
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
                                    <h3 class="title">Featured Post</h3>
                                </div>
                                <c:forEach items="${sessionScope.top5}" var="top">
                                    <a href="DocumentDetailsServlet?id=${top.id}">
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
                                    <c:forEach items="${a.getSettingByType('doccategory')}" var="cate">
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

            <div class="pagination_blog">
                <ul>
                    <li><a href="${ur}1&docsearch=${docsearch}"></a><i class='flaticon-left-arrow-1'></i></li>
                            <c:forEach begin="${x}" end="${y}" var="i">
                        <li><a href="${url}${i}&docsearch=${docsearch}">${i}</a></li>
                        </c:forEach> 
                    <li><a href="${url}${end}&docsearch=${docsearch}"></a><i class='flaticon-right-arrow'></i></li>    
                </ul>
            </div>

        </section>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>
