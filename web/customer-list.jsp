<%-- 
    Document   : customer-list.jsp
    Created on : Jun 16, 2025, 9:39:33 PM
    Author     : daidu
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer Management</title>
   <link rel="stylesheet" type="text/css" href="css/customer-list-style.css">

</head>
<body>
<h2>Customer List</h2>

<form method="get" action="customer-list">
    <input type="text" name="keyword" value="${keyword}" placeholder="Search by username"/>
    <button type="submit">Search</button>
</form>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>ID</th><th>Username</th><th>Full Name</th><th>Gender</th>
        <th>Address</th><th>Phone</th><th>DOB</th><th>Action</th>
    </tr>
    <c:forEach var="u" items="${customers}">
    <tr>
        <td>${u.userId}</td>
        <td>${u.username}</td>
        <td>${u.fullName}</td>
        <td>${u.gender}</td>
        <td>${u.address}</td>
        <td>${u.phoneNumber}</td>
        <td>${u.dob != null ? u.dob.toString() : ''}</td>
        <td>
            <a href="${pageContext.request.contextPath}/edit-customer?userId=${u.userId}">Edit</a>
        </td>
    </tr>
    </c:forEach>
</table>

<c:if test="${not showingAll}">
<div>
    <c:forEach begin="1" end="${totalPages}" var="i">
        <a href="customer-list?page=${i}&keyword=${keyword}" 
           style="margin-right: 5px; ${i == currentPage ? 'font-weight:bold;' : ''}">
           ${i}
        </a>
    </c:forEach>
</div>
</c:if>

</body>
</html>