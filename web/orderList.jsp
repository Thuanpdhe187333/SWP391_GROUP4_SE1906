
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Order Management | Cosmetic Shop</title>
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
        <style>
            .form-container {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                margin-top: 28px;
            }
            h2 {
                color: #FF69B4;
                text-align: center;
                font-weight: bold;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 7px;
                text-align: center;
            }
            th {
                background-color: #FF69B4;
                color: white;
                font-weight: bold;
            }
            img {
                max-width: 250px;
                height: auto;
            }
            .product-row {
                display: flex;
                align-items: center;
                margin-bottom: 5px;
            }
            .product-image {
                margin-right: 10px;
            }
            .action-link {
                padding: 5px 10px;
                text-decoration: none;
                border-radius: 4px;
                margin-right: 5px;
                display: inline-block;
            }
            .edit-link {
                background-color: #4CAF50;
                color: white;
            }
            .edit-link:hover {
                background-color: #45a049;
            }
            .delete-link {
                background-color: #f44336;
                color: white;
            }
            .delete-link:hover {
                background-color: #da190b;
            }
            .reject-link {
                background-color: #ffeb3b;
                color: black;
            }
            .reject-link:hover {
                background-color: #fdd835;
            }
            .back-button {
                background-color: #FF69B4;
                color: white;
                border: none;
                padding: 10px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                position: absolute;
                top: -12px;
                right: 15px;
                cursor: pointer;
                border-radius: 4px;
            }
            .back-button:hover {
                background-color: #C14489;
            }
        </style>
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
                                            <li><a href="change_password.jsp">Change Password</a></li>
                                                <c:if test="${currentUser != null}">
                                                    <c:if test="${currentUser.role == 'Customer'}">
                                                    <li><a href="order-history">Lịch sử mua hàng</a></li>
                                                    </c:if>
                                                </c:if>
                                            <li><a href="#" onclick="document.getElementById('logoutForm').submit(); return false;">Logout</a></li>
                                        </ul>
                                        <form id="logoutForm" action="logout" method="post" style="display: none;"></form>
                                    </li>
                                    <c:if test="${sessionScope.currentUser.role == 'Manager'}">
                                        <li style="display: inline-block; margin-left: 15px;" class="dropdown admin-dropdown">
                                            <a href="#" style="color: #000; font-size: 14px; font-family: inherit;" data-toggle="dropdown">
                                                <i class="fa fa-cog"></i> Quản lý
                                                <b class="caret"></b>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="orders">Quản lý đơn hàng</a></li>
                                                <li><a href="${pageContext.request.contextPath}/manager/customers">Quản lý người dùng</a></li>
                                            </ul>
                                        </li>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <li style="display: inline-block; margin-left: 15px;">
                                        <a href="login.jsp" style="color: #000; font-size: 14px; font-family: inherit;">
                                            <i class="fa fa-lock"></i> Login
                                        </a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <li style="display: inline-block; margin-left: 15px;">
                                <a href="cart.jsp" style="color: #000; font-size: 14px; font-family: inherit;">
                                    <i class="fa fa-shopping-cart"></i> Cart
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Order List Section -->
        <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-container">
                        <h2>Order List (Manager View)</h2>
                        <a href="${pageContext.request.contextPath}/home" class="back-button">Quay Lại</a>
                        <table>
                            <tr>
                                <th>ID</th>
                                <th>Customer</th>
                                <th>Email</th>
                                <th>Product Image</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Status</th>
                                <th>Total</th>
                                <th>Date</th>
                                <th>Actions</th>
                            </tr>
                            <c:forEach var="o" items="${orders}">
                                <tr>
                                    <td>${o.orderID}</td>
                                    <td>${o.fullName}</td>
                                    <td>${o.email}</td>
                                    <td>
                                        <c:forEach var="item" items="${orderDAO.getOrderItems(o.orderID)}" varStatus="loop">
                                            <div class="product-row">
                                                <div class="product-image"><img src="${item.image}" alt="${item.productName}" /></div>
                                            </div>
                                            <c:if test="${!loop.last}"><hr></c:if>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <c:forEach var="item" items="${orderDAO.getOrderItems(o.orderID)}" varStatus="loop">
                                            ${item.productName}
                                            <c:if test="${!loop.last}"><br></c:if>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <c:forEach var="item" items="${orderDAO.getOrderItems(o.orderID)}" varStatus="loop">
                                            ${item.quantity}
                                            <c:if test="${!loop.last}"><br></c:if>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <c:forEach var="item" items="${orderDAO.getOrderItems(o.orderID)}" varStatus="loop">
                                            ${item.price}
                                            <c:if test="${!loop.last}"><br></c:if>
                                        </c:forEach>
                                    </td>
                                    <td>${o.status}</td>
                                    <td>${o.totalAmount}</td>
                                    <td>${o.orderDate}</td>
                                    <td>
                                        <a href="orders?action=edit&id=${o.orderID}" class="action-link edit-link">Edit</a>
                                        <a href="orders?action=reject&id=${o.orderID}" class="action-link reject-link" onclick="return confirm('Reject this order?')">Reject</a>
                                        <a href="orders?action=delete&id=${o.orderID}" class="action-link delete-link" onclick="return confirm('Delete this order?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

        <!-- Footer -->
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="companyinfo">
                                <h2><span>Cosmetic</span> Shop</h2>
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

        <!-- Scripts -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/11.0.2/bootstrap-slider.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
