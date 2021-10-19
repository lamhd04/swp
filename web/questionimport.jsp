<%-- 
    Document   : questionimport
    Created on : Oct 13, 2021, 7:31:39 PM
    Author     : User
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <jsp:useBean id="a" class="dao.SettingDAO" scope="request"></jsp:useBean>
            <title>JSP Page</title>
        </head>
        <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-md-11">
                        <div class="card">
                            <div class="card-body">
                                <div>
                                    <div class="card-title">IMPORT INSTRUCTION</div>
                                    <div>
                                        <p class="card-text">The following image is the question import template.</p>
                                        <img class="card-img" src="images/instruction1.png">
                                        <p class="card-text">"This is the question content" part is where you type in the question content,remember question content must be under 200 characters.
                                            "This is the question level(Hard,Medium,Easy)" part is where you type in Hard,Medium or Easy.
                                            "This is the question explanation" part is where you type in the question explanation,remember question content must be under 100 characters.
                                            "This is the question image or video link" this is the embed code of the video,sound or url of the image you want to display on the question.
                                        </p>
                                        <img class="card-img" src="images/instruction2.png">
                                        <p class="card-text">Click on the share button on youtube or any video sharing platform.
                                            Choose embed</p>
                                        <img class="card-img" src="images/instruction3.png">
                                        <p class="card-text">A pop up contains a generated code will show up</p>
                                        <img class="card-img" src="images/instruction4.png">
                                        <p class="card-text">Copy the code then paste to the question video,sound or image.
                                            "This is answer A,The key is to mark if this is the correct answer(key)" is where you type in the answer
                                            it should look like this A: Math is a mandatory subject of the software engineer course (key). The (key) is
                                            to mark if A is correct.
                                            After you done with entering the answer you must type end right under the last question to signal that this is
                                            the end of this question
                                        </p>
                                        <img class="card-img" src="images/instruction5.png">
                                        <p>This is how a question should look like.</p>
                                    </div>
                                </div>
                                <a class="card-link" href="import.txt" download="QuestionImportTemplate.txt">Download Template</a>
                                <form id="myForm" action="UploadFileServlet" style="margin-bottom: 20px;margin-top: 10px;" enctype="multipart/form-data" method="POST">
                                    <div class="form-group row">
                                        <div class="col-3">
                                            <select onchange="getSub()" class="form-control here"  id="1" name="condition" style="height: 40px">
                                                <option value="">Any</option>
                                            <c:forEach items="${a.getSettingByType('quiz_category')}" var="x">
                                                <option  ${condition==x.settingValue ?"selected":""} value="${x.settingValue}">${x.settingValue}</option>
                                            </c:forEach> 
                                        </select>
                                    </div>
                                    <script type="text/javascript">
                                        function getSub() {
                                            var e = document.getElementById("1");
                                            var condition = 'condition=' + e.options[e.selectedIndex].text;
                                            httpRequest = new XMLHttpRequest();
                                            httpRequest.open('POST', 'UploadFileServlet');
                                            httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                                            httpRequest.send(condition);
                                            document.getElementById("myForm").submit();
                                        }
                                    </script>
                                    <div  class="col-3">
                                        <select class="form-control here" name="condition2" style="height: 40px">
                                            <option value="">Any</option>
                                            <c:forEach items="${subcat}" var="x">
                                                <option ${condition2==x.settingValue ?"selected":""} value="${x.settingValue}">${x.settingValue}</option>                                
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-5">
                                        <input type="file" name="file">
                                    </div>
                                    <div class="col-1">
                                        <input class="btn btn-primary"  type="submit" value="enter" style="height: 40px ;width:60px ">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>
