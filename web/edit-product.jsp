<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm / Sửa sản phẩm</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <style>
        body {
    font-family: 'Segoe UI', sans-serif;
    background-color: #f4f6f8;
    padding: 30px;
    color: #333;
}

h2, h3, h4 {
    font-weight: 700;
    margin-bottom: 20px;
    color: #2c3e50;
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
    margin-bottom: 40px;
}

label {
    font-weight: 600;
    margin-bottom: 5px;
    display: block;
    color: #555;
}

input[type="text"],
input[type="number"],
textarea,
select {
    width: 100%;
    padding: 10px 14px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: #fff;
    transition: all 0.2s ease-in-out;
}

input:focus,
textarea:focus,
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
    font-weight: 500;
    transition: background-color 0.2s ease;
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
    font-weight: 500;
}

.btn-secondary:hover {
    background-color: #5a6268;
}

.table-container {
    background-color: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.05);
}

.table {
    border-radius: 10px;
    overflow: hidden;
}

.table thead {
    background-color: #FE980F;
    color: white;
}

.table tbody tr:hover {
    background-color: #fff5e6;
}

.table td, .table th {
    vertical-align: middle;
    padding: 12px;
    font-size: 14px;
}

img.thumb {
    border-radius: 6px;
    border: 1px solid #ccc;
    max-width: 50px;
}

footer {
    margin-top: 60px;
    padding: 15px;
    background-color: #f1f1f1;
    text-align: center;
    font-size: 14px;
    color: #777;
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
    <div class="container" style="display: flex; justify-content: space-between; align-items: center;">
        <h2 style="margin: 0;">Product Management</h2>
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
</header>

<div class="container mt-4 mb-5">
    <h3 style="color:#FE980F;">${product != null ? "Edit Product" : "Add New Product"}</h3>
    <form action="product-management" method="post">
        <c:if test="${not empty product}">
            <input type="hidden" name="id" value="${product.productID}" />
        </c:if>



        <div class="form-group">
            <label>Product Name</label>
            <input type="text" name="name" class="form-control" value="${product.productName}" required maxlength="100" />
        </div>

        <div class="form-group">
            <label>Description</label>
            <textarea name="description" class="form-control" rows="2" required maxlength="500">${product.description}</textarea>
        </div>

        <div class="form-group">
            <label>Price</label>
            <input type="number" step="0.01" name="price" class="form-control" value="${product.price}" required min="0" />
        </div>

        <div class="form-group">
            <label>Quantity</label>
            <input type="number" name="quantity" class="form-control" value="${product.quantity}" required min="0" />
        </div>

        <div class="form-group">
            <label>Image URL</label>
            <input type="text" name="image" class="form-control" value="${product.image}" required />
        </div>

        <div class="form-group">
            <label>Category</label>
            <select name="categoryID" class="form-control" required>
                <c:forEach var="c" items="${categoryList}">
                    <option value="${c.categoryID}" 
                        <c:if test="${product != null && product.categoryID == c.categoryID}">selected</c:if>>
                        ${c.categoryName}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Label</label>
            <select name="labelID" class="form-control">
                <option value="">-- Optional --</option>
                <c:forEach var="l" items="${labelList}">
                    <option value="${l.labelID}"
                        <c:if test="${product != null && product.labelID == l.labelID}">selected</c:if>>
                        ${l.labelName}
                    </option>
                </c:forEach>
            </select>
        </div>


        <div class="form-group">
            <label>Brand</label>
            <select name="brandID" class="form-control" required>
                <c:forEach var="b" items="${brandList}">
                    <option value="${b.brandID}"
                        <c:if test="${product != null && product.brandID == b.brandID}">selected</c:if>>
                        ${b.brandName}
                    </option>
                </c:forEach>
            </select>
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

        <a href="product-management" class="btn btn-secondary">Reset</a>
            </form>
        </div>

<div class="container mb-5">
    <h4>Product List</h4>
    <table class="table table-bordered table-hover">
        <thead style="background-color: #FE980F; color: white;">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Quantity</th>
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
                <td><c:out value="${categoryMap[p.categoryID]}" default="Unknown" /></td>
                <td><c:out value="${labelMap[p.labelID]}" default="-" /></td>
                <td><c:out value="${brandMap[p.brandID]}" default="Unknown" /></td>
                <td>${p.createdAt}</td>
                <td>
                    <a href="product-management?action=edit&id=${p.productID}" class="btn btn-sm btn-warning ">Edit</a>
                    <a href="product-management?action=delete&id=${p.productID}" class="btn btn-sm btn-danger"
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

