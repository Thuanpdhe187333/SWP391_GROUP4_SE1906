<%@ page import="java.util.List" %>
<%@ page import="model.Order" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Orders - Cosmetic Shop</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff9fb;
            margin: 20px;
        }
        h1 {
            color: #f48fb1;
        }
        h3 {
            color: #ec407a;
        }
        table {
            border-collapse: collapse; 
            width: 100%; 
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #f8bbd0; 
            padding: 12px; 
            text-align: center; 
        }
        th {
            background-color: #fce4ec;
            color: #880e4f;
        }
        .success { color: #4caf50; font-weight: bold; }
        .error { color: #f44336; font-weight: bold; }
        input[type="text"], input[type="number"] {
            padding: 8px;
            border: 1px solid #f8bbd0;
            border-radius: 4px;
            width: 300px;
        }
        input[type="submit"] {
            background-color: #f48fb1;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        input[type="submit"]:hover {
            background-color: #ec407a;
        }
    </style>
</head>
<body>

<h1>Cosmetic Shop - My Orders</h1>

<% if (request.getAttribute("success") != null) { %>
    <p class="success"><%= request.getAttribute("success") %></p>
<% } %>
<% if (request.getAttribute("error") != null) { %>
    <p class="error"><%= request.getAttribute("error") %></p>
<% } %>

<h3>Create New Order</h3>
<form action="order" method="post">
    <input type="hidden" name="action" value="create">
    <label>Shipping Address:</label><br>
    <input type="text" name="address" required><br><br>
    <label>Total Amount:</label><br>
    <input type="number" name="total" step="0.01" required><br><br>
    <input type="submit" value="Create Order">
</form>

<hr>

<h3>Order List</h3>
<table>
    <tr>
        <th>Order ID</th>
        <th>Order Date</th>
        <th>Shipping Address</th>
        <th>Total Amount</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <% 
        List<Order> orders = (List<Order>) request.getAttribute("orders");
        if (orders != null && !orders.isEmpty()) {
            for (Order order : orders) {
    %>
    <tr>
        <td><%= order.getOrderId() %></td>
        <td><%= order.getOrderDate() %></td>
        <td><%= order.getShippingAddress() %></td>
        <td><%= order.getTotalAmount() %></td>
        <td><%= order.getStatus() %></td>
        <td>
            <form action="order" method="post" style="display:inline;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                <input type="submit" value="Delete">
            </form>
        </td>
    </tr>
    <% 
            } 
        } else { 
    %>
    <tr>
        <td colspan="6">No orders found.</td>
    </tr>
    <% } %>
</table>

</body>
</html>
