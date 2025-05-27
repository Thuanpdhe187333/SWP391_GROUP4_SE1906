<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đổi mật khẩu</title>
    <style>
        body { font-family: Arial; background-color: #f4ffe6; padding: 50px; }
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
        <h2>Đổi mật khẩu</h2>
        <form action="change-password" method="post">
            <label>Mật khẩu hiện tại:</label>
            <input type="password" name="currentPassword" required>
            <label>Mật khẩu mới:</label>
            <input type="password" name="newPassword" required>
            <input type="submit" value="Đổi mật khẩu">
        </form>
    </div>
</body>
</html>
