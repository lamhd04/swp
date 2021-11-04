<%-- 
    Document   : PracticeDetail
    Created on : Oct 30, 2021, 10:58:32 AM
    Author     : User
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="a" class="dao.SettingDAO" scope="request"></jsp:useBean>
        <jsp:useBean id="b" class="dao.SubjectDAO" scope="request"></jsp:useBean>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <title>JSP Page</title>
        </head>
        <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4>Practice</h4>                                        
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <form id="myForm" action="PracticeDetail" method="post">  

                                        <c:choose>
                                            <c:when test="${requestScope.test.testId<1}">
                                                <div class="form-group row">
                                                    <label class="col-4 col-form-label ">Subject</label>
                                                    <div class="col-8">
                                                        <select class="form-control here" name="subject" style="height: 40px" required>
                                                            <c:forEach items="${b.getByStatus()}" var="x">
                                                                <option ${test.subject==x.title?"selected":""} value="${x.id}">${x.title}</option>
                                                            </c:forEach> 
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-4 col-form-label ">Type</label>
                                                    <div class="col-8">
                                                        <select class="form-control here" name="type" style="height: 40px" required>  
                                                            <c:forEach items="${a.getSettingByType('test_type')}" var="x">
                                                                <option value="${x.settingValue}">${x.settingValue}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="form-group row">
                                                    <label class="col-4 col-form-label ">Subject</label>
                                                    <div class="col-8">
                                                        <input  value="${test.subject}"  name="starttime" type="text" class="form-control" readonly>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-4 col-form-label">Type</label>
                                                    <div class="col-8">
                                                        <input  value="${test.type}"  name="starttime" type="text" class="form-control" readonly>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:if test="${requestScope.test.testId>0}">
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label ">Start time</label>
                                                <div class="col-8">
                                                    <input  value="${test.starttime}"  name="starttime" type="text" class="form-control" readonly>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label ">Duration</label>
                                                <div class="col-8">
                                                    <input  value="${test.duration}"  name="duration" type="number" class="form-control" readonly>
                                                </div>
                                            </div>
                                        </c:if>
                                        <div class="form-group row">
                                            <label class="col-4 col-form-label ">Question Number</label>
                                            
                                            <div class="col-8">
                                                <font color = "red">${errorques_numb}</font>
                                                <input ${requestScope.test.testId>0? "readonly":"required"} value="${test.ques_numb}" name="ques_numb" type="number" class="form-control" >
                                            </div>
                                        </div>
                                        <c:choose>
                                            <c:when test="${requestScope.test.testId<1}">
                                                <div class="form-group row">
                                                    <label class="col-4 col-form-label ">Question Category</label>
                                                    <div class="col-8">
                                                        <select onchange="getSub()" class="form-control here"  id="1" name="ques_cate" style="height: 40px" required>
                                                            <c:forEach items="${a.getSettingByType('category')}" var="x">
                                                                <option ${test.ques_cate==x.settingValue?"selected":""} value="${x.settingValue}">${x.settingValue}</option>
                                                            </c:forEach> 
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-4 col-form-label">Question Subcategory</label>
                                                    <div class="col-8">
                                                        <select onclick="getSub()" class="form-control here" id="sub" name="ques_subcate" style="height: 40px" required>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="submit" class="btn btn-success" value="Add">
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="form-group row">
                                                    <label class="col-4 col-form-label">Question Category</label>
                                                    <div class="col-8">
                                                        <input  value="${test.ques_cate}"  name="ques_cate" type="text" class="form-control" readonly>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-4 col-form-label">Question Subcategory</label>
                                                    <div class="col-8">
                                                        <input  value="${test.ques_subcate}" type="text" class="form-control" readonly>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-4 col-form-label">Tag</label>
                                                    <div class="col-8">
                                                        <input  value="${test.tag}" type="text" class="form-control" readonly>
                                                    </div>
                                                </div>
                                                <div class="form-group row" >
                                                    <label class="col-4 col-form-label">Resut</label>
                                                    <div class="col-8">
                                                        <input  value="${test.result}" type="text" class="form-control" readonly>
                                                    </div>
                                                </div>
                                                    <center>
                                                <a class="btn btn-success" href="PracticeDetail">Add</a>
                                                </center>
                                            </c:otherwise>
                                        </c:choose>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function getSub() {
                var e = document.getElementById("1");
                var condition = e.options[e.selectedIndex].value;
                $.ajax({
                    url: "/Project/getSubcategory",
                    type: 'POST',
                    data: {
                        category: condition
                    },
                    success: function (data) {
                        var a = document.getElementById("sub");
                        sub.innerHTML = data;
                    }, error: function (jqXHR, textStatus, errorThrown) {

                    }
                });
            }
        </script>
        <script src="js/manager.js" type="text/javascript"></script>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>
