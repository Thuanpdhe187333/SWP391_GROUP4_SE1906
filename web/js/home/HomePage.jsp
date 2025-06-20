<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Product, java.util.List, java.util.Map, model.Brand, model.Category" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Home | Cosmetic Shop</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/cssindex.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/11.0.2/css/bootstrap-slider.min.css">     
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head>
    <body>
        <div class="topbar" style="background-color: #FF69B4; padding: 10px 0;">
            <div class="container text-center">
                <span style="color: white; font-weight: bold;">
                    🎉 Chào mừng bạn đến với Cosmetic Shop! Miễn phí vận chuyển toàn quốc 🎁
                </span>
            </div>
        </div>

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
                            <li style="display: inline-block; margin-left: 15px;">
                                <a href="login.jsp" style="color: #000; font-size: 14px; font-family: inherit;">
                                    <i class="fa fa-lock"></i> Login
                                </a>
                            </li>
                            <li style="display: inline-block; margin-left: 15px;">
                                <a href="cart.jsp" style="color: #000; font-size: 14px; font-family: inherit;">
                                    <i class="fa fa-shopping-cart"></i> Cart
                                </a>
                            </li>
                            <li style="display: inline-block; margin-left: 0px;">
                                <a href="" style="color: red; font-size: 14px; font-family: inherit;">
                                    <i class="fa fa-heart"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

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
                                <li><a href="home" class="active" style="color: #FF69B4;">Home</a></li>
                                <li><a href="product-list">Blog</a></li>
                                <li><a href="contact-us.jsp">Contact</a></li>
                                <li><a href="product-list">About Cosmetic</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="search_box pull-right">
                            <input type="text" placeholder="Search"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <section id="slider">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#slider-carousel" data-slide-to="1"></li>
                                <li data-target="#slider-carousel" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <div class="col-sm-6">
                                        <h1><span>Cosmetic</span>Shop</h1>
                                        <h2>Free E-Commerce Template</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                        <button type="button" class="btn btn-default get">Get it now</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/home/mypham1.jpg" class="girl img-responsive" alt="" />
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="col-sm-6">
                                        <h1><span>Cosmetic</span>Shop</h1>
                                        <h2>100% Responsive Design</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                        <button type="button" class="btn btn-default get">Get it now</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/home/mypham2.jpg" class="girl img-responsive" alt="" />
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="col-sm-6">
                                        <h1><span>Cosmetic</span>Shop</h1>
                                        <h2>Free Ecommerce Template</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                        <button type="button" class="btn btn-default get">Get it now</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/home/mypham3.jpg" class="girl img-responsive" alt="" />
                                    </div>
                                </div>
                            </div>
                            <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2>Category</h2>
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

                            <h2>Brands</h2>
                            <div class="brands-products">
                                <div class="brands-name">
                                    <ul class="nav nav-pills nav-stacked">
                                        <c:forEach var="entry" items="${brandMap}">
                                            <c:set var="brand" value="${entry.key}" />
                                            <c:set var="count" value="${entry.value}" />
                                            <li>
                                                <a href="home?brand=${brand.brandID}">
                                                    <span>${brand.brandName}</span>
                                                    <span class="badge pull-right">(${count})</span>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>

                            <h2>Price Range</h2>
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

                            <div class="shipping text-center">
                                <img src="images/home/shipping.jpg" alt="" />
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-9 padding-right">
                        <section class="product-section">
                            <div class="product-grid">
                                <c:choose>
                                    <c:when test="${not empty products}">
                                        <c:forEach var="p" items="${products}">
                                            <div class="product-card">
                                                <img src="${fn:escapeXml(p.image)}" alt="${fn:escapeXml(p.productName)}" class="product-image">
                                                <h3 class="product-name" data-toggle="modal" data-target="#productModal" 
                                                    data-id="${p.productId}" 
                                                    data-name="${fn:escapeXml(p.productName)}" 
                                                    data-price="${p.price}" 
                                                    data-description="${fn:escapeXml(p.description)}" 
                                                    data-brand="${fn:escapeXml(p.brandName)}" 
                                                    data-usage="${fn:escapeXml(p.usage)}" 
                                                    data-ingredients="${fn:escapeXml(p.ingredients)}" 
                                                    data-howtouse="${fn:escapeXml(p.howToUse)}" 
                                                    data-note="${fn:escapeXml(p.note)}" 
                                                    data-preservation="${fn:escapeXml(p.preservation)}" 
                                                    data-image="${fn:escapeXml(p.image)}">
                                                    ${fn:escapeXml(p.productName)}
                                                </h3>
                                                <p class="price">
                                                    <c:out value="${p.price != null ? String.format('%,.0f', p.price) : 'N/A'}" /> VND
                                                </p>
                                                <p class="brand">
                                                    Thương hiệu: <c:out value="${not empty p.brandName ? p.brandName : 'Không rõ'}" />
                                                </p>
                                                <button type="button" class="btn btn-warning add-to-cart-modal"
                                                        data-id="${p.productId}"
                                                        data-name="${fn:escapeXml(p.productName)}"
                                                        data-price="${p.price}">Thêm vào giỏ</button>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="error-message">
                                            <c:choose>
                                                <c:when test="${not empty param.brand}">
                                                    Không có sản phẩm nào thuộc thương hiệu này.
                                                </c:when>
                                                <c:otherwise>
                                                    Không có sản phẩm nào để hiển thị.
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <!-- Modal -->
                            <div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="productModalLabel">Chi tiết sản phẩm</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <img src="" alt="Product Image" class="img-fluid product-modal-image" style="max-height: 300px; object-fit: cover;">
                                                </div>
                                                <div class="col-md-8">
                                                    <h4 id="modalProductName"></h4>
                                                    <p><strong>Giá:</strong> <span id="modalPrice"></span> VND</p>
                                                    <p><strong>Thương hiệu:</strong> <span id="modalBrand"></span></p>
                                                    <p><strong>Mô tả:</strong> <span id="modalDescription"></span></p>
                                                    <p><strong>Công dụng:</strong> <span id="modalUsage"></span></p>
                                                    <p><strong>Thành phần:</strong> <span id="modalIngredients"></span></p>
                                                    <p><strong>Cách sử dụng:</strong> <span id="modalHowToUse"></span></p>
                                                    <p><strong>Lưu ý:</strong> <span id="modalNote"></span></p>
                                                    <p><strong>Bảo quản:</strong> <span id="modalPreservation"></span></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                            <button type="button" class="btn btn-warning add-to-cart-modal" data-id="">Thêm vào giỏ</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>

        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="companyinfo">
                                <h2><span>c</span>-shopper</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p>
                            </div>
                        </div>
                        <div class="col-sm-7">
                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe1.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe2.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe3.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe4.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="address">
                                <img src="images/home/map.png" alt="" />
                                <p>Hoalac, Hanoi, Vietnam</p>
                            </div>
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
                                <form action="#" class="searchform">
                                    <input type="text" placeholder="Your email address" />
                                    <button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
                                    <p>Get the most recent updates from <br />our site and be updated your self...</p>
                                </form>
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

        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/11.0.2/bootstrap-slider.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script>
                                                    $(document).ready(function () {
                                                        $(".product-name").click(function () {
                                                            const productId = $(this).data("id");
                                                            const productName = $(this).data("name");
                                                            const price = $(this).data("price");
                                                            const description = $(this).data("description");
                                                            const brand = $(this).data("brand");
                                                            const usage = $(this).data("usage");
                                                            const ingredients = $(this).data("ingredients");
                                                            const howToUse = $(this).data("howtouse");
                                                            const note = $(this).data("note");
                                                            const preservation = $(this).data("preservation");
                                                            const image = $(this).data("image");

                                                            // Điền dữ liệu vào modal
                                                            $("#modalProductName").text(productName);
                                                            $("#modalPrice").text(price ? price.toLocaleString('vi-VN') : 'N/A');
                                                            $("#modalBrand").text(brand || 'Không rõ');
                                                            $("#modalDescription").text(description || 'Không có mô tả');
                                                            $("#modalUsage").text(usage || 'Không có thông tin');
                                                            $("#modalIngredients").text(ingredients || 'Không có thông tin');
                                                            $("#modalHowToUse").text(howToUse || 'Không có thông tin');
                                                            $("#modalNote").text(note || 'Không có thông tin');
                                                            $("#modalPreservation").text(preservation || 'Không có thông tin');
                                                            $(".product-modal-image").attr("src", image || 'images/default-image.jpg'); // Sử dụng đường dẫn từ data-image, fallback nếu rỗng

                                                            // Cập nhật nút Thêm vào giỏ trong modal
                                                            $(".add-to-cart-modal").data("id", productId).data("name", productName).data("price", price);
                                                        });

                                                        // Xử lý thêm vào giỏ từ modal
                                                        $(".add-to-cart-modal").click(function () {
                                                            const id = $(this).data("id");
                                                            if (!id || isNaN(id)) {
                                                                alert("❌ ID sản phẩm không hợp lệ");
                                                                return;
                                                            }
                                                            $.get("add-to-cart", {id: id}, function (data) {
                                                                try {
                                                                    const json = typeof data === "string" ? JSON.parse(data) : data;
                                                                    $(".cart-icon").html("🛒 Giỏ hàng (" + json.totalItems + ")");
                                                                    $("#addCartStatus").html("<span style='color:green;'>✔ Đã thêm!</span>");
                                                                    setTimeout(() => $("#addCartStatus").html(""), 3000);
                                                                } catch (e) {
                                                                    console.error("❌ Lỗi xử lý JSON:", e);
                                                                    alert("❌ Lỗi xử lý giỏ hàng");
                                                                }
                                                            }).fail(function (xhr) {
                                                                console.error("❌ AJAX lỗi:", xhr.responseText);
                                                                alert("❌ Không thể kết nối tới server hoặc ID không hợp lệ");
                                                            });
                                                        });

                                                        // Xử lý thêm vào giỏ từ nút trên product-card
                                                        $(".add-to-cart").click(function () {
                                                            const id = $(this).data("id");
                                                            if (!id || isNaN(id)) {
                                                                alert("❌ ID sản phẩm không hợp lệ");
                                                                return;
                                                            }
                                                            $.get("add-to-cart", {id: id}, function (data) {
                                                                try {
                                                                    const json = typeof data === "string" ? JSON.parse(data) : data;
                                                                    $(".cart-icon").html("🛒 Giỏ hàng (" + json.totalItems + ")");
                                                                    $("body").append('<div class="cart-success">✅ Đã thêm vào giỏ hàng!</div>');
                                                                    setTimeout(() => $(".cart-success").fadeOut(300, function () {
                                                                            $(this).remove();
                                                                        }), 3000);
                                                                } catch (e) {
                                                                    console.error("❌ Lỗi xử lý JSON:", e);
                                                                    alert("❌ Lỗi xử lý giỏ hàng");
                                                                }
                                                            }).fail(function (xhr) {
                                                                console.error("❌ AJAX lỗi:", xhr.responseText);
                                                                alert("❌ Không thể kết nối tới server hoặc ID không hợp lệ");
                                                            });
                                                        });
                                                    });
        </script>
    </body>
</html>
