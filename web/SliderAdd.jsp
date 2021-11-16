<%-- 
    Document   : SliderAdd
    Created on : Nov 16, 2021, 1:24:20 PM
    Author     : hungl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>


            <div class="container" style="margin-top: 10px;">
                <div class="row"
                     style="border: 1px darkgrey solid; border-radius: 10px; width: 50%; margin: 0 auto; padding: 20px;">
                    <div class="col-sm-12">

                        <h2 class="myclass">Add new Slider</h2>
                        <form action="SliderServlet?action=add" method="post" >
                            <div class="form-group">
                                <img src="${newS.image}"  width="80px" height="70px"><br>
                                <input hidden="" name="fn" value="${filename}">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Add Image</button>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <font style="color:red">${titleError}</font>
                            <input type="text" 
                                   class="form-control"  name="titleA" >
                        </div>
                        <div class="form-group">
                            <label>Back link</label> 
                            <font style="color:red">${backlinkError}</font>
                            <input type="text" 
                                   class="form-control"  name="backlinkA" >
                        </div>

                        <div class="form-group">
                            <label>Note</label> 
                            <textarea type="text" 
                                      class="form-control" id="editor" name="noteA" ></textarea>
                        </div>

                        <div class="form-group">
                            <label>Status</label>                            
                            <div class="col-8">
                                <input name="statusA" type="radio" value="active" checked >Active
                                <input name="statusA" type="radio" value="inactive" >Inactive
                            </div>
                        </div>
                            
                            <input id="default-btn" type="file" hidden class="form-control" name="photo" placeholder="Enter photo">
                            <input type="submit" value="Save" class="btn btn-primary"/>
                            <button type="reset" class="btn btn-primary">Cancel</button>
                    </form>
                    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">

                                <form action="EditSliderServlet?id=add" method="post" enctype="multipart/form-data">
                                    <label>Image</label> <br/>
                                    <font style="color:red">${imageError}</font>
                                    <img id="img" src="${filename}"  width="80px" height="70px"><br>
                                    <input required accept="pic/*"  onchange="loadFile(event)" id="file" type="file" name="imageA" >
                                    <button type="submit">Save</button>                                   
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    



    <script>
        ClassicEditor
                .create(document.querySelector('#editor'))
                .catch(error => {
                    console.error(error);
                });

        var loadFile = function (event) {
            var output = document.getElementById('img');
            img.src = URL.createObjectURL(event.target.files[0]);
            img.onload = function () {
                URL.revokeObjectURL(img.src)
            }
        };

    </script>

    <jsp:include page="Footer.jsp" flush="true"></jsp:include>
</body>
</html>
