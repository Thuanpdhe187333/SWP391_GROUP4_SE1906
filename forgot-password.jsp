<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Quên mật khẩu</title>
    <style>
        body { 
            font-family: Arial; 
            background-color: pink; 
            padding: 50px; 
        }
        .form-container {
            width: 400px; margin: auto; padding: 20px;
            background-color: white; border-radius: 10px; box-shadow: 0 0 10px gray;
        }
        input[type=email], input[type=submit] {
            width: 100%; padding: 10px; margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Quên mật khẩu</h2>
        <form action="forgot-password" method="post">
            <label>Nhập email của bạn:</label>
            <input type="email" name="email" required>
            <input type="submit" value="Gửi liên kết đặt lại mật khẩu">
        </form>
    </div>
</body>
</html>
