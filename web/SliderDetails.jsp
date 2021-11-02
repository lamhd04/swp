<%-- 
    Document   : SliderDetails
    Created on : Oct 30, 2021, 5:40:21 PM
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
        <script src="https://cdn.ckeditor.com/ckeditor5/31.0.0/classic/ckeditor.js"></script>
    </head>
    <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>

            <header class="header_inner about_page">
                <div class="intro_wrapper">
                    <div class="container">  
                        <div class="row">        
                            <div class="col-sm-12 col-md-8 col-lg-8">
                                <div class="intro_text">
                                    <h1>Slider Details</h1>
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

            <div class="container" style="margin-top: 10px;">
                <div class="row"
                     style="border: 1px darkgrey solid; border-radius: 10px; width: 50%; margin: 0 auto; padding: 20px;">
                    <div class="col-sm-12">

                        <h2 class="myclass">Slider's Details </h2>
                        <form action="SliderServlet" method="post" >
                            <div class="form-group">
                                <label>ID</label> 
                                <input type="text" 
                                       class="form-control" name="sliderId" value="${sdetail.sliderID}" readonly>
                        </div>
                        <div class="form-group">
                            <label>Title</label>
                            <font style="color:red">${titleError}</font>
                            <input type="text" 
                                   class="form-control" value="${sdetail.title}" name="title" >
                        </div>
                        <div class="form-group">
                            <label>Back link</label> 
                            <font style="color:red">${backlinkError}</font>
                            <input type="text" 
                                   class="form-control" value="${sdetail.backlink}" name="backlink" >
                        </div>
                        <div class="form-group">
                            <label>Status</label>                            
                            <div class="col-8">
                                <input name="status" type="radio" value="active" ${sdetail.status=='active' ? "checked":""} >Active
                                <input name="status" type="radio" value="inactive" ${sdetail.status=='inactive' ? "checked":""} >Inactive
                            </div>

                        </div>
                        <div class="form-group">
                            <label>Note</label> 
                            <textarea type="text" 
                                      class="form-control" id="editor" name="note" >${sdetail.note}</textarea>
                        </div>

                        <div class="form-group">
                            <label>Image</label> <br/>
                            <font style="color:red">${imageError}</font>
                            <img src="${sdetail.image}" width="80px" height="70px" />
                            <input type="text" 
                                   class="form-control" value="${sdetail.image}" name="image" >
                        </div>
                        <input type="submit" value="Save" class="btn btn-primary"/>
                        <button type="reset" class="btn btn-primary">Cancel</button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            ClassicEditor
                    .create(document.querySelector('#editor'))
                    .catch(error => {
                        console.error(error);
                    });
        </script>

        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>
