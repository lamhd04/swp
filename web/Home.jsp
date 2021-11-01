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
        </style>
    </head>
<<<<<<< HEAD
    <body>
        <jsp:include page="Header.jsp" flush="true">
            <jsp:param name="active" value="home"/>
        </jsp:include>
        <div class="container-fluid" style="background-color: #dbe4ff">
            <div class="container" style="width: 80%;">
                <h3>>PUBLIC</h3>
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" style="border: 5px solid #FFFFFF">
                        <c:set var="count" value="1"/>
                        <c:forEach var="item" items="${document}">
                            <div class="item ${count == 1 ? 'active' :''}">
                                <img src="${item.getThumbnail()}" alt="Los Angeles" style="width:100%;height: 300px;">
=======
        <body>
        <jsp:include page="Header.jsp" flush="true">
            <jsp:param name="active" value="home"/>
        </jsp:include>
        <header class="header_inner about_page">
        <div class="intro_wrapper">
                <div class="container">  
                    <div class="row">        
                        <div class="col-sm-12 col-md-8 col-lg-8">
                            <div class="intro_text">
                                <h1>About Page</h1>
                                <div class="pages_links">
                                    <a href="Home.jsp" title="">Home</a>
                                    <a href="#" title="" class="active">About Page</a>
                                </div>
>>>>>>> cb17f0627b17feeb8cb8204a109d1b4a54a771dc
                            </div>
                            <c:set var="count" value="${count + 1}"/>
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
            <div class="container" style="border-top: 1px solid;width: 80% ">
            </div>
            <div class="container" style="width: 80%">
                <div class="row">
                    <div class="col">
                        <h3>>HOT POSTS</h3>
                        <div class="w3-content w3-display-container" style="border: 1px solid #FFFFFF">
                            <c:forEach var="item" items="${post}">
                                <img class="mySlides" src="${item.getThumbnail()}" style="width:100%; height: 500px"> 
                            </c:forEach>

                            <button class="w3-button w3-white w3-display-left" style=" border-radius: 20px;margin-left: 6px;"
                                    onclick="plusDivs(-1, 'mySlides')">&#10094;</button>
                            <button class="w3-button w3-white w3-display-right" style=" border-radius: 20px;margin-right: 6px;"
                                    onclick="plusDivs(1, 'mySlides')">&#10095;</button>
                        </div>
                    </div>
                    <div class="col">
                        <h3>>FREE EXAM</h3>
                        <div class="w3-content w3-display-container" style="border: 1px solid #FFFFFF">
                            <c:forEach var="item" items="${exam}">
                                <img class="mySlides1" src="${item.getThumbnail()}" style="width:100%; height: 500px"> 
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
            <div class="container" style="border-top: 1px solid;width: 80% ">
            </div>
            <div class="container" style="width: 80%;font-size: 25px;">
                <h3>>>BLOGS</h3>
                ><a href="#" style="padding: 5px;"> this is sample event 1</a><br>
                ><a href="#" style="padding: 5px;"> this is sample event 1</a><br>
                ><a href="#" style="padding: 5px;" > this is sample event 1</a><br>
                ><a href="#" style="padding: 5px;" > this is sample event 1</a><br>
                ><a href="#" style="padding: 5px;" > this is sample event 1</a><br>
                ><a href="#" style="padding: 5px;" > ...</a><br>
            </div>
            <br>
        </div>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
        <script>
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
