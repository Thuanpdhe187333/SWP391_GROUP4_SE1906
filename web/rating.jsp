<%-- 
    Document   : rating
    Created on : Jun 23, 2025, 8:13:54 AM
    Author     : pc
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%
    // Giả định user đã đăng nhập
    int userId = 1; // Bạn nên lấy từ session thực tế
    String productIdStr = request.getParameter("id");
    int productId = (productIdStr != null) ? Integer.parseInt(productIdStr) : 0;

    String notify = (String) session.getAttribute("notify");
    if (notify != null) {
%>
    <div style="color: green; margin-bottom: 10px;"><%= notify %></div>
<%
        session.removeAttribute("notify");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đánh giá sản phẩm</title>
</head>
<body>
    <h2>Đánh giá sản phẩm ID: <%= productId %></h2>

    <form action="RatingServlet" method="post">
        <input type="hidden" name="userId" value="<%= userId %>">
        <input type="hidden" name="productId" value="<%= productId %>">

        <label>Chọn số sao:</label><br/>
        <input type="radio" name="rating" value="1"> 1 ★<br/>
        <input type="radio" name="rating" value="2"> 2 ★★<br/>
        <input type="radio" name="rating" value="3"> 3 ★★★<br/>
        <input type="radio" name="rating" value="4"> 4 ★★★★<br/>
        <input type="radio" name="rating" value="5" checked> 5 ★★★★★<br/><br/>

        <button type="submit">Gửi đánh giá</button>
    </form>
</body>
</html>


