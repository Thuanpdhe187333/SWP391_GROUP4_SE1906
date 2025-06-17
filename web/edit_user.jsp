<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Chỉnh sửa người dùng</title>
</head>
<body>
    <h2>Chỉnh sửa thông tin người dùng</h2>

    <form action="editUser" method="post">
        <input type="hidden" name="userId" value="${user.userId}" />

        <p>Username: <input type="text" name="username" value="${user.username}" required /></p>
        <p>Full Name: <input type="text" name="fullName" value="${user.fullName}" required /></p>
        <p>Email: <input type="email" name="email" value="${user.email}" required /></p>
        <p>Role: <input type="text" name="role" value="${user.role}" required /></p>
        <p>Gender: <input type="text" name="gender" value="${user.gender}" /></p>
        <p>Phone: <input type="text" name="phoneNumber" value="${user.phoneNumber}" /></p>
        <p>Address: <input type="text" name="address" value="${user.address}" /></p>
        <p>DOB: <input type="date" name="dob" value="<fmt:formatDate value='${user.dob}' pattern='yyyy-MM-dd' />" /></p>

        <button type="submit">Lưu thay đổi</button>
    </form>

    <p><a href="user_list.jsp">← Quay lại danh sách</a></p>

    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>
</body>
</html>
