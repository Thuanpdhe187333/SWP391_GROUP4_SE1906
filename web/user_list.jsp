<%@ page import="model.User, controller.users.RolePermissionManager, controller.users.RolePermissionManager.Role" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
</head>
<body>
    <h2>Welcome, <%= user.getUsername() %>!</h2>
    <h3>Your Role: <%= user.getRole() %></h3>

    <h4>Your Permissions:</h4>
    <ul>
        <% 
            java.util.List<RolePermissionManager.Role> userRoles = RolePermissionManager.getUserRoles(user.getId());
            for (RolePermissionManager.Role role : userRoles) {
                out.println("<li>" + role.getName() + "</li>");
            }
        %>
    </ul>

    <a href="login.jsp">Logout</a>
</body>
</html>
