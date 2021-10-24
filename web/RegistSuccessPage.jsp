<html>
    <head>
        <meta charset="utf-8">
        <title>RegistrationForm_v1 by Colorlib</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- MATERIAL DESIGN ICONIC FONT -->
        <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

        <!-- STYLE CSS -->
        <link rel="stylesheet" href="css/style1.css">
    </head>

    <body>

        <div class="wrapper" style="background-image: url('images/banner/banner_2.jpg');">


        </div>

    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
    <c:if test = "${verifyed != null}">
        <script type="text/javascript">
            alert("SignUp Successfull !. Please Check your email for confirmation");
            location.href = "${pageContext.request.contextPath}/Login.jsp";

        </script>
    </c:if>
</html>