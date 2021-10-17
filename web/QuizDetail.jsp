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
                                <h3>${quizDetail.title}</h3>
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
                            </table>
                        </div>
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
                                                    <input  class="form-control here" type="text" value="${quizDetail.title}" name="title">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">Subject</label> 
                                                <div class="col-8">
                                                    <input  class="form-control here" type="text" value="${quizDetail.subject}" name="subject">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">Category</label> 
                                                <div class="col-8">
                                                    <input  class="form-control here" type="text" value="${quizDetail.category}" name="category">
                                                </div>
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

        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
