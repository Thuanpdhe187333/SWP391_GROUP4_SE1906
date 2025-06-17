<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Người Dùng</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #fff0f5;
            margin: 0;
            padding: 0;
        }

        .form-container {
            width: 480px;
            margin: 60px auto;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(255, 192, 203, 0.3);
            padding: 30px;
        }

        .form-container h2 {
            text-align: center;
            color: #cc3366;
            margin-bottom: 20px;
        }

        label {
            font-weight: 500;
            color: #cc3366;
            margin-top: 12px;
            display: block;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ffb6c1;
            border-radius: 8px;
            margin-top: 5px;
            box-sizing: border-box;
            background-color: #fff8fa;
        }

        input:focus, select:focus {
            border-color: #ff69b4;
            outline: none;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: #ff69b4;
            color: white;
            border: none;
            border-radius: 8px;
            margin-top: 20px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #ff1493;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #cc3366;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Thêm Người Dùng</h2>

        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

        <form action="addUser" method="post">
            <label>Tên đăng nhập:</label>
            <input type="text" name="username" required>

            <label>Họ và tên:</label>
            <input type="text" name="fullName" required>

            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Vai trò:</label>
            <select name="role" required>
                <option value="">-- Chọn vai trò --</option>
                <option value="Customer">Khách hàng</option>
                <option value="Staff">Nhân viên</option>
                <option value="Admin">Quản trị</option>
            </select>

            <label>Giới tính:</label>
            <select name="gender" required>
                <option value="">-- Chọn giới tính --</option>
                <option value="Female">Nam</option>
                <option value="Male">Nữ</option>
                <option value="Other">Other</option>
            </select>

            <label>Số điện thoại:</label>
            <input type="text" name="phoneNumber" required pattern="\\d{9,12}" title="Số điện thoại từ 9 đến 12 chữ số">

            <label>Địa chỉ:</label>
            <input type="text" name="address" required>

            <label>Ngày sinh:</label>
            <input type="date" name="dob" required>

            <button type="submit" class="submit-btn">Thêm người dùng</button>
        </form>

        <a class="back-link" href="user-list">← Quay lại danh sách người dùng</a>
    </div>
</body>
</html>
