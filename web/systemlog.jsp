<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Logs</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fce4ec;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #f06292;
            color: white;
            padding: 15px;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f06292;
            color: white;
        }
        td {
            background-color: #f8bbd0;
        }
    </style>
</head>
<body>
    <header>
        <h1>System Log - Recent Logins</h1>
    </header>

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
            <!-- Hiển thị thông tin log từ Servlet -->
            <c:forEach var="log" items="${logEntries}">
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
</body>
</html>
