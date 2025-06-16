<%-- 
    Document   : edit-customer
    Created on : Jun 16, 2025, 10:16:46 PM
    Author     : daidu
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        h2 {
            font-weight: 700;
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            max-width: 600px;
            margin: auto;
        }

        label {
            font-weight: 600;
            margin-bottom: 5px;
            display: block;
            color: #555;
        }

        input[type="text"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px 14px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #fff;
        }

        .btn-orange {
            background-color: #FE980F;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 500;
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
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
<h2>Edit Customer Information</h2>

<c:if test="${not empty errorMsg}">
    <div style="color:red">${errorMsg}</div>
</c:if>

<form method="post" action="${pageContext.request.contextPath}/edit-customer">
    <input type="hidden" name="userId" value="${customer.userId}" />

    Username: ${customer.username} <br/><br/>

    Full Name:
    <input type="text" name="fullName" value="${customer.fullName}" required/><br/><br/>

    Gender:
    <select name="gender">
        <option value="Nam" ${customer.gender == 'Nam' ? 'selected' : ''}>Nam</option>
        <option value="Nữ" ${customer.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
        <option value="Other" ${customer.gender == 'Other' ? 'selected' : ''}>Other</option>
    </select><br/><br/>

    Address:
    <input type="text" name="address" value="${customer.address}"/><br/><br/>

    Phone Number:
    <input type="text" name="phoneNumber" value="${customer.phoneNumber}"/><br/><br/>

    Date of Birth:
    <input type="date" name="dob" value="${customer.dob != null ? customer.dob.toString() : ''}"/><br/><br/>

    <button type="submit">Save</button>
    <a href="${pageContext.request.contextPath}/customer-list">Cancel</a>
</form>

</body>
</html>
