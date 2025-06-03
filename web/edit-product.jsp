<%-- 
    Document   : edit-product
    Created on : Jun 3, 2025, 4:00:21 PM
    Author     : daidu
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Management</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        header {
            background-color: #FE980F;
            color: white;
            padding: 15px;
        }
        .btn-orange {
            background-color: #FE980F;
            border: none;
            color: white;
        }
        .btn-orange:hover {
            background-color: #e07c00;
        }
        footer {
            background-color: #f5f5f5;
            text-align: center;
            padding: 10px;
            margin-top: 50px;
        }
    </style>
</head>
<body>

<header>
    <div class="container">
        <h2>Product Management</h2>
    </div>
</header>

<div class="container mt-4 mb-5">
    <h3 style="color:#FE980F;">${product != null ? "Edit Product" : "Add New Product"}</h3>
    <form action="ProductServlet" method="post">
        <c:if test="${product != null}">
            <input type="hidden" name="id" value="${product.productID}" />
        </c:if>
            
        <c:if test="${not empty product}">
            <input type="hidden" name="id" value="${product.productID}" />
        </c:if>


        <div class="form-group">
            <label>Product Name</label>
            <input type="text" name="name" class="form-control" value="${product.productName}" required />
        </div>

        <div class="form-group">
            <label>Description</label>
            <textarea name="description" class="form-control" rows="2" required>${product.description}</textarea>
        </div>

        <div class="form-group">
            <label>Price</label>
            <input type="number" step="0.01" name="price" class="form-control" value="${product.price}" required />
        </div>

        <div class="form-group">
            <label>Quantity</label>
            <input type="number" name="quantity" class="form-control" value="${product.quantity}" required />
        </div>

        <div class="form-group">
            <label>Image URL</label>
            <input type="text" name="image" class="form-control" value="${product.image}" required />
        </div>

        <div class="form-group">
            <label>Category ID</label>
            <input type="number" name="categoryID" class="form-control" value="${product.categoryID}" required />
        </div>

        <div class="form-group">
            <label>Label ID</label>
            <input type="number" name="labelID" class="form-control" value="${product.labelID}" />
        </div>

        <div class="form-group">
            <label>Brand ID</label>
            <input type="number" name="brandID" class="form-control" value="${product.brandID}" required />
        </div>

        <input type="hidden" name="id" value="${product != null ? product.productID : ''}" />

<button type="submit" class="btn btn-orange">
    <c:choose>
        <c:when test="${not empty product and not empty product.productID}">
            Update Product
        </c:when>
        <c:otherwise>
            Add Product
        </c:otherwise>
    </c:choose>
</button>

<a href="ProductServlet" class="btn btn-secondary">Reset</a>
    </form>
</div>

<div class="container mb-5">
    <h4>Product List</h4>
    <table class="table table-bordered table-hover">
        <thead style="background-color: #FE980F; color: white;">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Desc</th>
                <th>Price</th>
                <th>Qty</th>
                <th>Image</th>
                <th>Category</th>
                <th>Label</th>
                <th>Brand</th>
                <th>Created</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="p" items="${products}">
            <tr>
                <td>${p.productID}</td>
                <td>${p.productName}</td>
                <td>${p.description}</td>
                <td>${p.price}</td>
                <td>${p.quantity}</td>
                <td><img src="${p.image}" width="50" /></td>
                <td>${p.categoryID}</td>
                <td>${p.labelID}</td>
                <td>${p.brandID}</td>
                <td>${p.createdAt}</td>
                <td>
                    <a href="ProductServlet?action=edit&id=${p.productID}" class="btn btn-sm btn-warning">Edit</a>
                    <a href="ProductServlet?action=delete&id=${p.productID}" class="btn btn-sm btn-danger"
                       onclick="return confirm('Delete this product?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<footer>
    <p>&copy; 2025 Cosmetic Shop Online System</p>
</footer>

</body>
</html>

