<%-- 
    Document   : PostList
    Created on : Oct 14, 2021, 1:54:31 PM
    Author     : HaGau
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
                        <c:forEach items="${listP}" var="o">
                            <div class="single_blog">
                                <div class="blog_banner">
                                    <a href="postdetail?postid=${o.postid}" title=""><img src="${o.thumbnail}" alt="" class="img-fluid"></a>
                                </div>
                                <div class="post_content_wrapper">
                                    <div class="post_date"><p>Posted On : ${o.time} - <span>Category: ${o.post_cate}</span></p></div>
                                    <h3><a href="postdetail?postid=${o.postid}" title="">${o.title}</a></h3>
                                    <p>${o.brief}</p>
                                    <div class="post_by d-flex justify-content-between">
                                        <a href="#" title="">Read More  <i class="flaticon-login-button"></i></a>
                                        <div class="social_wrapper d-flex">
                                            <span>Share On : </span>
                                            <ul class="social-items d-flex list-unstyled">
                                                <li><a href="#"><i class="fab fa-facebook-f fb_icon"></i></a></li>
                                                <li><a href="#"><i class="fab fa-twitter tw_icon"></i></a></li>
                                                <li><a href="#"><i class="fab fa-linkedin-in link_icon"></i></a></li>
                                                <li><a href="#"><i class="fab fa-instagram in_icon"></i></a></li>
                                            </ul>   
                                        </div>
                                    </div>
                                    <ul class="post_bloger">
                                        <li>BY : ${sessionScope.acc.fullname}</li>                                        
                                    </ul>               
                                </div>
                            </div>
                        </c:forEach>

                        <div class="pagination_blog">
                            <ul>
                                <c:forEach begin="1" end="${endP}" var="i">
                                    <li class="current"><a href="post?index=${i}">${i}</a></li>  
                                    </c:forEach>
                            </ul>
                        </div>            
                    </div> 


                    <div class="col-12 col-sm-12 col-md-4 col-lg-4 blog_wrapper_right ">
                        <div class="blog-right-items">
                            <div class="become_a_teacher widget_single">
                                <div class="form-full-box">                               
                                    <div class="form_title">
                                        <h2>Search</h2>
                                    </div>
                                    <form action="postsearch" method="post">
                                        <div class="register-form">
                                            <div class="row">
                                                <div class="col-12 col-xs-12 col-md-12">
                                                    <div class="form-group">                                      
                                                        <input class="form-control" name="searchTitle" placeholder="Write title you want to search..." required ="" type="text">
                                                    </div>
                                                </div>                                           
                                                <div class="col-12 col-xs-12 col-md-12 register-btn-box">
                                                    <button class="register-btn" type="submit">Search</button>
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
                                <c:forEach items="${listRecent}" var="o">
                                    <div class="single-post">
                                        <div class="recent_img">
                                            <a href="postdetail?postid=${o.postid}" title=""><img src="${o.thumbnail}" alt="" class="img-fluid"></a>
                                        </div>
                                        <div class="post_title">
                                            <a href="postdetail?postid=${o.postid}" title="">${o.title}</a>
                                            <div class="post-date">
                                                <span>${o.time}</span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="archives widget_single">
                                <div class="items-title">
                                    <h3 class="title">All Categories</h3>
                                </div>
                                <c:forEach items="${listPC}" var="o">
                                    <div class="archives-items">
                                        <ul class="list-unstyled">
                                            <li><a href="postcategory?post_cate=${o.settingId}" title="">${o.settingValue}</a></li>
                                        </ul>
                                    </div>
                                </c:forEach>
                            </div>                            
                        </div><!-- ./ End  Blog Right Wrapper-->
                    </div>
                </div> 
            </div>
        </section>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>

        <section id="scroll-top" class="scroll-top">
            <h2 class="disabled">Scroll to top</h2>
            <div class="to-top pos-rtive">
                <a href="#"><i class = "flaticon-right-arrow"></i></a>
            </div>
        </section>

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
