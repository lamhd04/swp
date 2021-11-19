<%-- 
    Document   : DocumentDetails
    Created on : Oct 15, 2021, 4:30:29 PM
    Author     : hungl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">


    <head>
        <!-- Required meta tags -->
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta name="keywords" content="HTML,CSS,XML,JavaScript">
        <meta name="author" content="Ecology Theme">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document Details</title>
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
        <style>
        .download{margin-top: 15px;padding:12px 15px!important;color:#white!important;font-weight:700;font-size:14px;font-family:Open Sans,sans-serif;text-align:center;text-transform:uppercase;border-radius:3px;opacity:.95;border:0;letter-spacing:2px;transition:all .2s ease-out}

.download {background-color:#3498DB;}
.download a {color:white}
.download:hover {background-color:#49DDAA;color:#fff;border-bottom:2px solid #1ABC84;opacity:1;}

.download:before {;display:inline-block;font-weight:normal;vertical-align:top;margin-right:10px;width:16px;height:16px;line-height:24px;font-family:fontawesome;transition:all 0.5s ease-out;}
        </style>
        <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>
            <header class="header_inner blog_page">
                <!-- Preloader -->


                <div class="intro_wrapper">
                    <div class="container">  
                        <div class="row">
                        <c:forEach var="listDet" items="${listDetails}">
                            <div class="col-sm-12 col-md-8 col-lg-8">
                                <div class="intro_text">
                                    <h1>${listDet.title} Details </h1>
                                    <div class="pages_links">
                                        <a href="#" title="">Home</a>
                                        <a href="DocumentControl" title="">Document</a>
                                        <a href="#" title="" class="active">${listDet.title} Details</a>
                                    </div>
                                </div>
                            </div>              
                        </c:forEach>
                    </div>
                </div> 
            </div> 
        </header> <!-- End Header -->

        <section class="event_details_wrapper blog_wrapper">
            <div class="container">  
                <div class="row">
                    <c:forEach var="listDet" items="${listDetails}">
                        <div class="col-12 col-sm-12 col-md-8 col-lg-8">
                            <div class="event_intro">
                                <span style="font-weight: bold;font-size: 30px;color: black;text-align: center">${listDet.title}</span>
                                <img src="${listDet.thumbnail}" alt="" class="img-fluid">
                                <div class="post_content">
                                    <div class="post_by d-flex justify-content-between">
                                        <span  class="date_event">${listDet.update_date}</span>
                                        <span>Author: ${listDet.author}</span>
                                    </div>
                                    <p style="color: green">Category : ${listDet.doc_cate}</p>
                                    <div class="blog_post_content">
                                        <p>${listDet.content} </p>
                                    </div>
                                </div>
                                <c:if test="${sessionScope.acc!=null}">
                                    <button class="download">
                                        <a href="pdf/${listDet.title}.pdf"                                       
                                           download="${listDet.title}.pdf"> Download here
                                        </a>
                                    </button>  
                                </c:if>
                            </div>   
                        </div>            
                    </c:forEach>
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

                            <div class="recent_post_wrapper popular_courses_post widget_single">
                                <div class="items-title">
                                    <h3 class="title">Our Featured Document</h3>
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
                    </div>

                </div>
            </div> 
        </section><!-- End Event Details Wrapper -->



        <section id="scroll-top" class="scroll-top">
            <h2 class="disabled">Scroll to top</h2>
            <div class="to-top pos-rtive">
                <a href="#"><i class = "flaticon-right-arrow"></i></a>
            </div>
        </section>

        <!--  JavaScript -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>     
        <script src="js/owl.carousel.min.js"></script>  
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAhrdEzlfpnsnfq4MgU1e1CCsrvVx2d59s"></script>
        <script src="js/map-helper.js"></script>     
        <script src="js/slick.min.js"></script>   
        <script src="js/jquery.meanmenu.min.js"></script>  
        <script src="js/wow.min.js"></script> 
        <!-- Counter Script -->
        <script src="js/waypoints.min.js"></script>
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/custom.js"></script> 

        <!-- =========================================================
             STYLE SWITCHER | ONLY FOR DEMO NOT INCLUDED IN MAIN FILES
        ============================================================== -->
        <script type="text/javascript" src="js/demo.js"></script>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>

</html>
