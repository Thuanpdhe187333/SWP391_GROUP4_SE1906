<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Coupon" %>
<%@ page import="model.User" %>
<%@ page import="controller.users.RolePermissionManager" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Coupon Dashboard</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background-color: #fdf6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 30px;
            background-color: white;
            border: 1px solid #ffc0cb;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(255, 192, 203, 0.3);
        }

        h2 {
            text-align: center;
            color: #d63384;
            margin-bottom: 25px;
        }

        .form-section, .list-section {
            margin-bottom: 40px;
        }

        label {
            margin-top: 12px;
            font-weight: bold;
            color: #444;
        }

        input[type="text"], input[type="number"], input[type="datetime-local"], textarea {
            margin-top: 6px;
            padding: 10px;
            width: 100%;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        input[type="submit"], .btn {
            background-color: #ff69b4;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.2s;
            margin-top: 20px;
        }

        .btn:hover, input[type="submit"]:hover {
            background-color: #ff1493;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: #ffe4ec;
            color: #c2185b;
        }

        tr:hover {
            background-color: #fff0f5;
        }

        .error {
            color: red;
            font-style: italic;
            margin-top: 10px;
            text-align: center;
        }

        .message {
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .message.success { color: green; }
        .message.error { color: red; }
    </style>
</head>
<body>

<%
    User currentUser = (User) session.getAttribute("currentUser");
    boolean canCreate = currentUser != null && RolePermissionManager.hasPermission(currentUser, "coupon:create");
    boolean canDelete = currentUser != null && RolePermissionManager.hasPermission(currentUser, "coupon:delete");
    boolean canSend   = currentUser != null && RolePermissionManager.hasPermission(currentUser, "coupon:send_notification");
%>

<div class="container">
    <h2>Coupon Dashboard</h2>

    <%
        String success = (String) session.getAttribute("success");
        if (success != null) {
    %>
        <div class="message success"><%= success %></div>
    <%
            session.removeAttribute("success");
        }

        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="message error"><%= error %></div>
    <%
        }
    %>

    <% if (canCreate) { %>
    <div class="form-section">
        <form action="CreateCouponServlet" method="post">
            <label for="code">Coupon Code:</label>
            <input type="text" id="code" name="code" maxlength="50" required
                   value="<%= request.getParameter("code") != null ? request.getParameter("code") : "" %>">

            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="3" maxlength="255" required><%= request.getParameter("description") != null ? request.getParameter("description") : "" %></textarea>

            <label for="discount">Discount (%):</label>
            <input type="number" id="discount" name="discount" min="0" max="100" step="0.01" required
                   value="<%= request.getParameter("discount") != null ? request.getParameter("discount") : "" %>">

            <label for="usageLimit">Usage Limit:</label>
            <input type="number" id="usageLimit" name="usageLimit" min="1" required
                   value="<%= request.getParameter("usageLimit") != null ? request.getParameter("usageLimit") : "" %>">

            <label for="expiryDate">Expiry Date:</label>
            <input type="datetime-local" id="expiryDate" name="expiryDate" required
                   value="<%= request.getParameter("expiryDate") != null ? request.getParameter("expiryDate") : "" %>">

            <input type="submit" value="Create Coupon">
        </form>
    </div>
    <% } %>

    <div class="list-section">
        <table>
            <tr>
                <th>Code</th>
                <th>Description</th>
                <th>Discount</th>
                <th>Usage Limit</th>
                <th>Expiry</th>
                <th>Created</th>
                <% if (canDelete || canSend) { %><th>Actions</th><% } %>
            </tr>

            <%
                List<Coupon> coupons = (List<Coupon>) request.getAttribute("coupons");
                if (coupons != null && !coupons.isEmpty()) {
                    for (Coupon c : coupons) {
            %>
            <tr>
                <td><%= c.getCode() %></td>
                <td><%= c.getDescription() %></td>
                <td><%= c.getDiscount() %></td>
                <td><%= c.getUsageLimit() %></td>
                <td><%= c.getExpiryDate() %></td>
                <td><%= c.getCreatedAt() %></td>
                <% if (canDelete || canSend) { %>
                <td>
                    <% if (canSend) { %>
                        <a class="btn" href="SendCouponNotificationServlet?id=<%= c.getCouponId() %>">Send</a>
                    <% } %>
                    <% if (canDelete) { %>
                        <a class="btn" href="DeleteCouponServlet?couponId=<%= c.getCouponId() %>"
                           onclick="return confirm('Delete this coupon?');">Delete</a>
                    <% } %>
                </td>
                <% } %>
            </tr>
            <%
                    }
                } else {
            %>
            <tr><td colspan="7">No coupons found.</td></tr>
            <% } %>
        </table>
    </div>
</div>

</body>
</html>