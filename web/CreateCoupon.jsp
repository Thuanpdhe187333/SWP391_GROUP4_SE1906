<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Coupon</title>
    <style>
        body {
            background-color: #fff0f5;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            padding: 30px 40px;
            background-color: #ffffff;
            border: 2px solid #ffb6c1;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(255, 105, 180, 0.25);
        }

        h2 {
            text-align: center;
            color: #ff69b4;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 15px;
            font-weight: bold;
            color: #444;
        }

        input[type="text"],
        input[type="number"],
        input[type="datetime-local"],
        textarea {
            margin-top: 6px;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
            background-color: #fdfdfd;
        }

        input[type="submit"] {
            margin-top: 25px;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            background-color: #ff69b4;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #ff1493;
        }

        .error {
            color: red;
            font-style: italic;
            margin-top: 10px;
            text-align: center;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #ff69b4;
            text-decoration: none;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Create New Coupon</h2>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
        <div class="error"><%= error %></div>
    <% } %>

    <form action="CreateCouponServlet" method="post">
        <label for="code">Coupon Code:</label>
        <input type="text" id="code" name="code" maxlength="50" required>

        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="3" maxlength="255" required></textarea>

        <label for="discount">Discount (%):</label>
        <input type="number" id="discount" name="discount" min="0" max="100" step="0.01" required>

        <label for="usageLimit">Usage Limit:</label>
        <input type="number" id="usageLimit" name="usageLimit" min="1" required>

        <label for="expiryDate">Expiry Date:</label>
        <input type="datetime-local" id="expiryDate" name="expiryDate" required>

        <input type="submit" value="Create Coupon">
    </form>

    <a href="ViewCouponsServlet" class="back-link">← Back to Coupons</a>
</div>

</body>
</html>
