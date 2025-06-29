<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Xác Thực OTP</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f9f9f9;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #FF69B4;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #C14489;
        }
        .message {
            text-align: center;
            margin-bottom: 15px;
            color: red;
        }
            .back-button {
                background-color: #FF69B4;
                color: white;
                border: none;
                padding: 8px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                position: absolute;
                top: 10px;
                right: 10px;
                cursor: pointer;
                border-radius: 4px;
            }
            .back-button:hover {
                background-color: #C14489;
            }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Xác Thực OTP</h2>
        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <p class="message"><%= message %></p>
        <% } %>
        <form action="VerifyOtpServlet" method="post">
            <label for="otp">Nhập OTP:</label>
            <input type="text" id="otp" name="otp" required>
            <input type="submit" value="Xác Thực">
        </form>
        <a href="forgot_password.jsp" class="back-button">Quay lại</a>
    </div>
</body>
</html>
