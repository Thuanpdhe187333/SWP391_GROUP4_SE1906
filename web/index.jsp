<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Product, java.util.List, java.util.Map, model.Brand, model.Category, dal.BrandDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% BrandDAO brandDAO = new BrandDAO(); %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Trang Chủ | Cosmetic Shop</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href="css/cssindex.css" rel="stylesheet">
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
                        <a href="home?page=1">
                            <img src="images/home/logo1.png" alt="Logo" style="height: 100px;">
                        </a>
                    </div>
                    <div style="flex: 1; display: flex; justify-content: flex-end;">
                        <ul class="nav navbar-nav user-nav">
                            <li style="display: inline-block; margin-left: 15px;">
                                <a href="login.jsp" style="color: #000; font-size: 14px; font-family: inherit;">
                                    <i class="fa fa-lock"></i> Đăng Nhập 
                                </a>
                            </li>
                            <li style="display: inline-block; margin-left: 15px;">
                                <a href="cart.jsp" style="color: #000; font-size: 14px; font-family: inherit;">
                                    <i class="fa fa-shopping-cart"></i> Giỏ Hàng
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
                                <li><a href="home" class="active" style="color: #FF69B4;">Trang Chủ</a></li>
                                <li><a href="">Tạp Chí Làm Đẹp</a></li>
                                <li><a href="">Ưu Đãi</a></li>
                                <li><a href="">Liên Hệ</a></li>
                                <li><a href="">Về Cosmetic</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="search_box pull-right">
                            <form action="search" method="get">
                                <input type="text" name="keyword" placeholder="Tìm kiếm" value="${fn:escapeXml(keyword)}"/>
                                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                            </form>
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
                                        <h2>🌸 Tự nhiên & dịu dàng</h2>
                                        <p>"Mỹ phẩm thiên nhiên – nuôi dưỡng làn da bạn yêu."</p>
                                        <button type="button" class="btn btn-default get">Mua Ngay</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/home/mypham1.jpg" class="girl img-responsive" alt="" />
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="col-sm-6">
                                        <h1><span>Cosmetic</span>Shop</h1>
                                        <h2>💄 Thời thượng & cá tính</h2>
                                        <p>"Trang điểm là nghệ thuật, bạn là kiệt tác." </p>
                                        <button type="button" class="btn btn-default get">Mua Ngay</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/home/mypham2.jpg" class="girl img-responsive" alt="" />
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="col-sm-6">
                                        <h1><span>Cosmetic</span>Shop</h1>
                                        <h2>🌿 Thiên nhiên & dịu nhẹ</h2>
                                        <p>"Đẹp tự nhiên – An toàn từ bên trong."</p>
                                        <button type="button" class="btn btn-default get">Mua Ngay</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/home/mypham3.jpg" class="girl img-responsive" alt="" />
                                    </div>
                                </div>
                            </div>
                            <!-- Nút điều hướng bên trái (Quay lại) -->
                            <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>

                            <!-- Nút điều hướng bên phải (Tiếp theo) -->
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
                            <h2>Loại Sản Phẩm</h2>
                            <div class="panel-group category-products" id="accordian">
                                <c:forEach var="parent" items="${categoryList}">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <c:choose>
                                                    <c:when test="${not empty parent.children}">
                                                        <a data-toggle="collapse" data-parent="#accordian" href="#cat${parent.categoryId}">
                                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                            ${parent.categoryName}
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="home?category=${parent.categoryId}&page=1">${parent.categoryName}</a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </h4>
                                        </div>
                                        <c:if test="${not empty parent.children}">
                                            <div id="cat${parent.categoryId}" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <ul>
                                                        <c:forEach var="child" items="${parent.children}">
                                                            <li><a href="home?category=${child.categoryId}&page=1">${child.categoryName}</a></li>
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
                                                <a href="home?brand=${brand.brandId}&page=1">
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
                                    <input type="hidden" name="page" value="1">
                                    <c:if test="${not empty param.category}">
                                        <input type="hidden" name="category" value="${param.category}">
                                    </c:if>
                                    <c:if test="${not empty param.brand}">
                                        <input type="hidden" name="brand" value="${param.brand}">
                                    </c:if>
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
                    <div class="col-sm-9 padding-right">
                        <section class="product-section">
                            <div class="product-grid">
                                <c:choose>
                                    <c:when test="${not empty products}">
                                        <c:set var="pageSize" value="15" />
                                        <c:set var="currentPage" value="${empty param.page ? 1 : param.page}" />
                                        <c:set var="startIndex" value="${(currentPage - 1) * pageSize}" />
                                        <c:set var="endIndex" value="${startIndex + pageSize - 1}" />
                                        <c:set var="totalProducts" value="${fn:length(products)}" />
                                        <c:set var="totalPages" value="${(totalProducts + pageSize - 1) div pageSize}" />

                                        <c:forEach var="p" items="${products}" begin="${startIndex}" end="${endIndex}">
                                            <div class="product-card">
                                                <div class="product-image-container">
                                                    <img src="${fn:escapeXml(p.image)}" alt="${fn:escapeXml(p.productName)}" class="product-image">
                                                    <button type="button" class="btn btn-info quick-view-btn" 
                                                            data-toggle="modal" data-target="#productModal" 
                                                            data-id="${p.productId}" 
                                                            data-name="${fn:escapeXml(p.productName)}" 
                                                            data-price="${p.price}" 
                                                            data-image="${fn:escapeXml(p.image)}"
                                                            data-description="${fn:escapeXml(p.description)}"
                                                            data-brand="<%= brandDAO.getBrandName(((Product)pageContext.getAttribute("p")).getBrandId()) != null ? brandDAO.getBrandName(((Product)pageContext.getAttribute("p")).getBrandId()) : "Không rõ" %>">
                                                        Xem Nhanh
                                                    </button>
                                                </div>
                                                <h3 class="product-name">
                                                    <a href="product-detail?id=${p.productId}">${fn:escapeXml(p.productName)}</a>
                                                </h3>
                                                <p class="price">
                                                    <c:out value="${p.price != null ? String.format('%,.0f', p.price) : 'N/A'}" /> VND
                                                </p>
                                                <p class="brand">
                                                    <strong>Thương Hiệu:</strong> <%= brandDAO.getBrandName(((Product)pageContext.getAttribute("p")).getBrandId()) != null ? brandDAO.getBrandName(((Product)pageContext.getAttribute("p")).getBrandId()) : "Không rõ" %>
                                                </p>
                                                <button type="button" class="btn btn-warning add-to-cart-modal"
                                                        data-id="${p.productId}"
                                                        data-name="${fn:escapeXml(p.productName)}"
                                                        data-price="${p.price}">🛒 Thêm Vào Giỏ</button>
                                            </div>
                                        </c:forEach>

                                        <!-- Pagination Controls -->
                                        <div class="pagination" style="text-align: center; margin-top: 20px;">
                                            <c:if test="${currentPage > 1}">
                                                <a href="home?page=${currentPage - 1}${not empty param.category ? '&category=' : ''}${param.category}${not empty param.brand ? '&brand=' : ''}${param.brand}${not empty param.priceRange ? '&priceRange=' : ''}${param.priceRange}" 
                                                   class="btn btn-default" style="margin-right: 10px;">
                                                    Trước
                                                </a>
                                            </c:if>
                                            <c:forEach var="i" begin="1" end="${totalPages}">
                                                <a href="home?page=${i}${not empty param.category ? '&category=' : ''}${param.category}${not empty param.brand ? '&brand=' : ''}${param.brand}${not empty param.priceRange ? '&priceRange=' : ''}${param.priceRange}" 
                                                   class="btn btn-default ${i == currentPage ? 'active' : ''}" style="margin: 0 5px;">
                                                    ${i}
                                                </a>
                                            </c:forEach>
                                            <c:if test="${currentPage < totalPages}">
                                                <a href="home?page=${currentPage + 1}${not empty param.category ? '&category=' : ''}${param.category}${not empty param.brand ? '&brand=' : ''}${param.brand}${not empty param.priceRange ? '&priceRange=' : ''}${param.priceRange}" 
                                                   class="btn btn-default" style="margin-left: 10px;">
                                                    Tiếp
                                                </a>
                                            </c:if>
                                        </div>
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
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
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
                                                    <p><strong>Thương Hiệu:</strong> <span id="modalBrand"></span></p>
                                                    <p><strong>Mô Tả:</strong> <span id="modalDescription"></span></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer custom-modal-footer">
                                            <div style="display: flex; align-items: center; background-color: #f9f9f9; border: 1px solid #ccc; border-radius: 20px; padding: 5px 10px;">
                                                <button type="button" onclick="document.getElementById('quantity').stepDown(); updateQuantity();" style="background: none; border: none; font-size: 16px; cursor: pointer; padding: 0 5px;">−</button>
                                                <input type="number" id="quantity" name="quantity" min="1" value="1" style="width: 40px; text-align: center; border: none; background: none; font-size: 16px; -moz-appearance: textfield;">
                                                <button type="button" onclick="document.getElementById('quantity').stepUp(); updateQuantity();" style="background: none; border: none; font-size: 16px; cursor: pointer; padding: 0 5px;">+</button>
                                            </div>
                                            <button type="button" class="btn btn-cart add-to-cart-modal" data-id="" data-name="" data-price="">🛒 Thêm Vào Giỏ</button>
                                            <a href="" id="viewDetailsBtn" class="btn btn-view-details">Xem Chi Tiết Sản Phẩm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer id="footer">
            <!-- Newsletter Section -->
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
                    <div class="row d-flex justify-content-between flex-wrap">
                        <div class="col-sm-2">
                            <div class="single-widget text-center">
                                <h2>
                                    <img src="images/home/logo2.png" alt="Logo" style="margin-left: -32px; width: 130%;">
                                </h2>
                                <ul class="social-list" style="display: flex; justify-content: center; gap: 10px; list-style: none; padding-left: 0;">
                                    <li>
                                        <a href="https://facebook.com" target="_blank">
                                            <img src="images/home/logo3.png" alt="Facebook" width="32" height="32">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://instagram.com" target="_blank">
                                            <img src="images/home/logo4.png" alt="Instagram" width="33" height="33">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://tiktok.com" target="_blank">
                                            <img src="images/home/logo5.png" alt="TikTok" width="32" height="32">
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>VỀ COSMETIC SHOP</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Câu chuyện thương hiệu</a></li>
                                    <li><a href="#">Về chúng tôi</a></li>
                                    <li><a href="#">Liên hệ</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>CHÍNH SÁCH</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Chính sách và quy định chung</a></li>
                                    <li><a href="#">Chính sách và giao nhận thanh toán</a></li>
                                    <li><a href="#">Chính sách đổi trả sản phẩm</a></li>
                                    <li><a href="#">Chính sách bảo mật thông tin cá nhân</a></li>
                                    <li><a href="#">Điều khoản sử dụng</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>MY COSMETIC SHOP</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Quyền lợi thành viên</a></li>
                                    <li><a href="#">Thông tin thành viên</a></li>
                                    <li><a href="#">Theo dõi đơn hàng</a></li>
                                    <li><a href="#">Hướng dẫn mua hàng online</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="single-widget">
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

        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/11.0.2/bootstrap-slider.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script>
            $(document).ready(function () {
                $(".quick-view-btn").click(function () {
                    const productId = $(this).data("id");
                    const productName = $(this).data("name");
                    const price = $(this).data("price");
                    const description = $(this).data("description");
                    const image = $(this).data("image");
                    const brandName = $(this).data("brand");

                    $("#modalProductName").text(productName);
                    $("#modalPrice").text(price != null ? Math.floor(price).toLocaleString('vi-VN') : 'N/A');
                    $("#modalDescription").text(description || 'No description');
                    $("#modalBrand").text(brandName || 'Không rõ');
                    $(".product-modal-image").attr("src", image || 'images/default-image.jpg');
                    $("#viewDetailsBtn").attr("href", "product-detail?id=" + productId);
                    $(".add-to-cart-modal").data("id", productId).data("name", productName).data("price", price);
                    $("#quantity").val(1);
                });

                function updateQuantity() {
                    let quantity = parseInt($("#quantity").val()) || 1;
                    if (quantity < 1) {
                        $("#quantity").val(1);
                    }
                }

                $(".add-to-cart-modal").click(function () {
                    const id = $(this).data("id");
                    let quantity = parseInt($("#quantity").val()) || 1;

                    if (!id || isNaN(id)) {
                        alert("❌ Invalid product Id");
                        return;
                    }

                    if (quantity < 1) {
                        alert("❌ Quantity must be greater than 0");
                        return;
                    }

                    $.get("add-to-cart", {id: id, quantity: quantity}, function (data) {
                        try {
                            const json = typeof data === "string" ? JSON.parse(data) : data;
                            if (json.error) {
                                alert("❌ " + json.error);
                                return;
                            }
                            $(".cart-icon").html("🛒 Cart (" + json.totalItems + ")");
                            $("#addCartStatus").html("<span style='color:green;'>✔ Added " + quantity + " product!</span>");
                            setTimeout(() => $("#addCartStatus").html(""), 3000);
                        } catch (e) {
                            console.error("❌ Processing Error JSON:", e);
                            alert("❌ Error Processing Cart");
                        }
                    }).fail(function (xhr) {
                        console.error("❌ AJAX Error:", xhr.responseText);
                        alert("❌ Unable To Connect To Server");
                    });
                    $('#productModal').modal('hide');
                });

                $(".add-to-cart").click(function () {
                    const id = $(this).data("id");
                    if (!id || isNaN(id)) {
                        alert("❌ Invalid Product Id");
                        return;
                    }
                    $.get("add-to-cart", {id: id}, function (data) {
                        try {
                            const json = typeof data === "string" ? JSON.parse(data) : data;
                            $(".cart-icon").html("🛒 Cart (" + json.totalItems + ")");
                            $("body").append('<div class="cart-success">✅ Added To Cart!</div>');
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