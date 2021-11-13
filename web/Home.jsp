<%-- 
    Document   : Home
    Created on : Sep 16, 2021, 8:09:30 PM
    Author     : HaGau
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="a" class="dao.SliderDAO" scope="request"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <style>
            .carousel .item{
                height: 300px
            }
            @media (min-width: 768px){
                .container{margin-top: 10px}
            }
            .slider{
                position:relative;
            }
            .slider > .item{
                position: absolute;
                opacity: 0;
                z-index: 0;
                width:100%;
                height: 100%;
                top:0;
                left:0;
                overflow:hidden;
            }
            .item-content h1{
                color: pink;
            }
            .item-content p{
                color: pink;
            }
            .slider > .item.active{
                opacity: 1;
                z-index:10;
            }
            .slider .slider-control{
                color: rgba(150,150,150,.6);
                position:absolute;
                top:calc(50% - 30px);
                height:60px;
                width:60px;
                line-height:60px;
                z-index: 100;
                text-align:center;
                cursor: pointer;
                opacity: .5;
            }
            .slider .slider-control:hover{
                opacity: 1;
            }
            .slider .slider-control.next{
                right:0;
            }
            .slider .slider-control.prev{
                left:0;
            }
            .slider .slider-nav{
                width:100%;
                height: 40px;
                position: absolute;
                z-index: 100;
                text-align:center;
                bottom:0;
                left:0;
            }
            .slider .slider-nav a{
                display: inline-block;
                margin:5px;
                width:15px;
                height:15px;
                background: rgba(150,150,150,.6);
                overflow: hidden;
                border-radius:50%;
                opacity: .5;
            }
            .slider .slider-nav a:hover{
                opacity: .9;
            }
            .slider .slider-nav a.active{
                background: #fff;
                opacity: 1;
            }


            /* For  Demo Only. */
            /* The code below is not needed for slideshow to work. */

            /*  Animations  */ 
            .slider .item.active .item-content {
                animation-name: fadeUp;
                animation-duration: 0.5s;
            }
            .slider .item.active .item-content p {
                animation-name: fadeUp;
                animation-duration: .8s;
            }

            @keyframes fadeUp {
                0% {
                    margin-top: 60px;
                    opacity: 0;
                }
                100% {
                    margin-top: 0;
                    opacity: 1;
                }
            }
            /*  General Styling  */ 
            body {
                background: #333;
                color: #fff;
                font-family: sans-serif;
                transition: background 2s;
            }
            .slider {
                width: 960px;
                height: 300px;
                margin: 30px auto;
                background: #fff;
                color: #000;
                box-shadow: 0 10px 30px -10px rgba(0, 0, 0, 0.8);
            }
            .slider > .item {
                text-align: center;
            }
            .slider > .item .item-content {
                padding: 60px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp" flush="true">
            <jsp:param name="active" value="home"/>
        </jsp:include>
        <div class="container-fluid" style="background-color: #dbe4ff">
            <br>
            <div class="container" style="float: left;width: 100%;margin: 0px 0px 20px 0px">
                <div class="container" style="width: 80%; margin: 0 auto">
                    <h3>>PUBLIC</h3>
                    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 130%">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div id="slider_id" class="slider">
                            <div class="slider-control next">&#9658;</div>
                            <div class="slider-control prev">&#9664;</div>
                        <div class="slider-nav"></div>
                            <c:forEach var="l" items="${a.allSliders}">
                                <div class="item active" style="background-image: url(${l.image})">
                                    <a href="${l.backlink}">
                                        <div class="item-content">
                                            <h1>${l.title}</h1>
                                            <p>${l.note}</p>                        
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>

                        </div>

                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
                <br>
                <div class="container" style="border-top: 1px solid;float: left;width: 100%;margin: 0px 0px 20px 11% ">
                </div>
                <div class="container" style="float: left;margin: 0px 0px 20px 11%">
                    <div class="row" style="width: 100%">
                        <div class="col">
                            <h3>>HOT POSTS</h3>
                            <div class="w3-content w3-display-container" style="border: 1px solid #FFFFFF;margin-top: 10px">
                                <c:forEach var="item" items="${post}">
                                    <a class="mySlides"  href="${pageContext.request.contextPath}/PracticeDetail?testId=1">
                                        <label style="width: 100%;padding: 5px 0px;background-color: white;font-size: 18px">**${item.getTitle()}</label>
                                        <img src="${item.getThumbnail()}" style="width:100%; height: 500px;margin-top: -9px"> 
                                    </a>
                                </c:forEach>

                                <button class="w3-button w3-white w3-display-left" style=" border-radius: 20px;margin-left: 6px;"
                                        onclick="plusDivs(-1, 'mySlides')">&#10094;</button>
                                <button class="w3-button w3-white w3-display-right" style=" border-radius: 20px;margin-right: 6px;"
                                        onclick="plusDivs(1, 'mySlides')">&#10095;</button>
                            </div>
                        </div>
                        <div class="col">
                            <h3>>FREE EXAM</h3>
                            <div class="w3-content w3-display-container" style="border: 1px solid #FFFFFF;margin-top: 10px">
                                <c:forEach var="item" items="${exam}">
                                    <a class="mySlides1"  href="${pageContext.request.contextPath}/PracticeDetail?testId=1">
                                        <label style="width: 100%;padding: 5px 0px;background-color: white;font-size: 18px">**${item.getTitle()}</label>
                                        <img src="${item.getThumbnail()}" style="width:100%; height: 500px;margin-top: -9px"> 
                                    </a>
                                </c:forEach>

                                <button class="w3-button w3-white w3-display-left" style=" border-radius: 20px;margin-left: 6px;" 
                                        onclick="plusDivs(-1, 'mySlides1')">&#10094;</button>
                                <button class="w3-button w3-white w3-display-right" style=" border-radius: 20px;margin-right: 6px;"
                                        onclick="plusDivs(1, 'mySlides1')">&#10095;</button>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="container" style="border-top: 1px solid;float: left;width: 100%;margin: 0px 0px 20px 11% ">
                </div>
                <div class="container" style="width: 80%;font-size: 25px;">
                    <h3>>>RECENT POST</h3>
                    <c:forEach var="item" items="${lastestPost}">
                        ><a href="#" style="padding: 5px;"> ${item.getTitle()}</a><br>
                    </c:forEach>>
                </div>
            </div>
            <!-- right sider -->
            <div class="container" style="float: left;width: 25%;background-color:white;border: 2px solid #000000; float: right">
                <form style="margin-top: 10px" action="${pageContext.request.contextPath}/practice-list" method="POST">
                    <input style="width: 85%" type="text" name="keyword" placeholder="search exam..."/><input type="submit" value="search"/>
                </form>
                <div style="font-size: 20px;margin-top: 10px">
                    <c:forEach var="item" items="${exCate}">
                        > <a style="margin-bottom: 40%" href="#">${item.getName()}</a><br>
                    </c:forEach>
                </div>
                <br>                
            </div>
            <br>
        </div>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
        <script>
            <!-- JS for DocumentSlider -->
            $(document).ready(function () {
                var time = 2500;
                var timeReset = time;

                setInterval(function () {
                    time = time - 1000;
                    var $activeItem = $(".slider > .item.active");
                    var $nextItem = $activeItem.next();
                    var $prevItem = $activeItem.prev();

                    function nextSlide() {
                        $activeItem.removeClass("active");
                        $nextItem.addClass("active");
                        setNav();
                        time = timeReset;
                    }
                    function prevSlide() {
                        $activeItem.removeClass("active");
                        $prevItem.addClass("active");
                        setNav();
                        time = timeReset;
                    }
                    if ($(".slider > .item").last().hasClass("active")) {
                        $nextItem = $(".slider > .item").first();
                    }
                    if (time <= 0) {
                        nextSlide();
                    }
                }, 1000);

                // Build Slider Navigation
                $(".slider > .item").each(function (i) {
                    $(this).attr("data-id", i);
                    $(".slider-nav").append('<a href="#" data-id="' + i + '"></a>');
                });

                $('.slider-nav > a[data-id="' + $('.slider > .item.active').attr("data-id") + '"]').addClass('active');

                function setNav() {
                    $('.slider-nav > a').removeClass('active');
                    $('.slider-nav > a[data-id="' + $('.slider > .item.active').attr("data-id") + '"]').addClass('active');
                }

                $(".slider-nav > a").on("click", function (e) {
                    e.preventDefault();
                    $(".slider-nav > a").removeClass("active");
                    $(".slider .item.active").removeClass("active");
                    $('.slider-nav > a[data-id="' + $(this).attr("data-id") + '"]').addClass('active')
                    $('.slider .item[data-id="' + $(this).attr("data-id") + '"]').addClass("active");
                    time = timeReset;
                });
                $(".slider-control").on("click", function () {
                    var $activeItem = $(".slider > .item.active");
                    var $nextItem = $activeItem.next();
                    var $prevItem = $activeItem.prev();
                    if ($(this).hasClass('prev')) {
                        if ($('.slider > .item').first().hasClass('active')) {
                            $(".slider > .item").first().removeClass("active");
                            $(".slider-nav > a").first().removeClass("active");
                            $('.slider > .item').last().addClass('active');
                            $('.slider-nav > a').last().addClass('active');
                        } else {
                            $activeItem.removeClass('active');
                            $('.slider-nav > a').removeClass('active');
                            $prevItem.addClass('active');
                            $('.slider-nav a[data-id="' + $prevItem.attr("data-id") + '"]').addClass("active");
                        }
                    }
                    if ($(this).hasClass('next')) {
                        if ($('.slider > .item').last().hasClass('active')) {
                            $(".slider > .item").last().removeClass("active");
                            $(".slider-nav > a").last().removeClass("active");
                            $('.slider > .item').first().addClass('active');
                            $('.slider-nav > a').first().addClass('active');
                        } else {
                            $activeItem.removeClass('active');
                            $('.slider-nav > a').removeClass('active');
                            $nextItem.addClass('active');
                            $('.slider-nav a[data-id="' + $nextItem.attr("data-id") + '"]').addClass("active");
                        }
                    }
                    time = timeReset;
                });
            });
            <!-- End JS for DocumentSlider -->
            
            var slideIndex = 1;
            showDivs(slideIndex, 'mySlides');
            showDivs(slideIndex, 'mySlides1');
            function plusDivs(n, name) {
                showDivs(slideIndex += n, name);
            }

            function showDivs(n, name) {
                var i;
                var x = document.getElementsByClassName(name);
                if (n > x.length) {
                    slideIndex = 1
                }
                if (n < 1) {
                    slideIndex = x.length;
                }
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                x[slideIndex - 1].style.display = "block";
            }
            var myIndex = 0;
            carousel();

            function carousel() {
                var i;
                var x = document.getElementsByClassName("mySlides");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                myIndex++;
                if (myIndex > x.length) {
                    myIndex = 1;
                }
                x[myIndex - 1].style.display = "block";
                setTimeout(carousel, 3000); // Change image every 2 seconds
            }
            var myIndex = 0;
            carousel1();

            function carousel1() {
                var i;
                var x = document.getElementsByClassName("mySlides1");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                myIndex++;
                if (myIndex > x.length) {
                    myIndex = 1;
                }
                x[myIndex - 1].style.display = "block";
                setTimeout(carousel1, 3000); // Change image every 2 seconds
            }
        </script>

    </body>
</html>
