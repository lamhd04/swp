<%-- 
    Document   : QuestionList
    Created on : Oct 11, 2021, 4:52:50 PM
    Author     : User
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="a" class="dao.SettingDAO" scope="request"></jsp:useBean>
        <jsp:useBean id="bc" class="dao.SubjectDAO" scope="request"></jsp:useBean>
        <jsp:useBean id="cb" class="dao.quizDAO" scope="request"></jsp:useBean>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <title>JSP Page</title>

        </head>
        <body>
        <jsp:include page="Header.jsp" flush="true"></jsp:include>
            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><span>Import Question</span></a>
            <form id="myForm" action="QuestionPaging" style="margin-bottom: 20px;margin-top: 10px;" method="POST">
                <div class="form-group row">
                    <div class="col-3">
                        <select onchange="getSub()" class="form-control here"  id="1" name="condition" style="height: 40px">
                            <option value="Any">Any</option>
                            <optgroup label="Category">
                            <c:forEach items="${a.getSettingByType('category')}" var="x">
                                <option  ${temp==x.settingValue ?"selected":""} value="cat${x.settingValue}">${x.settingValue}</option>
                            </c:forEach> 
                        </optgroup>
                        <optgroup label="Level">
                            <option ${temp=='Easy' ?"selected":""} value="levelEasy">Easy</option>
                            <option ${temp=='Medium' ?"selected":""} value="levelMedium">Medium</option>
                            <option ${temp=='Hard' ?"selected":""} value="levelHard">Hard</option>
                        </optgroup >
                        <optgroup label="Status">
                            <option ${temp=='Unpublished' ?"selected":""} value="statusUnpublished">Unpublish</option>
                            <option ${temp=='Published' ?"selected":""} value="statusPublished">Publish</option>
                        </optgroup>
                    </select>
                </div>
                <script type="text/javascript">
                    function getSub() {
                        var e = document.getElementById("1");
                        var condition = 'condition=' + e.options[e.selectedIndex].value;
                        httpRequest = new XMLHttpRequest();
                        httpRequest.open('POST', 'QuestionPaging');
                        httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                        httpRequest.send(condition);
                        document.getElementById("myForm").submit();
                    }
                    function getSub1() {
                        var e = document.getElementById("2");
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

                    function getSub2() {
                        var e = document.getElementById("subject");
                        var condition = e.options[e.selectedIndex].value;
                        $.ajax({
                            url: "/Project/getQuizBySubject",
                            type: 'POST',
                            data: {
                                subject: condition
                            },
                            success: function (data) {
                                var a = document.getElementById("3");
                                quiz.innerHTML = data;
                            }, error: function (jqXHR, textStatus, errorThrown) {

                            }
                        });
                    }
                </script>
                <div  class="col-3">
                    <select class="form-control here" name="condition2" style="height: 40px">
                        <option value="Any">Any</option>
                        <optgroup label="Subcategory">
                            <c:forEach items="${subcat}" var="x">
                                <option ${temp2==x.settingValue ?"selected":""} value="subcat${x.settingValue}">${x.settingValue}</option>                                
                            </c:forEach>
                        </optgroup>
                        <optgroup label="Subject">
                            <c:forEach items="${lsb}" var="x">
                                <option ${condition2==x.settingValue ?"selected":""} value="subject${x.settingValue}">${x.settingValue}</option>                                
                            </c:forEach>
                        </optgroup>
                    </select>
                </div>
                <div class="col-5">
                    <input class="form-control here" type="text" value="${search}" name="search">
                </div>
                <div class="col-1">
                    <input class="btn btn-primary"  type="submit" value="enter" style="height: 40px ;width:60px ">
                </div>
            </div>
        </form>

        <table class="table table-striped table-dark">
            <tr>
                <th>Id</th>
                <th>Content</th>
                <th>Category</th>
                <th>Sub Category</th>
                <th>Level</th>   
                <th>Status</th> 

            </tr>
            <c:forEach items="${list}" var="x">
                <tr>
                    <td>${x.qId}</td>
                    <td>${x.content}</td>
                    <td>${x.category}</td>
                    <td>${x.subcategory}</td>
                    <td>${x.level}</td>
                    <td>${x.status}</td>
                    <td>
                        <a href="QuestionDetail?qId=${x.qId}&op=view">View</a>
                        &nbsp;&nbsp;
                        <c:if test="${x.status == 'Published'}">
                            <a href="QuestionControl?qId=${x.qId}&op=deactivate">Unpublish</a>
                        </c:if>
                        <c:if test="${x.status == 'Unpublished'}">
                            <a href="QuestionControl?qId=${x.qId}&op=activate">Publish</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>

        </table>
        <div>${x}</div>
        <div>${y}</div>
        <nav aria-label="Pages">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a a class="page-link" href="${url}1&condition=${condition}&condition2=${condition2}&search=${search}" >|<<</a>
                </li>
                <c:forEach begin="${start}" end="${finish}" var="i">            
                    <li class="page-item">
                        <a a class="page-link" href="${url}${i}&condition=${condition}&condition2=${condition2}&search=${search}" >${i}</a>
                    </li>
                </c:forEach>        
                <li class="page-item">
                    <a a class="page-link" href="${url}${end}&condition=${condition}&condition2=${condition2}&search=${search}" >>>|</a>
                </li>
            </ul>
        </nav>
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
                                <div class="form-group row">
                                    <label class="col-4 col-form-label ">Subject</label>
                                    <div class="col-8">
                                        <select onchange="getSub2()" class="form-control here" id="subject" name="subject" style="height: 40px" required>
                                            <c:forEach items="${bc.byStatus}" var="x">
                                                <option  value="${x.id}">${x.title}</option>
                                            </c:forEach> 
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-4 col-form-label ">Quiz</label>
                                    <div class="col-8">
                                        <select class="form-control here" id="quiz" name="quiz" style="height: 40px" required> 
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-4 col-form-label ">Category</label>
                                    <div class="col-8">
                                        <select onchange="getSub1()" class="form-control here"  id="2" name="ques_cate" style="height: 40px" required>
                                            <c:forEach items="${a.getSettingByType('category')}" var="x">
                                                <option value="${x.settingValue}">${x.settingValue}</option>
                                            </c:forEach> 
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-4 col-form-label">Subcategory</label>
                                    <div class="col-8">
                                        <select onclick="getSub1()" class="form-control here" id="sub" name="ques_subcate" style="height: 40px" required>
                                        </select>
                                    </div>
                                </div>                             
                            </div>                            
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
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>

    </body>
</html>
