<%-- 
    Document   : PostDetail
    Created on : Oct 15, 2021, 8:21:38 AM
    Author     : HaGau
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
    </head>
    <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>           
            <section class="blog_wrapper">
                <div class="container">  
                    <div class="row">        
                        <div class="col-12 col-sm-12 col-md-8 col-lg-8">
                            <div class="blog_post">
                                <h3>${post.title}</h3>
                                <div class="post_by d-flex">
                                    <span>By - <a href="#" title="" class="bloger_name">${post.author}</a></span>
                                    <span>Posted On : ${post.time}</span>                        
                                    <span><a href="#" title="">${detail.cId}</a></span>
                                </div>
                                <img src="${post.thumbnail}" alt="" class="img-fluid">
                                <div class="postpage_content_wrapper">
                                    <div class="social_wrapper">
                                        <h4>Share</h4>
                                        <ul class="social_items list-unstyled">
                                            <li><a href="#"><i class="fab fa-facebook-f fb_icon"></i></a></li>
                                            <li><a href="#"><i class="fab fa-twitter tw_icon"></i></a></li>
                                            <li><a href="#"><i class="fab fa-linkedin-in link_icon"></i></a></li>
                                            <li><a href="#"><i class="fab fa-instagram in_icon"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="blog_post_content">
                                    </div>
                                </div>
                            </div>               
                        </div> <!-- End Blog Left Side-->

                        <div class="col-12 col-sm-12 col-md-4 col-lg-4 blog_wrapper_right ">
                            <div class="blog-right-items">

                                <div class="become_a_teacher widget_single">
                                    <div class="form-full-box">
                                        <div class="form_title">
                                            <h2>Become A Membar</h2>
                                            <p>Get Instant access to <span>5000+ </span>Video courses </p>
                                        </div>
                                        <form>
                                            <div class="register-form">
                                                <div class="row">
                                                    <div class="col-12 col-xs-12 col-md-12">
                                                        <div class="form-group">
                                                            <label><i class="fas fa-user"></i></label>
                                                            <input class="form-control" name="name" placeholder="Write Your Name" required="" type="text">
                                                        </div>
                                                    </div>

                                                    <div class="col-12 col-xs-12 col-md-12">
                                                        <div class="form-group">
                                                            <label><i class="flaticon-email"></i></label>
                                                            <input class="form-control" name="email" placeholder="Write Your E-mail" required="" type="email">
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-xs-12 col-md-12">
                                                        <div class="form-group massage_text">
                                                            <label><i class="flaticon-copywriting"></i></label>
                                                            <textarea class="form-control"  placeholder="Write Something Here" required="" ></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-xs-12 col-md-12 register-btn-box">
                                                        <button class="register-btn" type="submit">Send Now</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>


                                <div class="recent_post_wrapper widget_single">
                                    <div class="items-title">
                                        <h3 class="title">Recent Post</h3>
                                    </div>
                                    <div class="single-post">
                                        <div class="recent_img">
                                            <a href="#" title=""><img src="images/blog/side_blog_1.jpg" alt="" class="img-fluid"></a>
                                        </div>
                                        <div class="post_title">
                                            <a href="#" title="">How to Become Master In CSS within qa Week.</a>
                                            <div class="post-date">
                                                <span>May 29, 2019</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="single-post">
                                        <div class="recent_img">
                                            <a href="#" title=""><img src="images/blog/side_blog_2.jpg" alt="" class="img-fluid"></a>
                                        </div>
                                        <div class="post_title">
                                            <a href="#" title="">Connecting volunteers & nonprofitsz worldwide.</a>
                                            <div class="post-date">
                                                <span>25 August, 2019</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="single-post">
                                        <div class="recent_img">
                                            <a href="#" title=""><img src="images/blog/side_blog_3.jpg" alt="" class="img-fluid"></a>
                                        </div>
                                        <div class="post_title">
                                            <a href="#" title="">Research of Learn training process</a>
                                            <div class="post-date">
                                                <span>25 August, 2019</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="archives widget_single">
                                    <div class="items-title">
                                        <h3 class="title">All Categories</h3>
                                    </div>
                                    <c:forEach items="${listPC}" var="o">
                                    <div class="archives-items">
                                        <ul class="list-unstyled">
                                            <li><a href="postcategory?cid=${o.cid}" title="">${o.cname}</a></li>
                                        </ul>
                                    </div>
                                </c:forEach>
                            </div>                                
                        </div>
                    </div> 
                    </section>

                    <jsp:include page="Footer.jsp" flush="true"></jsp:include>
                    <!-- JavaScript -->
                    <script src="js/jquery-3.2.1.min.js"></script>
                    <script src="js/popper.min.js"></script>
                    <script src="js/bootstrap.min.js"></script>
                    <script src="js/jquery.magnific-popup.min.js"></script>     
                    <script src="js/owl.carousel.min.js"></script>   
                    <script src="js/slick.min.js"></script>   
                    <script src="js/jquery.meanmenu.min.js"></script>    
                    <script src="js/wow.min.js"></script> 
                    <!-- Counter Script -->
                    <script src="js/waypoints.min.js"></script>
                    <script src="js/jquery.counterup.min.js"></script>
                    <script src="js/custom.js"></script> 
                    </body>

                    </html>
