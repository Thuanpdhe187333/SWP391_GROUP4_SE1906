<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    model.User user = (model.User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile || Hurst</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        /* (CSS giữ nguyên như bạn đã viết, không lặp lại ở đây để ngắn gọn) */
    </style>
</head>
<body>

<div class="container profile-area">
    <div class="row">
        <!-- Left panel -->
        <div class="col-md-3">
            <div class="profile-card text-center">
                <div class="profile-header">
                    <h4>Account</h4>
                </div>
                <div class="profile-body">
                    <img src="https://ui-avatars.com/api/?name=${user.username}&background=random"
                         alt="${user.username}" class="profile-avatar">
                    <h5>${user.username}</h5>
                    <p class="text-muted">${user.email}</p>
                    <ul class="list-unstyled mt-3">
                        <li><a href="profile" class="active">Profile</a></li>
                        <li><a href="my-orders">My Orders</a></li>
                        <li><a href="change-password">Change Password</a></li>
                        <li><a href="logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Right panel -->
        <div class="col-md-9">
            <div class="profile-card">
                <div class="profile-header">
                    <h4>My Profile</h4>
                </div>
                <div class="profile-body">

                    <!-- Success/Error messages -->
                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success">${successMessage}</div>
                    </c:if>
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger">${errorMessage}</div>
                    </c:if>

                    <form action="profile" method="post">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Username</label>
                                    <input type="text" class="form-control" value="${user.username}" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Email</label>
                                    <input type="email" class="form-control" value="${user.email}" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Phone Number</label>
                                    <input type="text" name="phoneNumber" class="form-control" value="${user.phoneNumber}">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Gender</label>
                                    <select name="gender" class="form-control">
                                        <option value="Male" <c:if test="${user.gender == 'Male'}">selected</c:if>>Nam</option>
                                        <option value="Female" <c:if test="${user.gender == 'Female'}">selected</c:if>>Nữ</option>
                                        <option value="Other" <c:if test="${user.gender == 'Other'}">selected</c:if>>Khác</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Date of Birth</label>
                                    <input type="date" name="dob" class="form-control"
                                           value="<fmt:formatDate value='${user.dob}' pattern='yyyy-MM-dd'/>">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Address</label>
                                    <input type="text" name="address" class="form-control" value="${user.address}">
                                </div>
                            </div>
                        </div>

                        <div class="text-end mt-4">
                            <button type="submit" class="btn-update">Update Profile</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
