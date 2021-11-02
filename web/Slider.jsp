<%-- 
    Document   : Slider
    Created on : Oct 30, 2021, 3:14:11 PM
    Author     : hungl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <style>
        .pagination {
            display: inline-block;
            clear:both;
            position:relative;
        }

        .pagination a {
            color: black;
            float: right;
            padding: 8px 16px;
            text-decoration: none;

        }

        .pagination a.active {
            background-color: #0069d9;
            color: white;
        }

        .pagination a:hover:not(.active) {background-color: #0069d9;color: white;}
        .search {
            width: 100%;
            position: relative;
            display: flex;
        }

        .searchTerm {
            width:30%;
            border: 3px solid #00B4CC;
            border-right: none;
            padding: 5px;
            height: 50px;
            border-radius: 5px 0 0 5px;
            outline: none;
            color: #9DBFAF;
        }

        .searchTerm:focus{
            color: #00B4CC;
        }

        .searchButton {
            width: 100px;
            height: 50px;
            border: 1px solid #00B4CC;
            background: #00B4CC;
            text-align: center;
            color: #fff;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            font-size: 20px;
        }

        /*Resize the wrap to see the search bar change!*/

    </style>
    <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>
            <header class="header_inner about_page">
                <div class="intro_wrapper">
                    <div class="container">  
                        <div class="row">        
                            <div class="col-sm-12 col-md-8 col-lg-8">
                                <div class="intro_text">
                                    <h1>Slider List</h1>
                                    <div class="pages_links">
                                        <a href="Home.jsp" title="">Home</a>
                                        <a href="#" title="" class="active">Slider</a>
                                    </div>
                                </div>
                            </div>              
                        </div>
                    </div> 
                </div>
            </header>

            <div class="container">
                <h2>LIST SLIDERS</h2>
                <form action="SliderListServlet">
                    <div class="search">
                        <input type="text" name="search" class="searchTerm" value="${search}" placeholder="What are you looking for?">

                        <input type="hidden" value="" name="status" />
                        <input type="hidden" value="" name="search" />
                        <button type="submit" class="searchButton">
                            <i value="Search">Search</i>
                        </button>
                    </div>
                </form>
                <div class="" style="float: right ">
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" style="" type="button" data-toggle="dropdown">Filter
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="SliderListServlet?search=${search}&status=active">Active</a></li>
                        <li><a href="SliderListServlet?search=${search}&status=inactive">Inactive</a></li>
                    </ul>
                </div>
            </div>
            <p></p>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Photo</th>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Back link</th>
                        <th>Note</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="list" items="${list_sliders}">
                        <tr>
                            <td width="100"><img src="${list.image}" width="80" height="70"/></td>
                            <td>${list.sliderID}</td>
                            <td>${list.title}</td>
                            <td>${list.backlink}</td>
                            <td>${list.note}</td>
                            <td>${list.status}</td>                            
                            <td>
                                <a style="padding: 5px 10px ;" class="btn btn-primary btn-sm" href="SliderServlet?id=${list.sliderID}">Edit</a> 
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="pagination" >    
                <%-- <c:forEach begin="1" end="${end}" var="i">
                     <a href="SliderListServlet?index=${i}">${i}</a>
                 </c:forEach> --%>
                <c:forEach begin="1" end="${num}" var="i">

                    <a class="page-link ${index==i?"active":" "}" href="SliderListServlet?index=${i}&search=${search}&status=${status}">${i}</a>
                </c:forEach>
            </div>

        </div>


        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>
