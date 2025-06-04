<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Giao hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff0f5;
            margin: 0;
            padding: 30px;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(255, 105, 180, 0.2);
        }

        h2 {
            color: #d63384;
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            border: 1px solid #ffcce6;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #f8bbd0;
            color: white;
        }

        td select {
            padding: 5px;
            border-radius: 6px;
        }

        .btn {
            padding: 6px 12px;
            background-color: #ff66b2;
            border: none;
            color: white;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #e60073;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Quản Lý Giao Hàng</h2>

        <table>
            <tr>
                <th>Mã Đơn</th>
                <th>Khách Hàng</th>
                <th>Địa Chỉ</th>
                <th>Trạng Thái</th>
                <th>Hành Động</th>
            </tr>

            <c:forEach var="order" items="${orders}">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.customerName}</td>
                    <td>${order.address}</td>
                    <td>
                        <form method="post" action="ship">
                            <input type="hidden" name="id" value="${order.id}" />
                            <select name="status">
                                <option value="Chờ xác nhận" ${order.status == 'Chờ xác nhận' ? 'selected' : ''}>Chờ xác nhận</option>
                                <option value="Đang giao" ${order.status == 'Đang giao' ? 'selected' : ''}>Đang giao</option>
                                <option value="Đã giao" ${order.status == 'Đã giao' ? 'selected' : ''}>Đã giao</option>
                                <option value="Đã hủy" ${order.status == 'Đã hủy' ? 'selected' : ''}>Đã hủy</option>
                            </select>
                    </td>
                    <td>
                        <button class="btn" type="submit">Cập nhật</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
