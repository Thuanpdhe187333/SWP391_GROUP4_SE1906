<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Management</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f8;
            padding: 30px;
            color: #333;
        }

        header {
            background-color: #FE980F;
            padding: 15px 30px;
            color: white;
            border-radius: 8px;
            margin-bottom: 40px;
        }

        h2 {
            font-weight: bold;
            color: #2c3e50;
        }

        .search-form {
            margin-bottom: 25px;
            display: flex;
            gap: 10px;
        }

        .search-form input[type="text"] {
            flex: 1;
            padding: 10px 14px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .search-form button {
            background-color: #FE980F;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
        }

        .search-form button:hover {
            background-color: #e07c00;
        }

        .table-container {
            background-color: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        thead {
            background-color: #FE980F;
            color: white;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #fff5e6;
        }

        .btn-edit {
            background-color: #ffc107;
            color: black;
            padding: 6px 12px;
            border-radius: 6px;
            text-decoration: none;
        }

        .btn-edit:hover {
            background-color: #e0a800;
        }

        .pagination {
            margin-top: 20px;
            text-align: center;
        }

        .pagination a {
            display: inline-block;
            margin: 0 5px;
            padding: 6px 12px;
            border-radius: 6px;
            background-color: #eee;
            color: #333;
            text-decoration: none;
        }

        .pagination a.active,
        .pagination a:hover {
            background-color: #FE980F;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>

<header>
    <div class="container">
        <h2>Customer List</h2>
    </div>
</header>

<div class="container table-container">
    <form method="get" action="customer-list" class="search-form">
        <input type="text" name="keyword" value="${keyword}" placeholder="Search by username"/>
        <button type="submit">Search</button>
    </form>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Full Name</th>
            <th>Gender</th>
            <th>Address</th>
            <th>Phone</th>
            <th>DOB</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
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
                    <a class="btn-edit" href="${pageContext.request.contextPath}/edit-customer?userId=${u.userId}">
                        Edit
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <c:if test="${not showingAll}">
        <div class="pagination">
            <c:forEach begin="1" end="${totalPages}" var="i">
                <a href="customer-list?page=${i}&keyword=${keyword}" 
                   class="${i == currentPage ? 'active' : ''}">
                    ${i}
                </a>
            </c:forEach>
        </div>
    </c:if>
</div>

</body>
</html>
