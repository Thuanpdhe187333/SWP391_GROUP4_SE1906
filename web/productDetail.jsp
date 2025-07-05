<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Product, java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    Product p = (Product) request.getAttribute("product");
    List<Product> relatedProducts = (List<Product>) request.getAttribute("relatedProducts");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title><%= (p != null) ? p.getProductName() + " - Detail" : "No Products Found" %> | Cosmetic Shop</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href="css/cssindex.css" rel="stylesheet">
        <link href="css/related-products.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/11.0.2/css/bootstrap-slider.min.css">
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head>
    <body>
        <!-- Top Bar -->
        <div class="topbar" style="background-color: #FF69B4; padding: 10px 0;">
            <div class="container text-center">
                <span style="color: white; font-weight: bold;">
                    🎉 Chào mừng bạn đến với Cosmetic Shop! Miễn phí vận chuyển toàn quốc 🎁
                </span>
            </div>
        </div>

        <!-- Header Middle -->
        <div class="header-middle" style="padding: 15px 0;">
            <div class="container">
                <div class="row" style="display: flex; align-items: center; justify-content: space-between;">
                    <div style="flex: 1; display: flex; justify-content: flex-start;">
                        <ul class="nav nav-pills" style="margin: 0; padding: 0; list-style: none;">
                            <li style="display: inline-block; margin-right: 15px;">
                                <a href="#" style="color: #000;"><i class="fa fa-phone"></i> +2 95 01 88 821</a>
                            </li>
                            <li style="display: inline-block;">
                                <a href="#" style="color: #000;"><i class="fa fa-envelope"></i> info@domain.com</a>
                            </li>
                        </ul>
                    </div>
                    <div style="flex: 1; display: flex; justify-content: center;">
                        <a href="home">
                            <img src="images/home/logo1.png" alt="Logo" style="height: 100px;">
                        </a>
                    </div>
                    <div style="flex: 1; display: flex; justify-content: flex-end;">
                        <ul class="nav navbar-nav" style="margin: 0; padding: 0; list-style: none;">
                            <c:choose>
                                <c:when test="${not empty sessionScope.currentUser}">
                                    <li style="display: inline-block; margin-left: 15px;" class="dropdown">
                                        <a href="#" style="color: #000; font-size: 14px; font-family: inherit;" data-toggle="dropdown">
                                            <i class="fa fa-user"></i> 
                                            <c:out value="${sessionScope.currentUser.username}" /> 
                                            <b class="caret"></b>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li><a href="change_password.jsp">Đổi Mật Khẩu</a></li>
                                            <c:if test="${currentUser != null}">
                                                <c:if test="${currentUser.role == 'Customer'}">
                                                    <li><a href="order-history">Lịch Sử Mua Hàng</a></li>
                                                </c:if>
                                            </c:if>
                                            <li><a href="#" onclick="document.getElementById('logoutForm').submit(); return false;">Đăng Xuất</a></li>
                                        </ul>
                                        <form id="logoutForm" action="logout" method="post" style="display: none;"></form>
                                    </li>
                                    <c:if test="${sessionScope.currentUser.role == 'Manager'}">
                                        <li style="display: inline-block; margin-left: 15px;" class="dropdown">
                                            <a href="#" style="color: #000; font-size: 14px; font-family: inherit;" data-toggle="dropdown">
                                                <i class="fa fa-cog"></i> Quản Lý
                                                <b class="caret"></b>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="orders">Quản Lý Đơn Hàng</a></li>
                                                <li><a href="${pageContext.request.contextPath}/manager/customers">Quản Lý Khách Hàng</a></li>
                                            </ul>
                                        </li>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <li style="display: inline-block; margin-left: 15px;">
                                        <a href="login.jsp" style="color: #000; font-size: 14px; font-family: inherit;">
                                            <i class="fa fa-lock"></i> Đăng Nhập
                                        </a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <li style="display: inline-block; margin-left: 15px;">
                                <a href="cart.jsp" style="color: #000; font-size: 14px; font-family: inherit;">
                                    <i class="fa fa-shopping-cart"></i> Giỏ Hàng
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Header Bottom -->
        <div class="header-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="mainmenu pull-left">
                            <style>.mainmenu ul.nav > li > a:hover {
                                    color: #FF69B4 !important;
                                    transition: color 0.3s;
                                }</style>
                            <ul class="nav navbar-nav collapse navbar-collapse">
                                <li><a href="home" class="active" style="color: #FF69B4;">Trang Chủ</a></li>
                                <li><a href="product-list">Tạp Chí Làm Đẹp</a></li>
                                <li><a href="">Ưu Đãi</a></li>
                                <li><a href="contact-us.jsp">Liên Hệ</a></li>
                                <li><a href="product-list">Về Cosmetic</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product Detail Section -->
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2>Loại Sản Phẩm</h2>
                            <div class="panel-group category-products" id="accordian">
                                <c:forEach var="parent" items="${categoryList}">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <c:choose>
                                                    <c:when test="${not empty parent.children}">
                                                        <a data-toggle="collapse" data-parent="#accordian" href="#cat${parent.categoryID}">
                                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                            ${parent.categoryName}
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="home?category=${parent.categoryID}">${parent.categoryName}</a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </h4>
                                        </div>
                                        <c:if test="${not empty parent.children}">
                                            <div id="cat${parent.categoryID}" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <ul>
                                                        <c:forEach var="child" items="${parent.children}">
                                                            <li><a href="home?category=${child.categoryID}">${child.categoryName}</a></li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </c:forEach>
                            </div>

                            <h2>Thương Hiệu</h2>
                            <div class="brands-products">
                                <div class="brands-name">
                                    <ul class="nav nav-pills nav-stacked">
                                        <c:forEach var="entry" items="${brandMap}">
                                            <c:set var="brand" value="${entry.key}" />
                                            <c:set var="count" value="${entry.value}" />
                                            <li>
                                                <a href="home?brand=${brand.brandID}">
                                                    <span>${brand.brandName}</span>
                                                    <span class="pull-right">(${count})</span>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>

                            <h2>Lọc Theo Giá</h2>
                            <div class="price-range">
                                <form action="home" method="get" id="priceFilterForm">
                                    <ul class="price-filter-list">
                                        <li>
                                            <label>
                                                <input type="checkbox" name="priceRange" value="0-500000" onchange="this.form.submit()" ${param.priceRange == '0-500000' ? 'checked' : ''}>
                                                Dưới 500.000đ
                                            </label>
                                        </li>
                                        <li>
                                            <label>
                                                <input type="checkbox" name="priceRange" value="500000-1000000" onchange="this.form.submit()" ${param.priceRange == '500000-1000000' ? 'checked' : ''}>
                                                500.000đ - 1.000.000đ
                                            </label>
                                        </li>
                                        <li>
                                            <label>
                                                <input type="checkbox" name="priceRange" value="1000000-1500000" onchange="this.form.submit()" ${param.priceRange == '1000000-1500000' ? 'checked' : ''}>
                                                1.000.000đ - 1.500.000đ
                                            </label>
                                        </li>
                                        <li>
                                            <label>
                                                <input type="checkbox" name="priceRange" value="1500000-2000000" onchange="this.form.submit()" ${param.priceRange == '1500000-2000000' ? 'checked' : ''}>
                                                1.500.000đ - 2.000.000đ
                                            </label>
                                        </li>
                                        <li>
                                            <label>
                                                <input type="checkbox" name="priceRange" value="2000000-" onchange="this.form.submit()" ${param.priceRange == '2000000-' ? 'checked' : ''}>
                                                Trên 2.000.000đ
                                            </label>
                                        </li>
                                    </ul>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Product Detail Section -->
                    <div class="col-sm-9 padding-right">
                        <div class="product-detail">
                            <% if (p == null) { %>
                            <h2 style="color: red;">Không tìm thấy sản phẩm nào</h2>
                            <a href="home" class="btn btn-default">⬅ Quay Lại</a>
                            <% } else { %>
                            <div class="row">
                                <div class="col-md-4">
                                    <img src="<%= p.getImage() %>" alt="<%= p.getProductName() %>" class="img-fluid product-image" style="max-height: 300px; width: 100%; object-fit: cover; border-radius: 10px; border: 1px solid #eee;">
                                </div>
                                <div class="col-md-8">
                                    <h2 style="font-weight: bold;"><%= p.getProductName() %></h2>
                                    <p><strong style="color: #FF69B4;">Giá:</strong> <%= String.format("%,.0f", p.getPrice()) %> VND</p>
                                    <p><strong style="color: #FF69B4;">Mô Tả:</strong> <%= p.getDescription() %></p>
                                    <p><strong style="color: #FF69B4;">Thương Hiệu:</strong> <%= p.getBrandName() %></p>
                                    <p><strong style="color: #FF69B4;">Công Dụng:</strong> <%= p.getUsage() %></p>
                                    <p><strong style="color: #FF69B4;">Thành Phần:</strong> <%= p.getIngredients() %></p>
                                    <p><strong style="color: #FF69B4;">Hướng Dẫn Sử Dụng:</strong> <%= p.getHowToUse() %></p>
                                    <p><strong style="color: #FF69B4;">Lưu Ý:</strong> <%= p.getNote() %></p>
                                    <p><strong style="color: #FF69B4;">Bảo Quản:</strong> <%= p.getPreservation() %></p>
                                    <br>
                                    <div style="display: flex; align-items: center; gap: 10px;">
                                        <div style="display: flex; align-items: center; background-color: #f9f9f9; border: 1px solid #ccc; border-radius: 20px; padding: 5px 10px;">
                                            <button type="button" onclick="document.getElementById('quantity').stepDown(); updateQuantity();" style="background: none; border: none; font-size: 16px; cursor: pointer; padding: 0 5px;">−</button>
                                            <input type="number" id="quantity" name="quantity" min="1" value="1" style="width: 40px; text-align: center; border: none; background: none; font-size: 16px; -moz-appearance: textfield;">
                                            <button type="button" onclick="document.getElementById('quantity').stepUp(); updateQuantity();" style="background: none; border: none; font-size: 16px; cursor: pointer; padding: 0 5px;">+</button>
                                        </div>
                                        <button id="addToCartBtn" class="btn btn-cart">🛒 Thêm Vào Giỏ</button>
                                        <span id="addCartStatus" style="margin-left: 10px;"></span>
                                    </div>
                                </div>
                            </div>
                            <!-- Related Products Section -->
<% if (relatedProducts != null && !relatedProducts.isEmpty()) { %>
<div class="related-products-section">
    <h3>Sản Phẩm Liên Quan:</h3>
    <div class="row">
        <% for (Product related : relatedProducts) { %>
        <div class="col-md-3 col-sm-6">
            <div class="related-product-card">
                <img src="<%= related.getImage() %>" alt="<%= related.getProductName() %>" class="img-fluid">
                <h4>
                    <a href="product-detail?id=<%= related.getProductId() %>"><%= related.getProductName() %></a>
                </h4>
                <p><%= String.format("%,.0f", related.getPrice()) %> VND</p>
                <p><strong>Thương Hiệu:</strong> <%= related.getBrandName() %></p>
                <button type="button" class="btn btn-warning add-to-cart-modal"
                        data-id="<%= related.getProductId() %>"
                        data-name="<%= related.getProductName() %>"
                        data-price="<%= related.getPrice() %>">🛒 Thêm Vào Giỏ</button>
            </div>
                                    </div>
                                    <% } %>
                                </div>
                            </div>
                            <% } %>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer id="footer">
            <div style="background-color: #FF69B4; padding: 17px 20px; border-radius: 12px; margin: 0px auto; max-width: 1172px;">
                <div class="container" style="margin: 0 auto;">
                    <div class="row" style="display: flex; flex-wrap: wrap; align-items: center; justify-content: space-between; gap: 10px;">
                        <div style="margin-left: 15px; flex: 1 1 60%; color: white; line-height: 1.2;">
                            <h3 style="font-weight: bold; text-transform: uppercase; margin: 0; font-size: 20px;">
                                NHẬN BẢN TIN LÀM ĐẸP
                            </h3>
                            <p style="margin: 0; font-size: 13px;">Đừng bỏ lỡ hàng ngàn sản phẩm và chương trình siêu hấp dẫn</p>
                        </div>
                        <div style="flex: 1 1 35%; display: flex; justify-content: flex-end; margin-right: 22px;">
                            <form style="display: flex; background-color: #f78fb3; padding: 4px 8px; border-radius: 25px;">
                                <input type="email" name="email" placeholder="Điền email của bạn"
                                       style="border: none; outline: none; background: transparent; color: white; padding: 6px 8px; font-size: 13px;">
                                <button style="background-color: transparent; border: none; color: white; font-weight: bold; padding: 6px 12px; cursor: pointer; font-size: 13px; white-space: nowrap;">
                                    THEO DÕI
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer-widget">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Service</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Online Help</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Order Status</a></li>
                                    <li><a href="#">Change Location</a></li>
                                    <li><a href="#">FAQ’s</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Cosmetic Shop</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Makeup</a></li>
                                    <li><a href="#">Body</a></li>
                                    <li><a href="#">Womens</a></li>
                                    <li><a href="#">Gift Cards</a></li>
                                    <li><a href="#">Face</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Policies</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Terms of Use</a></li>
                                    <li><a href="#">Privecy Policy</a></li>
                                    <li><a href="#">Refund Policy</a></li>
                                    <li><a href="#">Billing System</a></li>
                                    <li><a href="#">Ticket System</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>About Shopper</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Company Information</a></li>
                                    <li><a href="#">Careers</a></li>
                                    <li><a href="#">Store Location</a></li>
                                    <li><a href="#">Affillate Program</a></li>
                                    <li><a href="#">Copyright</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3 col-sm-offset-1">
                            <div class="single-widget">
                                <h2>About Shopper</h2>
                                <div class="address">
                                    <img src="${pageContext.request.contextPath}/images/home/map.png" alt="" />
                                    <p>Hoalac, Hanoi, Vietnam</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <p class="pull-left">Copyright © 2025 Cosmetic Shop. All rights reserved.</p>
                        <p class="pull-right">Designed by Group 4</p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Scripts -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/11.0.2/bootstrap-slider.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script>
            function updateQuantity() {
                const quantityInput = document.getElementById('quantity');
                if (quantityInput.value < 1)
                    quantityInput.value = 1;
            }

            $(document).ready(function () {
                $("#addToCartBtn").click(function () {
                    const quantity = $("#quantity").val();
                    if (quantity < 1) {
                        $("#addCartStatus").html("<span style='color:red;'>❌ Vui lòng chọn số lượng lớn hơn 0</span>");
                        return;
                    }
                    $.post("add-to-cart", {id: <%= p != null ? p.getProductId() : 0 %>, quantity: quantity}, function (data) {
                        try {
                            const json = typeof data === "string" ? JSON.parse(data) : data;
                            $(".cart-icon").html("🛒 Giỏ Hàng (" + json.totalItems + ")");
                            $("#addCartStatus").html("<span style='color:green;'>✔ Đã thêm vào giỏ!</span>");
                        } catch (e) {
                            console.error("JSON Error", e);
                            $("#addCartStatus").html("<span style='color:red;'>❌ Lỗi xử lý</span>");
                        }
                    }).fail(function () {
                        $("#addCartStatus").html("<span style='color:red;'>❌ Lỗi kết nối</span>");
                    });
                });

                $(".add-to-cart-modal").click(function () {
                    const id = $(this).data("id");
                    const quantity = 1; // Default quantity for related products
                    if (!id || isNaN(id)) {
                        alert("❌ ID sản phẩm không hợp lệ");
                        return;
                    }
                    $.get("add-to-cart", {id: id, quantity: quantity}, function (data) {
                        try {
                            const json = typeof data === "string" ? JSON.parse(data) : data;
                            $(".cart-icon").html("🛒 Giỏ Hàng (" + json.totalItems + ")");
                            $("body").append('<div class="cart-success">✅ Đã thêm vào giỏ!</div>');
                            setTimeout(() => $(".cart-success").fadeOut(300, function () {
                                $(this).remove();
                            }), 3000);
                        } catch (e) {
                            console.error("❌ Processing Error JSON:", e);
                            alert("❌ Error Processing Cart");
                        }
                    }).fail(function (xhr) {
                        console.error("❌ AJAX Error:", xhr.responseText);
                        alert("❌ Unable To Connect To Server");
                    });
                });
            });
        </script>
    </body>
</html>
