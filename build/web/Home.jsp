<%-- 
    Document   : Home
    Created on : Sep 16, 2021, 8:09:30 PM
    Author     : HaGau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>
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
                            </div>
                        </div>              

                    </div>
                </div> 
            </div> 
        </header>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</form>
</html>
