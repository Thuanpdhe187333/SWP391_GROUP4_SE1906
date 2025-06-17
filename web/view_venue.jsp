<%-- 
    Document   : revenue
    Created on : Jun 15, 2025, 7:17:11 PM
    Author     : pc
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, model.Venue" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Sales Revenue</title>
    <style>
        table { border-collapse: collapse; width: 90%; margin: auto; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        h2 { text-align: center; color: #333; }
    </style>
</head>
<body>
    <h2>Sales Revenue</h2>
    <table>
        <tr>
            <th>Order ID</th>
            <th>User ID</th>
            <th>Order Date</th>
            <th>Total Amount (VND)</th>
            <th>Status</th>
        </tr>
        <c:forEach var="o" items="${orders}">
            <tr>
                <td>${o.orderId}</td>
                <td>${o.userId}</td>
                <td>${o.orderDate}</td>
                <td>${o.totalAmount}</td>
                <td>${o.status}</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="4"><strong>Total Revenue:</strong></td>
            <td><strong>${totalRevenue}</strong></td>
        </tr>
    </table>
</body>
</html>
