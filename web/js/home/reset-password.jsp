<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đặt lại mật khẩu</title>
    <style>
        body { font-family: Arial; background-color: #f0f8ff; padding: 50px; }
        .form-container {
            width: 400px; margin: auto; padding: 20px;
            background-color: white; border-radius: 10px; box-shadow: 0 0 10px gray;
        }
        input[type=password], input[type=submit] {
            width: 100%; padding: 10px; margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Đặt lại mật khẩu</h2>
        <form action="ResetPasswordServlet" method="post">
            <input type="hidden" name="token" value="<%= request.getParameter("token") %>">
            <label>Mật khẩu mới:</label>
            <input type="password" name="newPassword" required>
            <input type="submit" value="Xác nhận đặt lại mật khẩu">
        </form>
    </div>
</body>
</html>
