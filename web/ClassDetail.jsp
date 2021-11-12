<%-- 
    Document   : Home
    Created on : Sep 16, 2021, 8:09:30 PM
    Author     : HaGau
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class DETAIL</title>
        <noscript>Your browser does not support JavaScript!</noscript>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <style>
            .carousel .item{
                height: 300px
            }
            @media (min-width: 768px){
                .container{margin-top: 10px}
            }
            form{
                display: block;
                text-align: center;
                margin-top: 8px;
                margin-bottom: 25px;
                color: black
            }
            button {
                padding: 7px 4px;
                font-size: 20px;
                border: 1px solid #999999;
            }
            table{
                margin-top: 10px;
                font-size: 22px;
                width: 90%;
                margin: 0 auto;
            }
            input,select{
                border: none;
                margin: 0 auto;
                width: 60%;
                color: black;
                padding: 5px 0px;
            }
            table tr td:first-child{
                text-align: right;
                padding: 8px 0px;
                padding-right: 20px;
            }
            table tr td:last-child{
                text-align: left;
                padding: 8px 0px;
            }

        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp" flush="true">
            <jsp:param name="active" value="class"/>
        </jsp:include>
        <c:if test="${msg !=null && msg !=''}">
            <script type="text/javascript">
                alert("Edit success !");
            </script>
        </c:if>
        <div class="container-fluid" style="width: 95%">
            <br>
            <h4>>> CLASS DETAIL: </h4>
            <form id="form" action="${pageContext.request.contextPath}/class/detail" method="POST" >
                <table>
                    <thead>
                        <tr>
                            <th style="width: 4%"></th>
                            <th style="width: 20%"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>ID:</td>
                            <td><input type="text" name="id" value="${data.getId()}" readonly/></td>

                        </tr>  
                        <tr>
                            <td>CLASS NAME:</td>
                            <td><input type="text" name="className" value="${data.getClassName()}" readonly/></td>

                        </tr>  
                        <tr>
                            <td>OWNER:</td>
                            <td><select id="ownerSelect" name="owner" disabled>
                                    <c:forEach var="item" items="${teachers}">
                                        <option value="${item.getUserId()}" ${item.getUserId() == data.getOwnerId() ? 'selected': ''} style="color:green" >${item.getFullname()}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>  
                        <tr>
                            <td>STATUS:</td>
                            <td><select id="statusSelect" name="status" disabled>
                                    <option value="Started" ${data.getStatus() == 'Started' ? 'selected' :''} style="color:green" >Started</option>
                                    <option value="NStarted" ${data.getStatus() == 'NStarted' ? 'selected' :''}  style="color:gray" >Not Started</option>
                                </select></td>

                        </tr> 
                        </fieldset>
                        <tr>
                            <td>NUMBER OF USER(s):</td>
                            <td>${data.getNumberOfUser()}
                                <a  href="${pageContext.request.contextPath}/class/edit-user?classId=${data.getId()}" id="changeStudent" style="visibility: visible; background-color: white; border: none;color:#007bff;" >Add Or Remove</a></td>
                        </tr> 
                        <tr>
                            <td>NUMBER OF SUBJECT(s):</td>
                            <td>${data.getNumberOfSubject()}
                                <a href="${pageContext.request.contextPath}/class/edit-subject?classId=${data.getId()}" id="changeSubject" style="visibility: visible; background-color: white; border: none;color:#007bff;">Add Or Remove</a></td>
                        </tr> 
                    </tbody>
                </table>
                <br>
            </form>
            <div style="margin: 0 auto; text-align: center">
                <button class="btn btn-primary" id="button" onclick="editBtn(event, ''); return false;" value="none" style="padding: 10px 50px; font-size: 25px">Edit</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <a class="btn btn-success" id="buttonAdd" href="${pageContext.request.contextPath}/class/add" onclick="editBtn(event, 'true')" style="padding: 10px 50px; font-size: 25px;color: white">Add</a>
            </div>
        </div>
        <br><br>
        <jsp:include page="Footer.jsp" flush="true"></jsp:include>
            <script type="text/javascript">
                editBtn(null, "reload");
                var currentId = '${data.getId()}';
                var currentClassName = '${data.getClassName()}';
                var currentStatus = '${data.getStatus()}';
                function editBtn(event, isClickCancel) {

                    var btn = document.getElementById("button");
                    var btnAdd = document.getElementById("buttonAdd");
                    var currentBtnAddText = btnAdd.textContent;
                    //init  
                    if (isClickCancel === "reload") {
                        return;
                    }
                    //submit
                    if (btn.textContent === 'Submit' && isClickCancel === '') {
                        $('#form').submit();
                        return;
                    }
                    if (btn.textContent === "Edit") {
                        displayInputBorder(true);
                        btn.innerHTML = "Submit";
                        btnAdd.innerHTML = "Cancel";
                        btnAdd.classList.add('btn-danger');
                        btnAdd.classList.remove('btn-success');
                        document.getElementById("changeStudent").style.visibility = "hidden";
                        document.getElementById("changeSubject").style.visibility = "hidden";
                        $('#form :input').prop('readonly', false);
                        $('#statusSelect').prop('disabled', false);
                        $('#ownerSelect').prop('disabled', false);
                    } else {
                        document.getElementById("changeStudent").style.visibility = "visible";
                        document.getElementById("changeSubject").style.visibility = "visible";
                        displayInputBorder(false);
                        btn.innerHTML = "Edit";
                        btnAdd.innerHTML = "Add";
                        btnAdd.classList.add('btn-success');
                        btnAdd.classList.remove('btn-danger');
                        $('#form :input').prop('readonly', true);
                        $('#statusSelect').prop('disabled', true);
                        $('#ownerSelect').prop('disabled', true);
                    }

                    if (currentBtnAddText === 'Cancel') {
                        btnAdd.href = "#";
                        return false;
                    } else {
                        btnAdd.href = '${pageContext.request.contextPath}/class/add';
                    }
                }
                function displayInputBorder(change) {
                    var elements = document.forms["form"].getElementsByTagName("input");
                    var selectTag = document.getElementById("statusSelect");
                    selectTag.style.border = (change === true ? "1px solid black" : "none");
                    var selectOwner = document.getElementById("ownerSelect");
                    selectOwner.style.border = (change === true ? "1px solid black" : "none");
                    for (const child of elements) {
                        child.style.border = (change === true ? "1px solid black" : "none");
                    }
                }

        </script>
    </body>
</html>
