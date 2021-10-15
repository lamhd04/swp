<%-- 
    Document   : newjsp
    Created on : Oct 12, 2021, 5:52:25 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Javascript Example</title>
    </head>
    <body>
        <h2>Chọn giới tính</h2>
        <p>In ra thông báo khi giới tính được thay đổi </p>
        <select id="gender" onchange="genderChanged(this)">
            <option value=""> -- Chọn -- </option>
            <option value="nam">Nam</option>
            <option value="nu"> Nữ </option>
        </select>
        <p style="color: red" id="show_message"></p>
        <script language="javascript">
            // Hàm xử lý khi thẻ select thay đổi giá trị được chọn
            // obj là tham số truyền vào và cũng chính là thẻ select
            function genderChanged(obj)
            {
                var message = document.getElementById('show_message');
    var value = obj.value;
    if (value === ''){
        message.innerHTML = "Bạn chưa chọn giới tính";
    }
    else if (value === 'nam'){
        message.innerHTML = "Bạn đã chọn giới tính nam";
    }
    else if (value === 'nu'){
        message.innerHTML = "Bạn đã chọn giới tính nữ";
    } 
            }
 
        </script>
    </body>
</html>