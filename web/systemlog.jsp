<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Logs</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f3f3;
            color: #333;
        }
        h2 {
            text-align: center;
            color: #e91e63;
            margin-top: 30px;
        }
        table {
            width: 90%;
            margin: 40px auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        th, td {
            padding: 16px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #fce4ec;
            color: #e91e63;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
        .btn {
            display: block;
            width: 180px;
            margin: 30px auto;
            padding: 10px;
            background: #e91e63;
            color: white;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
        }
        .btn:hover {
            background: #d81b60;
        }
        .no-logs {
            text-align: center;
            color: #d32f2f;
            font-size: 1.3rem;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <h2>Danh Sách Log Hệ Thống</h2>

    <!-- Nếu có log -->
    <c:if test="${not empty systemLogs}">
        <table>
            <thead>
                <tr>
                    <th>Log ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Login Time</th>
                    <th>Login Date</th>
                    <th>Timestamp</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="log" items="${systemLogs}">
                    <tr>
                        <td>${log.logId}</td>
                        <td>${log.username}</td>
                        <td>${log.email}</td>
                        <td>${log.role}</td>
                        <td>${log.loginTime}</td>
                        <td>${log.loginDate}</td>
                        <td>${log.timestamp}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <!-- Nếu không có log -->
    <c:if test="${empty systemLogs}">
        <p class="no-logs">Chưa có log nào!</p>
    </c:if>

    <a href="/" class="btn">Quay lại trang chủ</a>
</body>
</html>
