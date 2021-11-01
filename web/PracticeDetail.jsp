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
            <section class="blog_wrapper">
                <div class="container">  
                    <div class="row">        
                        <div class="col-12 col-sm-12 col-md-8 col-lg-8">
                            <div class="blog_post">
                                <div class="post_by d-flex">
                                    <span>Type:${test.type}</span>                        
                            </div>
                            <table class="table table-striped">
                                <tr>
                                    <td><h4>Subject</h4></td>
                                    <td><h4>${test.subject}</h3></td>
                                </tr>
                                <tr>
                                    <td><h4>Start Time</h4></td>
                                    <td><h4>${test.starttime}</h4></td>
                                </tr>
                                <tr>
                                    <td><h4>Duration</h4></td>
                                    <td><h4>${test.duration}</h4></td>
                                </tr>
                                <tr>
                                    <td><h4>Question Number</h4></td>
                                    <td><h4>${test.ques_numb}</h4></td>
                                </tr>
                                <tr>
                                    <td><h4>Question Category</h4></td>
                                    <td><h4>${test.ques_cate}</h4></td>
                                </tr>
                                <tr>
                                    <td><h4>Question Subcategory</h4></td>
                                    <td><h4>${test.ques_subcate}</h4></td>
                                </tr>
                            </table>
                        </div>
                        <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><span>Add Practice</span></a>
                    </div>

                    </section>
                    <div id="addEmployeeModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form id="myForm" action="PracticeDetail" method="post">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Add Practice</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>Subject</label>
                                            <select class="form-control here" name="subject" style="height: 40px">
                                                <c:forEach items="${b.getAll()}" var="x">
                                                    <option value="${x.id}">${x.title}</option>
                                                </c:forEach> 
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Type</label>
                                            <select class="form-control here" name="type" style="height: 40px">                                               
                                                    <option value="Free Test">Free Test</option>
                                                    <option value="Simulation Test">Simulation Test</option>
                                                    <option value="Quiz Practice">Quiz Practice</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Start time</label><br>
                                            <font color = "red">${errorstarttime}</font>
                                            <input value="${testadd.starttime}"  name="starttime" type="datetime-local" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Duration</label><br>
                                            <font color = "red">${errorduration}</font>
                                            <input value="${testadd.duration}"  name="duration" type="number" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Question Number</label><br>
                                            <font color = "red">${errorques_numb}</font>
                                            <input value="${testadd.ques_numb}" name="ques_numb" type="number" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Question Category</label>
                                            <select onchange="getSub()" class="form-control here"  id="1" name="ques_cate" style="height: 40px">
                                                <c:forEach items="${a.getSettingByType('category')}" var="x">
                                                    <option value="${x.settingValue}">${x.settingValue}</option>
                                                </c:forEach> 
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Question Subcategory</label>
                                            <select class="form-control here" id="sub" name="ques_subcate" style="height: 40px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="submit" class="btn btn-success" value="Add">
                                    </div>
                                </form>
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
