<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer</title>
    
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

        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            max-width: 600px;
            margin: auto;
        }

        h2 {
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        label {
            font-weight: 600;
            margin-top: 15px;
            display: block;
        }

        input[type="text"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #ccc;
            border-radius: 8px;
            margin-top: 5px;
        }

        input:focus,
        select:focus {
            border-color: #FE980F;
            outline: none;
            box-shadow: 0 0 0 0.2rem rgba(254, 152, 15, 0.2);
        }

        .btn-orange {
            background-color: #FE980F;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            margin-top: 20px;
        }

        .btn-orange:hover {
            background-color: #e07c00;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            margin-top: 20px;
            margin-left: 10px;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .error-msg {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .btn-sm.btn-warning {
    background-color: #ffc107;
    color: black;
    border: none;
    padding: 6px 12px;
    border-radius: 6px;
}

.btn-sm.btn-warning:hover {
    background-color: #e0a800;
}

.btn-sm.btn-danger {
    background-color: #dc3545;
    color: white;
    border: none;
    padding: 6px 12px;
    border-radius: 6px;
}

.btn-sm.btn-danger:hover {
    background-color: #c82333;
}
    </style>
</head>
<body>

<header>
    <div class="container">
        <div style="text-align: right; margin-bottom: 10px;">
            <a href="home" class="btn" style="
                background-color: #ffffff;
                color: #FE980F;
                font-weight: 600;
                padding: 8px 20px;
                border: 2px solid #FE980F;
                border-radius: 30px;
                text-decoration: none;
                transition: 0.3s;">
                <i class="fa fa-home" style="margin-right: 6px;"></i> Home
            </a>
        </div>
        <h2>Edit Customer</h2>
    </div>
</header>

<div class="form-container">
    <c:if test="${not empty errorMsg}">
        <div class="error-msg">${errorMsg}</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/edit-customer">
        <input type="hidden" name="userId" value="${customer.userId}" />

        <label>Username:</label>
        <p style="font-weight:bold; color:#555;">${customer.username}</p>

        <label>Full Name:</label>
        <input type="text" name="fullName" value="${customer.fullName}" required />

        <label>Gender:</label>
        <select name="gender">
            <option value="Nam" ${customer.gender == 'Nam' ? 'selected' : ''}>Nam</option>
            <option value="Nữ" ${customer.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
            <option value="Other" ${customer.gender == 'Other' ? 'selected' : ''}>Other</option>
        </select>

        <label>Address:</label>
        <input type="text" name="address" value="${customer.address}" />

        <label>Phone Number:</label>
        <input type="text" name="phoneNumber" value="${customer.phoneNumber}" />

        <label>Date of Birth:</label>
        <input type="date" name="dob" value="${customer.dob != null ? customer.dob.toString() : ''}" />

        <button type="submit" class="btn-orange">Save</button>
        <a href="${pageContext.request.contextPath}/customer-list" class="btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>
