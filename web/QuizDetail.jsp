<%-- 
    Document   : QuizDetail
    Created on : Oct 17, 2021, 3:22:41 PM
    Author     : Nhat Anh PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="a" class="dao.SettingDAO" scope="request"></jsp:useBean>
        <jsp:useBean id="b" class="dao.quizDAO" scope="request"></jsp:useBean>
            <title>JSP Page</title>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        </head>
        <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>
            <section class="blog_wrapper">
                <div class="container">  
                    <div class="row">        
                        <div class="col-12 col-sm-12 col-md-8 col-lg-8">
                            <div class="blog_post">
                                <h3>${quizDetail.name}</h3>
                            <div class="post_by d-flex">
                                <span>By - <a href="#" title="" class="bloger_name">${quizDetail.expert}</a></span>
                                <span>Type:${quizDetail.type}</span>                        
                                <span>Pass Rate:${quizDetail.passRate} %</span>
                            </div>
                            <table class="table table-striped">
                                <tr>
                                    <td><h4>Subject</h4></td>
                                    <td><h4>${quizDetail.subject}</h3></td>
                                </tr>
                                <tr>
                                    <td><h4>category</h4></td>
                                    <td><h4>${quizDetail.category}</h4></td>
                                </tr>
                                <tr>
                                    <td><h4>level</h4></td>
                                    <td><h4>${quizDetail.level}</h4></td>
                                </tr>
                                <tr>
                                    <td><h4>Question Number</h4></td>
                                    <td><h4>${quizDetail.quesNum}</h4></td>
                                </tr>
                            </table>
                        </div>
                        <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><span>Import Question</span></a>
                    </div>

                    <div class="col-12 col-sm-12 col-md-4 col-lg-4 blog_wrapper_right ">
                        <div class="blog-right-items">

                            <div class="become_a_teacher widget_single">
                                <div class="form-full-box">
                                    <div class="form_title">
                                        <h2>Become A Member</h2>
                                        <p>Get Instant access to <span>5000+ </span>Video courses </p>
                                    </div>
                                    <div class="register-form">

                                        <div class="col-12 col-xs-12 col-md-12 register-btn-box">
                                            <button class="register-btn" data-toggle="modal" data-target="#myModal">Edit</button>
                                        </div>
                                        <div class="col-12 col-xs-12 col-md-12 register-btn-box">
                                            <button class="register-btn">Delete</button>
                                        </div>

                                        <div class="col-12 col-xs-12 col-md-12 register-btn-box">
                                            <button class="register-btn">Study</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal" id="myModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Edit</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form method="post" action="QuizDetail">
                                        <!-- Vertical -->
                                        <div class="form-group">
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">ID</label> 
                                                <div class="col-8">
                                                    <input readonly="" class="form-control here" type="text" value="${quizDetail.quizId}" name="quizId">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">Title</label> 
                                                <div class="col-8">
                                                    <input  class="form-control here" type="text" value="${quizDetail.name}" name="title">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">Subject</label> 
                                                <div class="col-8">
                                                    <select  class="form-control here" type="text" value="${quizDetail.subject}" name="subject">
                                                        <c:forEach items="${slist}" var="x">
                                                            <option value="${x.id}">${x.title}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">Category</label> 
                                                <select  class="form-control here" type="text" value="${quizDetail.category}" name="category">
                                                    <c:forEach items="${slist}" var="x">
                                                        <option value="${x.category}">${x.category}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">Level</label> 
                                                <div class="col-8">
                                                    <input  class="form-control here" type="text" value="${quizDetail.level}" name="level">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">Type</label> 
                                                <div class="col-8">
                                                    <input  class="form-control here" type="text" value="${quizDetail.type}" name="type">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">Question Number</label> 
                                                <div class="col-8">
                                                    <input  class="form-control here" type="text" value="${quizDetail.quesNum}" name="quesNum">
                                                </div>
                                            </div>    
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">Pass Rate</label> 
                                                <div class="col-8">
                                                    <input  class="form-control here" type="text" value="${quizDetail.passRate}" name="passRate">
                                                </div>
                                            </div>     
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">						
                        <h4 class="modal-title">Question Import</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <a class="modal-body" href="import.txt" download="QuestionImportTemplate.txt">Download Template</a>
                    <form action="UploadFileServlet" style="margin-bottom: 20px;margin-top: 10px;" enctype="multipart/form-data" method="POST">
                        <div class="modal-body row">
                            <div class="col-10">
                                <select class="form-control here" name="condition2" style="height: 40px">
                                    <c:forEach items="${a.getSettingByType(quizDetail.category)}" var="x">
                                        <option  ${temp==x.settingValue ?"selected":""} value="${x.settingValue}">${x.settingValue}</option>
                                    </c:forEach> 
                                </select>                              
                            </div>
                            <input type="text" name="quizId" value="${b.getQuizDetail(quizDetail.quizId).quizId}" hidden>
                        </div>
                        <div class="modal-body row">
                            <div class="col-9">
                                <input type="file" name="file">
                            </div>         
                        </div>
                        <center>
                            <input class="btn btn-primary"  type="submit" value="enter" style="height: 40px ;width:66px; text-align: center;">
                        </center>
                    </form>
                </div>
            </div>
        </div>


        <script src="js/manager.js" type="text/javascript"></script>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    </body>
</html>
