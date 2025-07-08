<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Xác Minh OTP | Cosmetic Shop</title>
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
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                margin-top: -20px;
            }
            label {
                color: #FF69B4;
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }
            input[type="text"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                background-color: #FF69B4;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 35%;
                display: block;
                margin: 0 auto;
            }
            input[type="submit"]:hover {
                background-color: #C14489;
            }
            .message {
                text-align: center;
                margin-bottom: 15px;
                color: red;
            }
            .back-button {
                background-color: #FF69B4;
                color: white;
                border: none;
                padding: 8px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                position: absolute;
                top: -15px;
                right: 20px;
                cursor: pointer;
                border-radius: 4px;
            }
            .back-button:hover {
                background-color: #C14489;
            }
            .change-password {
                font-weight: bold;
                color: #FF69B4;
                text-align: center;
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
                                        <li style="display: inline-block; margin-left: 15px;" class="dropdown admin-dropdown">
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
                            <ul class="nav navbar-nav collapse navbar-collapse">
                                <li><a href="home?page=1" class="active" style="color: #FF69B4;">Trang Chủ</a></li>
                                <li><a href="">Tạp Chí Làm Đẹp</a></li>
                                <li><a href="">Ưu Đãi</a></li>
                                <li><a href="">Liên Hệ</a></li>
                                <li><a href="">Về Cosmetic</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Verify OTP Section -->
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-container">
                            <h2 class="change-password">Xác Minh OTP</h2>
                            <% String message = (String) request.getAttribute("message"); %>
                            <% if (message != null) { %>
                            <p class="message"><%= message %></p>
                            <% } %>
                            <form action="VerifyOtpServlet" method="post">
                                <label for="otp">Nhập OTP:</label>
                                <input type="text" id="otp" name="otp" required>
                                <input type="submit" value="Xác Thực">
                            </form>
                            <a href="forgot_password.jsp" class="back-button">⬅ Quay Lại</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer id="footer">
            <!-- Newsletter Section (ĐÃ THU NHỎ VÀ CĂN GIỮA) -->
            <div style="background-color: #FF69B4; padding: 17px 20px; border-radius: 12px; margin: 0px auto; max-width: 1172px;">
                <div class="container" style="margin: 0 auto;">
                    <div class="row" style="
                         display: flex;
                         flex-wrap: wrap;
                         align-items: center;
                         justify-content: space-between;
                         gap: 10px;
                         ">
                        <!-- Bên trái -->
                        <div style="    margin-left: 15px; flex: 1 1 60%; color: white; line-height: 1.2;">
                            <h3 style="font-weight: bold; text-transform: uppercase; margin: 0; font-size: 20px;">
                                NHẬN BẢN TIN LÀM ĐẸP
                            </h3>
                            <p style="margin: 0; font-size: 13px;">Đừng bỏ lỡ hàng ngàn sản phẩm và chương trình siêu hấp dẫn</p>
                        </div>

                        <!-- Bên phải -->
                        <div style="flex: 1 1 35%; display: flex; justify-content: flex-end; margin-right: 22px;">
                            <form 
                                style="display: flex; background-color: #f78fb3; padding: 4px 8px; border-radius: 25px;">
                                <input type="email" name="email" placeholder="Điền email của bạn"
                                       style="border: none; outline: none; background: transparent; color: white; padding: 6px 8px; font-size: 13px;">
                                <button 
                                    style="background-color: transparent; border: none; color: white; font-weight: bold; padding: 6px 12px; cursor: pointer; font-size: 13px; white-space: nowrap;">
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
        <!-- Scripts -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/11.0.2/bootstrap-slider.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
