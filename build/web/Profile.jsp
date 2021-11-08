<%-- 
    Document   : Profile
    Created on : Sep 17, 2021, 11:51:30 AM
    Author     : HaGau
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>
            <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <!------ Include the above in your HEAD tag ---------->

            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4>Your Profile</h4>
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <form action="UserDetail" method="post">
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">Id</label> 
                                                <div class="col-8">
                                                    <input name="userId" placeholder="UserId" class="form-control here" type="text" value="${acc.userId}" readonly>
                                            </div>
                                        </div> 
                                        <div class="form-group row">
                                            <font color = "red">${Errorname}</font>
                                            <label class="col-4 col-form-label">Full Name</label> 
                                            <div class="col-8">
                                                <input name="fullname" placeholder="Full Name" class="form-control here" type="text" value="${acc.fullname}">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-4 col-form-label">Email</label> 
                                            <div class="col-8">
                                                <input name="email" placeholder="Email" class="form-control here" type="text" value="${acc.email}" readonly>
                                            </div>
                                        </div> 
                                        <div class="form-group row">
                                            <label class="col-4 col-form-label">Gender</label> 
                                            <div class="col-8">
                                                <select class="form-control here"  name="userTitle">
                                                    <option value="Mr" >Male</option>
                                                    <option value="Mrs">Female</option>
                                                </select>
                                            </div>
                                        </div> 
                                        <input type="text" name="status" value="${acc.status}" hidden>
                                        <div class="form-group row">
                                            <label class="col-4 col-form-label">Password</label> 
                                            <div class="col-8">
                                                <input name="password" placeholder="Password" class="form-control here" type="password" value="${acc.password}" readonly>
                                                <a href="ChangePassword.jsp">Change Password</a>
                                            </div>
                                        </div>  
                                        <div class="form-group row">
                                            <label class="col-4 col-form-label">Phone</label> 
                                            <font color = "red">${Errorphone}</font>
                                            <div class="col-8">
                                                <input name="phone" placeholder="Phone Number" class="form-control here" type="text" value="${acc.phone}">
                                            </div>
                                        </div>  <div class="form-group row">
                                            <label class="col-4 col-form-label">Address</label> 
                                            <font color = "red">${Erroraddress}</font>
                                            <div class="col-8">
                                                <input name="address" placeholder="Address" class="form-control here" type="text" value="${acc.address}">
                                            </div>
                                        </div>
                                        <c:if test="${sessionScope.acc.permission != 'Admin'}">
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">Authority</label> 
                                                <div class="col-8">
                                                    <input name="permission" placeholder="Role" class="form-control here" type="text" value="${role}" readonly>
                                                </div>
                                            </div>
                                        </c:if>  
                                        <c:if test="${sessionScope.acc.permission =='Admin'}">
                                            <div class="form-group row">
                                                <label class="col-4 col-form-label">Authority</label> 
                                                <div class="col-8">
                                                    <select class="form-control here" name="permission">
                                                        <c:forEach items="${list1}" var="x">
                                                            <option ${requestScope.acc.permission == x.settingValue ? "selected":""} value="${x.settingOrder}">${x.settingValue}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </c:if>
                                        <div class="form-group row">
                                            <div class="offset-4 col-8">
                                                <button name="submit" type="submit" class="btn btn-primary">Update Profile</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>
