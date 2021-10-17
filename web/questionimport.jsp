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
            <a href="import.txt" download="QuestionImportTemplate.txt">Download Template</a>
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
                    <input type="text" name="subject">
                </div>
                <div class="col-1">
                    <input class="btn btn-primary"  type="submit" value="enter" style="height: 40px ;width:60px ">
                </div>
            </div>
        </form>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>
