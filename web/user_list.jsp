<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách người dùng</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #fff0f5;
            color: #333;
            margin: 30px;
        }

        h2 {
            color: #d63384;
            margin-bottom: 20px;
        }

        .top-bar {
            margin-bottom: 20px;
        }

        .top-bar a {
            padding: 10px 16px;
            background-color: #f8bbd0;
            color: #880e4f;
            text-decoration: none;
            font-weight: bold;
            border-radius: 8px;
            border: 1px solid #f48fb1;
        }

        .top-bar a:hover {
            background-color: #f48fb1;
            color: white;
        }

        .action-btn {
            display: inline-block;
            padding: 6px 10px;
            margin: 4px 3px;
            text-decoration: none;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 500;
        }

        .btn-view {
            background-color: #f3e5f5;
            color: #6a1b9a;
            border: 1px solid #ce93d8;
        }

        .btn-edit {
            background-color: #e3f2fd;
            color: #1565c0;
            border: 1px solid #90caf9;
        }

        .btn-reject {
            background-color: #ffebee;
            color: #c62828;
            border: 1px solid #ef9a9a;
        }

        .btn-delete {
            background-color: #fbe9e7;
            color: #d84315;
            border: 1px solid #ffab91;
        }

        .btn-view:hover {
            background-color: #e1bee7;
        }

        .btn-edit:hover {
            background-color: #bbdefb;
        }

        .btn-reject:hover {
            background-color: #ffcdd2;
        }

        .btn-delete:hover {
            background-color: #ffccbc;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 8px rgba(214, 51, 132, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            border: 1px solid #f8d7e9;
            padding: 12px 10px;
            text-align: left;
        }

        th {
            background-color: #ffe6f0;
            color: #d63384;
        }

        tr:nth-child(even) {
            background-color: #fff5fa;
        }

        tr:hover {
            background-color: #ffe0ec;
        }

        .error-msg {
            color: red;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<h2>👩‍🦰 Danh sách tài khoản người dùng</h2>

<div class="top-bar">
    <a href="addUser">➕ Thêm người dùng</a>
</div>

<c:if test="${not empty error}">
    <p class="error-msg">${error}</p>
</c:if>

<table>
    <thead>
        <tr>
            <th>Mã người dùng</th>
            <th>Tên đăng nhập</th>
            <th>Họ và tên</th>
            <th>Email</th>
            <th>Vai trò</th>
            <th>Giới tính</th>
            <th>Điện thoại</th>
            <th>Địa chỉ</th>
            <th>Ngày sinh</th>
            <th>Ngày tạo</th>
            <th>Thao tác</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.userId}</td>
                <td>${user.username}</td>
                <td>${user.fullName}</td>
                <td>${user.email}</td>
                <td>${user.role}</td>
                <td>${user.gender}</td>
                <td>${user.phoneNumber}</td>
                <td>${user.address}</td>
                <td><fmt:formatDate value="${user.dob}" pattern="yyyy-MM-dd" /></td>
                <td><fmt:formatDate value="${user.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td>
                    <a class="action-btn btn-view" href="viewUser?id=${user.userId}">👁️ Xem</a>
                    <a class="action-btn btn-edit" href="editUser?id=${user.userId}">✏️ Sửa</a>
                    <a class="action-btn btn-reject" href="rejectUser?id=${user.userId}" onclick="return confirm('Từ chối người dùng này?');">❌ Từ chối</a>
                    <a class="action-btn btn-delete" href="deleteUser?id=${user.userId}" onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này?');">🗑️ Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
