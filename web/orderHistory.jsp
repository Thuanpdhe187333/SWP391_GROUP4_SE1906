
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lịch sử đơn hàng</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 20px;
            font-family: Arial, sans-serif;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .order-header {
            background-color: #f2f2f2;
            padding: 10px;
            text-align: left;
            font-weight: bold;
        }
        .total-row {
            background-color: #e6f3ff;
            font-weight: bold;
        }
        img.product-image {
            width: 50px;
            height: 50px;
            object-fit: cover;
        }
        .action-button {
            background-color: #ff3333;
            color: white;
            border: none;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 12px;
            margin: 2px;
            cursor: pointer;
            border-radius: 4px;
        }
        .action-button:hover {
            background-color: #cc0000;
        }
        .edit-button {
            background-color: #FF69B4;
        }
        .edit-button:hover {
            background-color: #C14489;
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
        .page-header {
            margin-top: 20px;
            margin-left: 10px;
        }
        h2{
            color: #FF69B4;
            text-align: center;
        }
    </style>
</head>
<body>
    <a href="home" class="back-button">Quay lại</a>
    <h2 class="page-header">Lịch sử đơn hàng của bạn</h2>
    <c:forEach var="o" items="${orders}">
        <table>
            <tr>
                <td class="order-header" colspan="6">
                    Đơn hàng #${o.orderID} - Ngày: ${o.orderDate}
                </td>
            </tr>
            <tr>
                <th>Hình ảnh</th>
                <th>Sản phẩm</th>
                <th>Số lượng</th>
                <th>Giá</th>
                <th>Trạng thái</th>
                <th>Action</th>
            </tr>
            <c:forEach var="item" items="${orderItemsMap[o.orderID]}">
                <tr>
                    <td><img src="${item.image}" alt="${item.productName}" class="product-image" onerror="this.src='https://via.placeholder.com/50'"></td>
                    <td>${item.productName}</td>
                    <td>${item.quantity}</td>
                    <td>${item.price}</td>
                    <td>${o.status}</td>
                    <td>
                        <c:if test="${o.status == 'Pending'}">
                            <form action="order-history" method="post" style="display: inline;">
                                <input type="hidden" name="action" value="cancel">
                                <input type="hidden" name="orderId" value="${o.orderID}">
                                <button type="submit" class="action-button">Hủy</button>
                            </form>
                            <form action="edit-order" method="get" style="display: inline;">
                                <input type="hidden" name="orderId" value="${o.orderID}">
                                <button type="submit" class="action-button edit-button">Edit</button>
                            </form>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            <tr class="total-row">
                <td colspan="4"></td>
                <td>Tổng:</td>
                <td>${o.totalAmount}</td>
            </tr>
        </table>
    </c:forEach>
</body>
</html
