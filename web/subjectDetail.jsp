<%-- 
    Document   : subject
    Created on : Oct 14, 2021, 11:12:11 AM
    Author     : lhquan1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <a class="nav-link active" id="nav-overview-tab" data-toggle="tab" href="#nav-overview" role="tab" aria-controls="nav-overview" aria-selected="true">Overview</a>
                    <a class="nav-link" id="nav-dimension-tab" data-toggle="tab" href="#nav-dimension" role="tab" aria-controls="nav-dimension" aria-selected="false">Dimension</a>
                    <a class="nav-link" id="nav-price-package-tab" data-toggle="tab" href="#nav-price-package" role="tab" aria-controls="nav-price-package" aria-selected="false">Price Package</a>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active p-5" id="nav-overview" role="tabpanel" aria-labelledby="nav-overview-tab">
                    <form action="subjects" method="POST">
                        <input type="hidden" name="subjectId" value="${subject.id}" />
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Subject Name</label>
                        <input name="name" value="${subject.name}" type="text" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Category</label>
                        <input name="category" value="${subject.category}" type="text" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                    </div>
                    <div class="d-flex ">
                        <span class="mr-auto">
                            <input type="checkbox" name="" ${subject.featured?"checked":""} value="true" /> 
                            Featured Subject 
                        </span>
                        <span class="d-flex">
                            Status 
                            <select class="form-control form-control-sm">
                                <option value="published">Published</option>
                                <option value="unpublished">UnPublished</option>
                            </select>
                        </span>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Description</label>
                        <textarea name="description" class="form-control" id="exampleFormControlTextarea1" rows="3">${subject.description}</textarea>
                    </div>
                    <input type="submit" value="Submit"/>
                    <a href="subjects">Back</a>
                </form>
            </div>
            <div class="tab-pane fade p-5" id="nav-dimension" role="tabpanel" aria-labelledby="nav-dimension-tab">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Type</th>
                            <th scope="col">Dimension</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listDimensions}" var="dimension">
                            <tr>
                                <td>${dimension.id}</td>
                                <td>${dimension.type}</td>
                                <td>${dimension.dimension}</td>
                                <td>
                                    <a href="subject-detail?subjectId=${subject.id}">View</a>
                                    &nbsp;&nbsp;
                                    <a href="AdminControl?userId=${x.userId}&op=delete">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade p-5" id="nav-price-package" role="tabpanel" aria-labelledby="nav-price-package-tab">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Package</th>
                            <th scope="col">Duration</th>
                            <th scope="col">List Price</th>
                            <th scope="col">Sale Price</th>
                            <th scope="col">Status</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listPackages}" var="package">
                            <tr>
                                <td>${package.id}</td>
                                <td>${package.packages}</td>
                                <td>${package.duration}</td>
                                <td>${package.listPrice}</td>
                                <td>${package.salePrice}</td>
                                <td>${package.status}</td>
                                <td>
                                    <a href="subject-detail?subjectId=${subject.id}">View</a>
                                    &nbsp;&nbsp;
                                    <a href="AdminControl?userId=${x.userId}&op=delete">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </body>
</html>
