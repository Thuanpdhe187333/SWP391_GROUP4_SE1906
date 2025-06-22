<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register | E-Shopper</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- E-Shopper styles -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet"> 
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
</head>
<body>
    <header id="header">
        <!-- Copy phần header từ login.html vào đây nếu cần -->
    </header>

    <section id="form"><!--form-->
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <div class="signup-form"><!--sign up form-->
                        <h2>New User Signup!</h2>

                        <!-- Thông báo lỗi -->
                        <% if (request.getAttribute("errorMessage") != null) { %>
                            <div class="alert alert-danger">
                                <%= request.getAttribute("errorMessage") %>
                            </div>
                        <% } %>

                        <form action="register" method="post" id="registerForm">
                            <input type="text" name="username" placeholder="Username *" required>
                            <input type="email" name="email" placeholder="Email *" required>
                            <input type="password" name="password" id="password" placeholder="Password *" required>
                            <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password *" required>
                            <input type="text" name="phoneNumber" placeholder="Phone Number">
                            <input type="text" name="identityCard" placeholder="Identity Card *" required>
                            
                            <select name="gender" class="form-control mb-3">
                                <option value="">Select Gender</option>
                                <option value="Nam">Nam</option>
                                <option value="Nữ">Nữ</option>
                                <option value="Khác">Khác</option>
                            </select>

                            <input type="date" name="dob" class="form-control mb-3" placeholder="Date of Birth">

                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="terms" required> I agree to the Terms and Conditions
                                </label>
                            </div>

                            <button type="submit" class="btn btn-default">Register</button>
                            <p class="mt-3">Already have an account? <a href="login.jsp">Login here</a></p>
                        </form>
                    </div><!--/sign up form-->
                </div>
            </div>
        </div>
    </section><!--/form-->

    <footer id="footer">
        <!-- Copy phần footer từ login.html vào đây nếu cần -->
    </footer>

    <!-- JS -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        // Kiểm tra mật khẩu xác nhận
        document.getElementById('registerForm').addEventListener('submit', function(event) {
            const pass = document.getElementById("password").value;
            const confirm = document.getElementById("confirmPassword").value;
            if (pass !== confirm) {
                event.preventDefault();
                alert("Password confirmation does not match.");
            }
        });
    </script>
</body>
</html>
