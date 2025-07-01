<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Customer Manager | Cosmetic Shop</title>
    <!-- Đảm bảo đường dẫn đúng với cấu trúc dự án -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/prettyPhoto.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/price-range.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/cssindex.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/11.0.2/css/bootstrap-slider.min.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-57-precomposed.png">
    <style>
        .form-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-top: -22px;
            padding: 20px;
            position: relative;
        }
        h2 {
            color: #FF69B4;
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
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
            vertical-align: middle;
        }
        th {
            background-color: #FF69B4;
            color: white;
            font-weight: bold;
        }
        .search-form {
            margin-bottom: 20px;
            display: flex;
            gap: 10px;
            flex-wrap: nowrap;
            align-items: center;
        }
        .search-form input, .search-form select, .search-form button {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            flex: 1;
            min-width: 0;
        }
        .search-form button {
            background-color: #FF69B4;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
            flex: 0 0 auto;
        }
        .search-form button:hover {
            background-color: #C14489;
        }
        .pagination {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        .pagination a {
            padding: 8px 12px;
            text-decoration: none;
            color: #FF69B4;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .pagination a:hover {
            background-color: #C14489;
            color: white;
        }
        .pagination a.active {
            background-color: #FF69B4;
            color: white;
            border: none;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #c3e6cb;
            border-radius: 4px;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #f5c6cb;
            border-radius: 4px;
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
            top: 11px;
            right: 15px;
            cursor: pointer;
            border-radius: 4px;
        }
        .back-button:hover {
            background-color: #C14489;
        }
        .action-button {
            background-color: #ff3333;
            color: white;
            border: none;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 12px;
            margin: 2px;
            cursor: pointer;
            border-radius: 4px;
        }
        .action-button:hover {
            background-color: #cc0000;
        }
        .edit-button {
            background-color: #FF69B4;
        }
        .edit-button:hover {
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
                        <img src="${pageContext.request.contextPath}/images/home/logo1.png" alt="Logo" style="height: 100px;">
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
                                        <li><a href="${pageContext.request.contextPath}/change_password.jsp">Change Password</a></li>
                                         <form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="post" style="display: none;"></form>
                                        <c:if test="${currentUser != null}">
                                            <c:if test="${currentUser.role == 'Customer'}">
                                                <li><a href="order-history">Lịch sử mua hàng</a></li>
                                            </c:if>
                                        </c:if>
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
                                            <li><a href="${pageContext.request.contextPath}/orders">Quản lý đơn hàng</a></li>
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

    <!-- Customer Manager Section -->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-container">
                        <a href="${pageContext.request.contextPath}/home" class="back-button">Quay Lại</a>
                        <h2>Customer Manager</h2>
                        <c:if test="${not empty message}">
                            <div class="${message.contains('success') ? 'success' : 'error'}">${message}</div>
                            <% session.removeAttribute("message"); %>
                        </c:if>
                        <form method="get" action="${pageContext.request.contextPath}/manager/customers" class="search-form">
                            <input type="text" name="search" value="${search}" placeholder="Search by Username, FullName, Email">
                            <select name="roleFilter">
                                <option value="Customer" ${roleFilter == 'Customer' ? 'selected' : ''}>Customer</option>
                            </select>
                            <select name="sort">
                                <option value="">No Sort</option>
                                <option value="FullName ASC" ${sort == 'FullName ASC' ? 'selected' : ''}>FullName Asc</option>
                                <option value="FullName DESC" ${sort == 'FullName DESC' ? 'selected' : ''}>FullName Desc</option>
                                <option value="CreatedAt ASC" ${sort == 'CreatedAt ASC' ? 'selected' : ''}>Created At Asc</option>
                                <option value="CreatedAt DESC" ${sort == 'CreatedAt DESC' ? 'selected' : ''}>Created At Desc</option>
                            </select>
                            <button type="submit">Apply</button>
                        </form>

                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Username</th>
                                    <th>FullName</th>
                                    <th>Email</th>
                                    <th>Phone Number</th>
                                    <th>Address</th>
                                    <th>Gender</th>
                                    <th>Created At</th>
                                    <th>Role</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${customers}">
                                    <tr>
                                        <td>${user.userId}</td>
                                        <td>${user.username}</td>
                                        <td>${user.fullName}</td>
                                        <td>${user.email}</td>
                                        <td>${user.phoneNumber}</td>
                                        <td>${user.address}</td>
                                        <td>${user.gender}</td>
                                        <td><fmt:formatDate value="${user.createdAt}" pattern="dd/MM/yyyy HH:mm" /></td>
                                        <td>${user.role}</td>
                                        <td class="action">
                                            <a href="${pageContext.request.contextPath}/manager/customers?action=edit&id=${user.userId}" class="action-button edit-button">Edit</a>
                                            <a href="${pageContext.request.contextPath}/manager/customers?action=delete&id=${user.userId}"
                                               onclick="return confirm('Are you sure you want to delete user ID ${user.userId}?');" class="action-button">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
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
                                        <img src="${pageContext.request.contextPath}/images/home/iframe1.png" alt="" />
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
                                        <img src="${pageContext.request.contextPath}/images/home/iframe2.png" alt="" />
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
                                        <img src="${pageContext.request.contextPath}/images/home/iframe3.png" alt="" />
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
                                        <img src="${pageContext.request.contextPath}/images/home/iframe4.png" alt="" />
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
                            <img src="${pageContext.request.contextPath}/images/home/map.png" alt="" />
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
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.scrollUp.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/11.0.2/bootstrap-slider.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
