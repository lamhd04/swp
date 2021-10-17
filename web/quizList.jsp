<%-- 
    Document   : quizList
    Created on : Oct 17, 2021, 3:22:00 PM
    Author     : Nhat Anh PC
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
        <form action="QuizListServlet" style="margin-bottom: 20px;margin-top: 10px;">

            <select name="order" style="height: 40px ;">
                <option value="Asc">ASC</option>
                <option value="desc">DESC</option>
            </select>

            <select name="col" style="height: 40px">
                <option value="quizId">ID</option>
                <option value="title">Name</option>
                <option value="category">email</option>
            </select>
            <select name="subject" style="height: 40px">
                <option value="">Subject</option>
                <option value="math">Math</option>
                <option value="program">Programming</option>                
            </select>
            <select name="category" style="height: 40px">
                <option value="">Category</option>
                <option value="c++ program">c++</option>
                <option value="advanced math">advanced math</option>
                <option value="OOP with Java">OOP with Java</option>
            </select>
            <select name="type" style="height: 40px">
                <option value="">Type</option>
                <option value="free test">free test</option>
                <option value="simulation test">simulation test</option>
                <option value="user practice">user practice</option>
            </select>
            <input type="text" placeholder="search for title" name ="title" style="height: 40px ;width:120px ">
            <input type="submit" value="Enter" style="height: 40px ;width:60px ">
            <a href="AddQuiz.jsp">Add new</a>
        </form>
        <section class="latest_news_2" id="latest_news_style_2">
            <div class="container">
                <div class="row">
                    <c:forEach items="${qList}" var="x">
                        <div class="col-12 col-sm-6 col-md-4 col-lg-4">
                            <div class="single_item">
                                <div class="item_wrapper">
                                    <div class="blog-img">
                                        <a href="QuizControl?quizId=${x.quizId}&op=view" title=""><img src="images/courses/courses_1.jpg" alt="" class="img-fluid"></a>
                                    </div>
                                    <h3><a href="QuizControl?quizId=${x.quizId}&op=view" title="">${x.title}</a></h3> 
                                </div>
                                <div class="blog_title">
                                    <ul class="post_bloger">
                                        <li><i class="fas fa-user"></i>${x.expert}</li> 
                                        <li><i class="fas fa-comment"></i>${x.category}</li>
                                        <li><i class="fas fa-thumbs-up"></i> ${x.level}</li>
                                    </ul>               
                                </div> 
                            </div>
                        </div>            
                    </c:forEach>
                </div>
            </div>
        </section>
        <ul class="pagination justify-content-center">
            <li class="page-item">
                <a a class="page-link" href="QuizListServlet?index=1&order=${order}&col=${col}&subject=${subject}&category=${category}&type=${type}&title=${title}" >|<<</a>
            </li>
            <c:forEach begin="${x}" end="${y}" var="i">            
                <li class="page-item">
                    <a a class="page-link" href="QuizListServlet?index=${i}&order=${order}&col=${col}&subject=${subject}&category=${category}&type=${type}&title=${title}" >${i}</a>
                </li>
            </c:forEach>        
            <li class="page-item">
                <a a class="page-link" href="QuizListServlet?index=${endPage}&order=${order}&col=${col}&subject=${subject}&category=${category}&type=${type}&title=${title}" >>>|</a>
            </li>
        </ul>
            <jsp:include page="Footer.jsp" flush="true"></jsp:include>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    </body>
</html>

