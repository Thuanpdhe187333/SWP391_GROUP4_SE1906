<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Shop | E-Shopper</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->

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

                    <!-- Bên trái: Thông tin liên hệ -->
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

                    <!-- Ở giữa: Logo -->
                    <div style="flex: 1; display: flex; justify-content: center;">
                        <a href="home">
                            <img src="images/home/logo.png" alt="Logo" style="height: 100px;">
                        </a>
                    </div>

                    <!-- Bên phải: Account / Login -->

                    <div style="flex: 1; display: flex; justify-content: flex-end;">
                        <ul class="nav navbar-nav" style="margin: 0; padding: 0; list-style: none;">
                            <!-- Font Awesome 6 -->
                            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

                            <style>
                                .dropdown-hover {
                                    position: relative;
                                    display: inline-block;
                                    margin-left: 15px;
                                }

                                .dropdown-hover > a {
                                    color: #000;
                                    font-size: 14px;
                                    font-family: inherit;
                                    text-decoration: none;
                                }

                                .dropdown-hover .dropdown-menu {
                                    display: none;
                                    position: absolute;
                                    background-color: #f2f2f2; /* nền xám nhạt */
                                    min-width: 180px;
                                    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
                                    z-index: 1;
                                    border-radius: 4px;
                                }

                                .dropdown-hover:hover .dropdown-menu {
                                    display: block;
                                }

                                .dropdown-menu a {
                                    color: #000;
                                    padding: 10px 15px;
                                    display: flex;
                                    align-items: center;
                                    text-decoration: none;
                                    gap: 8px;
                                }

                                .dropdown-menu a:hover {
                                    background-color: #e0e0e0; /* khi hover */
                                }

                                .dropdown-menu i {
                                    width: 18px;
                                    text-align: center;
                                }
                            </style>

                            <li class="dropdown-hover">
                                <a href="#">
                                    <i class="fa fa-user"></i> Account
                                </a>
                                <div class="dropdown-menu">
                                    <a href="login.jsp"><i class="fa fa-sign-in-alt"></i> Login</a>
                                    <a href="register.jsp"><i class="fa fa-user-plus"></i> Register</a>

                                </div>
                            </li>



                            <li style="display: inline-block; margin-left: 15px;">
                                <a href="car.jsp" style="color: #000; font-size: 14px; font-family: inherit;">     
                                    <i class="fa fa-shopping-cart"></i> Cart

                                </a>
                            </li>

                            <li style="display: inline-block; margin-left: 0px;">
                                <a href="" style="color: red; font-size: 14px; font-family: inherit;">     
                                    <i class="fa fa-heart"></i> WishList

                                </a>
                            </li>

                        </ul>
                    </div>


                </div>
            </div>
        </div>


        <div class="header-bottom"><!--header-bottom-->
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
                            <style>
                                .mainmenu ul.nav > li > a:hover {
                                    color: #FF69B4 !important; /* Màu hồng */
                                    transition: color 0.3s;
                                }
                            </style>
                            <ul class="nav navbar-nav collapse navbar-collapse">
                                <li><a href="home" class="active" style="color: #FF69B4;">Home</a></li>
                                <li><a href="blog.jsp">Blog</a></li>
                                <li><a href="contact-us.jsp">Contact</a></li>
                                <li><a href="product-list">About Cosmetic</a></li>  
                            </ul>
                        </div>
                    </div>
                    <div class="search_box pull-right">
                        <form action="product-list" method="get" style="display: flex;">
                            <input type="text" name="search" value="${param.search}" placeholder="Tìm sản phẩm..." style="width: 140px; padding: 4px;">

                            <input type="hidden" name="category" value="${param.category}">
                            <input type="hidden" name="brand" value="${param.brand}">
                            <input type="hidden" name="sort" value="${param.sort}">
                            <input type="hidden" name="page" value="1">
                        </form>
                    </div>

                </div>
            </div>
        </div><!--/header-bottom-->
    </header><!--/header-->


    <section id="advertisement">
        <div class="container">
            <img src="images/shop/advertisement.jpg" alt="" />
        </div>
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="left-sidebar">
                        <h2>Category</h2>
                        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
                                                    <a href="#">${parent.categoryName}</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </h4>
                                    </div>

                                    <c:if test="${not empty parent.children}">
                                        <div id="cat${parent.categoryID}" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <ul>
                                                    <c:forEach var="child" items="${parent.children}">
                                                        <li><a href="product-list?category=${child.categoryID}">${child.categoryName}</a></li>
                                                        </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </c:forEach>

                        </div><!<!-- category -->

                        <div class="brands_products"><!--brands_products-->
                            <h2>Brands</h2>
                            <div class="brands-name">
                                <ul class="nav nav-pills nav-stacked">
                                    <c:forEach var="entry" items="${brandMap}">
                                        <c:set var="b" value="${entry.key}" />
                                        <c:set var="count" value="${entry.value}" />
                                        <li>
                                            <a href="product-list?brand=${b.brandID}">
                                                <span class="pull-right">(${count})</span>
                                                ${b.brandName}
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div><!--/brands_products-->

                        <div class="price-range"><!--price-range-->
                            <h2>Price Range</h2>
                            <div class="well">
                                <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
                                <b>$ 0</b> <b class="pull-right">$ 600</b>
                            </div>
                        </div><!--/price-range-->

                        <div class="shipping text-center"><!--shipping-->
                            <img src="images/home/shipping.jpg" alt="" />
                        </div><!--/shipping-->

                    </div>
                </div>

                <div class="col-sm-9 padding-right">
                    <div class="features_items"><!--features_items-->
                        <div class="text-right mb-3" style="margin-bottom: 20px;">
                            <form method="get" action="product-list" class="form-inline" style="display: inline-flex; align-items: center; gap: 6px;">
                                <input type="hidden" name="category" value="${param.category}">
                                <input type="hidden" name="brand" value="${param.brand}">
                                <input type="hidden" name="page" value="${currentPage}">

                                <label for="sort" class="control-label" style="margin-right: 5px;">Sắp xếp:</label>
                                <select name="sort" id="sort" onchange="this.form.submit()" class="form-control" style="height: 30px; padding: 2px 8px;">
                                    <option value="price_asc" ${param.sort == 'price_asc' ? 'selected' : ''}>Giá Tăng Dần ↑</option>
                                    <option value="price_desc" ${param.sort == 'price_desc' ? 'selected' : ''}>Giá Giảm Dần ↓</option>
                                </select>
                            </form>
                        </div>


                        <h2 class="title text-center">Features Items</h2>
                        <c:forEach var="p" items="${productList}">
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="${p.image}" alt="" style="height:200px; object-fit:cover;" />
                                            <h2>$${p.price}</h2>
                                            <p>${p.productName}</p>
                                            <a href="#" class="btn btn-default add-to-cart">
                                                <i class="fa fa-shopping-cart"></i>Add to cart
                                            </a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>$${p.price}</h2>
                                                <p>${p.productName}</p>
                                                <a href="#" class="btn btn-default add-to-cart">
                                                    <i class="fa fa-shopping-cart"></i>Add to cart
                                                </a>
                                            </div>
                                        </div>
                                    </div>
<!--                                    <div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>-->
                                </div>
                            </div>
                        </c:forEach>

                        <!-- Optional pagination -->
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li>
                                    <a href="product-list?page=${currentPage - 1}&sort=${param.sort}&category=${param.category}&brand=${param.brand}">
                                        &laquo; Prev
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="${i == currentPage ? 'active' : ''}">
                                    <a href="product-list?page=${i}&sort=${param.sort}&category=${param.category}&brand=${param.brand}">
                                        ${i}
                                    </a>
                                </li>
                            </c:forEach>

                            <c:if test="${currentPage < totalPages}">
                                <li>
                                    <a href="product-list?page=${currentPage + 1}&sort=${param.sort}&category=${param.category}&brand=${param.brand}">
                                        Next &raquo;
                                    </a>
                                </li>
                            </c:if>
                        </ul>

                    </div><!--features_items-->
                </div>
            </div>
        </div>
    </section>

    <footer id="footer"><!--Footer-->
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-sm-2">
                        <div class="companyinfo">
                            <h2><span>e</span>-shopper</h2>
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
                            <p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
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
                                <li><a href="">Online Help</a></li>
                                <li><a href="">Contact Us</a></li>
                                <li><a href="">Order Status</a></li>
                                <li><a href="">Change Location</a></li>
                                <li><a href="">FAQ’s</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="single-widget">
                            <h2>Quock Shop</h2>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="">T-Shirt</a></li>
                                <li><a href="">Mens</a></li>
                                <li><a href="">Womens</a></li>
                                <li><a href="">Gift Cards</a></li>
                                <li><a href="">Shoes</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="single-widget">
                            <h2>Policies</h2>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="">Terms of Use</a></li>
                                <li><a href="">Privecy Policy</a></li>
                                <li><a href="">Refund Policy</a></li>
                                <li><a href="">Billing System</a></li>
                                <li><a href="">Ticket System</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="single-widget">
                            <h2>About Shopper</h2>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="">Company Information</a></li>
                                <li><a href="">Careers</a></li>
                                <li><a href="">Store Location</a></li>
                                <li><a href="">Affillate Program</a></li>
                                <li><a href="">Copyright</a></li>
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
                    <p class="pull-left">Copyright © 2013 E-Shopper. All rights reserved.</p>
                    <p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
                </div>
            </div>
        </div>

    </footer><!--/Footer-->



    <script src="js/jquery.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
