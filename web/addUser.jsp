<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                <!-- Username -->
                <label>Tên đăng nhập:</label>
                <input type="text" name="username" required>

                <!-- PasswordHash -->
                <label>Mật khẩu:</label>
                <input type="password" name="password" required>

                <!-- FullName -->
                <label>Họ và tên:</label>
                <input type="text" name="fullName" required>

                <!-- Email -->
                <label>Email:</label>
                <input type="email" name="email" required>

                <!-- Role -->
                <label>Vai trò:</label>
                <select name="role" required>
                    <option value="">-- Chọn vai trò --</option>
                    <option value="Admin">Quản trị</option>
                    <option value="Customer">Khách hàng</option>
                    <option value="Staff">Nhân viên</option>
                    <option value="Shipper">Shipper</option>
                    <option value="Manager">Quản lý</option>
                </select>

                <!-- Gender -->
                <label>Giới tính:</label>
                <select name="gender" required>
                    <option value="">-- Chọn giới tính --</option>
                    <option value="Nam">Nam</option>
                    <option value="Nữ">Nữ</option>
                    <option value="Other">Khác</option>
                </select>

                <!-- PhoneNumber -->
                <label>Số điện thoại:</label>
                <input type="text" name="phoneNumber" required pattern="0\d{9}" title="Số điện thoại phải bắt đầu bằng số 0 và gồm 10 chữ số">




                <!-- Address -->
                <label>Địa chỉ:</label>
                <input type="text" name="address" required>

                <!-- DOB -->
                <label>Ngày sinh:</label>
                <input type="date" name="dob" required>

                <!-- CreatedAt: sẽ được server tự thêm -->
                <button type="submit" class="submit-btn">Thêm người dùng</button>
            </form>

            <a class="back-link" href="user-list">← Quay lại danh sách người dùng</a>
        </div>
    </body>
</html>
