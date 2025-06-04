<%-- 
    Document   : StaffList
    Created on : Jun 4, 2025, 12:08:11 AM
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách nhân viên</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #fff0f5;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #d63384;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #f8c1d1;
            text-align: center;
        }

        th {
            background-color: #ff69b4;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #fff6f9;
        }

        tr:hover {
            background-color: #ffe0ec;
        }
    </style>
</head>
<body>
    <h2>Danh sách nhân viên</h2>
    <table>
        <thead>
            <tr>
                <th>Mã NV</th>
                <th>Họ tên</th>
                <th>Chức vụ</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>NV001</td>
                <td>Nguyễn Thị Hoa</td>
                <td>Quản lý</td>
                <td>hoa@example.com</td>
            </tr>
            <tr>
                <td>NV002</td>
                <td>Trần Văn An</td>
                <td>Nhân viên bán hàng</td>
                <td>an@example.com</td>
            </tr>
            <tr>
                <td>NV003</td>
                <td>Lê Minh Tuấn</td>
                <td>Nhân viên kho</td>
                <td>tuan@example.com</td>
            </tr>
        </tbody>
    </table>
</body>
</html>
