<%-- 
    Document   : QuestionDetail
    Created on : Oct 9, 2021, 5:24:14 PM
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
                                        <h4>Question Detail</h4>
                                        <hr>
                                    </div>
                                </div>
                                <form id="myForm" action="QuestionDetail" style="margin-bottom: 20px;margin-top: 10px;" method="POST">
                                    <input type="number" value="${i}" name="i" readonly hidden>
                                <input type="text" name="qId" value="${question.qId}" readonly hidden>

                                <div class="form-group row">
                                    <label class="col-4 col-form-label">Subject</label> 
                                    <div class="col-8">
                                        <input type="text" placeholder="Subject" name="subject" value="${question.subject}" class="form-control here">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-4 col-form-label">Subject</label> 
                                    <div class="col-8">
                                        <select onchange="getSub()" class="form-control here"  id="1" name="condition" style="height: 40px">
                                            <option value="">Any</option>
                                            <c:forEach items="${a.getSettingByType('quiz_category')}" var="x">
                                                <option  ${condition==x.settingValue ?"selected":""} value="${x.settingValue}">${x.settingValue}</option>
                                            </c:forEach> 
                                        </select>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    function getSub() {
                                        var e = document.getElementById("1");
                                        var condition = 'condition=' + e.options[e.selectedIndex].text;
                                        httpRequest = new XMLHttpRequest();
                                        httpRequest.open('POST', 'QuestionDetail');
                                        httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                                        httpRequest.send(condition);
                                        document.getElementById("myForm").submit();
                                    }
                                </script>
                                <div class="form-group row">
                                    <label class="col-4 col-form-label">Subject</label> 
                                    <div  class="col-8">
                                        <select class="form-control here" name="condition2" style="height: 40px">
                                            <option value="">Any</option>
                                            <c:forEach items="${subcat}" var="x">
                                                <option ${condition2==x.settingValue ?"selected":""} value="${x.settingValue}">${x.settingValue}</option>                                
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-4 col-form-label">Level</label> 
                                    <div class="col-8">
                                        <select class="form-control here"  name="level">
                                            <option value="Easy" ${currentlevel=='Easy' ? "selected":""} >Easy</option>
                                            <option value="Medium" ${currentlevel=='Medium' ? "selected":""} >Medium</option>
                                            <option value="Hard"  ${currentlevel=='Hard' ? "selected":""} >Hard</option>
                                        </select>
                                    </div>
                                </div> 

                                <div class="form-group row">
                                    <label class="col-4 col-form-label">Status</label> 
                                    <div class="col-8">
                                        <select class="form-control here"  name="status">
                                            <option value="Unpublished" ${currentstatus=='Unpublished' ? "selected":""} >Unpublished</option>
                                            <option value="Published" ${currentstatus=='Published' ? "selected":""}>Published</option>
                                        </select>
                                    </div>
                                </div>  
                                <div class="form-group row">
                                    <label class="col-4 col-form-label">Quiz</label> 
                                    <div class="col-8">
                                        <input placeholder="Quiz" class="form-control here" type="text" name="quiz" value="${question.quiz}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-4 col-form-label">Content</label> 
                                    <font color = "red">${errorcontent}</font>
                                    <div class="col-8">
                                        <textarea name="content" class="form-control here">${question.content}</textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-4 col-form-label">Media</label>                                    
                                    <div class="col-8">
                                        <font color = "red">${errormedia}</font>
                                        <input placeholder="Enter your media share here" class="form-control here" type="text" name="media">
                                                <p  class="form-group row">${question.media}<p>
                                    </div>
                                    
                                </div>
                                    
                                <div class="form-group row">
                                    <label class="col-4 col-form-label">Explanation</label> 
                                    <font color = "red">${errorexplanation}</font>
                                    <div class="col-8">
                                        <input placeholder="Explanation" class="form-control here" type="text" name="explanation"value="${question.explanation}">
                                    </div>
                                </div>

                                <c:forEach items="${list}" var="x">
                                    <div class="row">
                                        <div class="col-8">
                                            <input class="form-control here" type="text" name="answer" value="${x.answer}">
                                        </div>
                                        <div class="col-2">
                                            <select class="form-control here" name="key">
                                                <option value="1" ${x.key==1 ? "selected":""} >True</option>
                                                <option value="0" ${x.key==0 ? "selected":""} >False</option>
                                            </select>
                                        </div>
                                        <div class="col-2">
                                            <a class="btn btn-primary" href="QuestionDetail?op=delete&content=${x.answer}&qId=${x.qId}">Delete</a>
                                        </div>
                                    </div>
                                </c:forEach>
                                <c:forEach begin="1" end="${i}">
                                    <div class="row">
                                        <div class="col-8">
                                            <input class="form-control here" type="text" name="answer">
                                        </div>
                                        <div class="col-2">
                                            <select class="form-control here" name="key">
                                                <option value="1" >True</option>
                                                <option value="0">False</option>
                                            </select>
                                        </div>
                                        <div class="col-2">
                                            <a class="btn btn-primary" href="QuestionDetail?op=removeanswer&i=${i}">Delete</a>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="form-group row">
                                    <div class="offset-4 col-12">
                                        <a class="btn btn-primary" href="QuestionDetail?op=addanswer&i=${i}">Add</a>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="offset-4 col-8">
                                        <input class="btn btn-primary"  type="submit" value="Update">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!--        <div class="container">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h4>Question Detail</h4>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <form id="myForm" action="QuestionDetail" style="margin-bottom: 20px;margin-top: 10px;" method="POST">
                                                <input type="number" value="${i}" name="i" readonly hidden>
                                                <input type="text" name="qId" value="${question.qId}" readonly hidden>
                                                <div class="form-group row">
                                                    <label class="col-4 col-form-label">Subject</label> 
                                                    <div class="col-8">
                                                        <input type="text" placeholder="Subject" name="subject" value="${question.subject}" class="form-control here">
                                                    </div>
                                                </div> 
                                                <div class="form-group row">
                                                    <div class="col-3">
                                                        <select onchange="getSub()" class="form-control here"  id="1" name="condition" style="height: 40px">
                                                            <option value="">Any</option>
        <c:forEach items="${a.getSettingByType('quiz_category')}" var="x">
            <option  ${condition==x.settingValue ?"selected":""} value="${x.settingValue}">${x.settingValue}</option>
        </c:forEach> 
    </select>
</div>
</div>
<script type="text/javascript">
function getSub() {
    var e = document.getElementById("1");
    var condition = 'condition=' + e.options[e.selectedIndex].text;
    httpRequest = new XMLHttpRequest();
    httpRequest.open('POST', 'QuestionDetail');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    httpRequest.send(condition);
    document.getElementById("myForm").submit();
}
</script>
<div class="form-group row">
<div  class="col-3">
    <select class="form-control here" name="condition2" style="height: 40px">
        <option value="">Any</option>
        <c:forEach items="${subcat}" var="x">
            <option ${condition2==x.settingValue ?"selected":""} value="${x.settingValue}">${x.settingValue}</option>                                
        </c:forEach>
    </select>
</div>
</div>
<div class="form-group row">
<label class="col-4 col-form-label">Level</label> 
<div class="col-8">
    <select class="form-control here"  name="level">
        <option value="Easy" >Easy</option>
        <option value="Medium">Medium</option>
        <option value="Hard" >Hard</option>
    </select>
</div>
</div> 

<div class="form-group row">
<label class="col-4 col-form-label">Status</label> 
<div class="col-8">
    <select class="form-control here"  name="status">
        <option value="Unpublished" >Unpublished</option>
        <option value="Published">Published</option>
    </select>
</div>
</div>  
<div class="form-group row">
<label class="col-4 col-form-label">Quiz</label> 
<div class="col-8">
    <input placeholder="Quiz" class="form-control here" type="text" name="quiz" value="${question.quiz}">
</div>
</div>
<div class="form-group row">
<label class="col-4 col-form-label">Content</label> 
<font color = "red">${errorcontent}</font>
<div class="col-8">
    <textarea name="content" class="form-control here">${question.content}</textarea>
</div>
</div>
<div class="form-group row">
<label class="col-4 col-form-label">Media</label> 
<font color = "red">${errormedia}</font>
<div class="col-8">
    <input placeholder="Media" class="form-control here" type="text" name="media"value="${question.media}">
</div>
</div>
<div class="form-group row">
<label class="col-4 col-form-label">Explanation</label> 
<font color = "red">${errorexplanation}</font>
<div class="col-8">
    <input placeholder="Explanation" class="form-control here" type="text" name="explanation"value="${question.explanation}">
</div>
</div>

        <c:forEach items="${list}" var="x">
            <div class="row">
                <div class="col-8">
                    <input class="form-control here" type="text" name="answer" value="${x.answer}">
                </div>
                <div class="col-2">
                    <select class="form-control here" name="key">
                        <option value="1" >True</option>
                        <option value="0">False</option>
                    </select>
                </div>
                <div class="col-2">
                    <a class="btn btn-primary" href="QuestionDetail?op=delete&content=${x.answer}&qId=${x.qId}">Delete</a>
                </div>
            </div>
        </c:forEach>
        <c:forEach begin="1" end="${i}">
            <div class="row">
                <div class="col-8">
                    <input class="form-control here" type="text" name="answer">
                </div>
                <div class="col-2">
                    <select class="form-control here" name="key">
                        <option value="1" ${x.key==1 ? "selected":""}>True</option>
                        <option value="0" selected="selected">False</option>
                    </select>
                </div>
                <div class="col-2">
                    <a class="btn btn-primary" href="QuestionDetail?op=removeanswer&i=${i}">Delete</a>
                </div>
            </div>
        </c:forEach>
        <div class="form-group row">
            <div class="offset-4 col-12">
                <a class="btn btn-primary" href="QuestionDetail?op=addanswer&i=${i}">Add</a>
            </div>
        </div>
        <div class="form-group row">
            <div class="offset-4 col-8">
                <input class="btn btn-primary"  type="submit" value="enter" style="height: 40px ;width:60px ">
            </div>
        </div>
    </form>

</div>
</div>
</div>
</div>
</div>
</div>-->
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
    </div>
</body>
</html>
