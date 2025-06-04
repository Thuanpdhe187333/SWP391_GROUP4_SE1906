<%-- 
    Document   : newjsp
    Created on : Jun 4, 2025, 12:03:58 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Về Chúng Tôi - Cosmetic Shop</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #fff0f5;
            display: flex;
            justify-content: center; 
            align-items: center;     
            flex-direction: column;
        }
        .container {
            max-width: 800px;
            width: 90%;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            box-sizing: border-box;
            text-align: center;
        }
        h1 {
            color: #d63384;
            margin-bottom: 20px;
        }
        p {
            line-height: 1.6;
            color: #333;
            font-size: 18px;
            margin-bottom: 15px;
        }
        /* Footer */
        footer {
            background-color: #f8bbd0;
            padding: 20px 0;
            text-align: center;
            color: #a61d5d;
            width: 100%;
            position: fixed;
            bottom: 0;
            left: 0;
        }
        .social-icons {
    display: flex;
    justify-content: center;
    gap: 50px;  
    margin-bottom: 10px;
}
        .social-icons a {
    color: #d63384;
    text-decoration: none;
    font-size: 24px;
    transition: color 0.3s ease;
    margin: 0 25px; 
}
        .social-icons a:hover {
            color: #a61d5d;
        }
        .social-icons svg {
            width: 30px;
            height: 30px;
            fill: currentColor;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Về Chúng Tôi</h1>
        <p>Cosmetic Shop được thành lập với sứ mệnh mang đến cho khách hàng những sản phẩm làm đẹp chất lượng, an toàn và phù hợp với mọi loại da. Chúng tôi cam kết cung cấp các sản phẩm chính hãng với mức giá hợp lý và dịch vụ chăm sóc khách hàng tận tâm.</p>
        <p>Với đội ngũ chuyên viên giàu kinh nghiệm, Cosmetic Shop không ngừng cập nhật các xu hướng làm đẹp mới nhất và luôn nỗ lực để trở thành nơi tin cậy của mọi người yêu thích làm đẹp.</p>
    </div>

    <footer>
        <div class="social-icons">
            <a href="https://facebook.com" target="_blank" aria-label="Facebook">
                <svg viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M22.675 0h-21.35C.6 0 0 .6 0 1.325v21.351C0 23.4.6 24 1.325 24H12.82v-9.294H9.692v-3.622h3.128V8.413c0-3.1 1.893-4.788 4.658-4.788 1.325 0 2.466.099 2.797.143v3.243l-1.918.001c-1.504 0-1.796.715-1.796 1.763v2.31h3.587l-.467 3.622h-3.12V24h6.116c.725 0 1.324-.6 1.324-1.324V1.325C24 .6 23.4 0 22.675 0z"/>
                </svg>
            </a>
            <a href="https://instagram.com" target="_blank" aria-label="Instagram">
                <svg viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M12 2.163c3.204 0 3.584.012 4.85.07 1.366.062 2.633.337 3.608 1.312.975.975 1.25 2.242 1.312 3.608.058 1.266.07 1.646.07 4.85s-.012 3.584-.07 4.85c-.062 1.366-.337 2.633-1.312 3.608-.975.975-2.242 1.25-3.608 1.312-1.266.058-1.646.07-4.85.07s-3.584-.012-4.85-.07c-1.366-.062-2.633-.337-3.608-1.312-.975-.975-1.25-2.242-1.312-3.608C2.175 15.747 2.163 15.367 2.163 12s.012-3.584.07-4.85c.062-1.366.337-2.633 1.312-3.608.975-.975 2.242-1.25 3.608-1.312C8.416 2.175 8.796 2.163 12 2.163zm0-2.163C8.741 0 8.332.013 7.052.072 5.77.131 4.603.44 3.513 1.53 2.423 2.62 2.114 3.787 2.055 5.07.997 8.328.997 15.672 2.055 18.93c.059 1.283.368 2.45 1.458 3.54 1.09 1.09 2.257 1.399 3.54 1.458 3.258 1.058 10.602 1.058 13.86 0 1.283-.059 2.45-.368 3.54-1.458 1.09-1.09 1.399-2.257 1.458-3.54 1.058-3.258 1.058-10.602 0-13.86-.059-1.283-.368-2.45-1.458-3.54C19.45.44 18.283.131 17 .072 15.72.013 15.309 0 12 0z"/>
                    <path d="M12 5.838a6.162 6.162 0 1 0 0 12.324 6.162 6.162 0 0 0 0-12.324zm0 10.162a3.999 3.999 0 1 1 0-7.998 3.999 3.999 0 0 1 0 7.998z"/>
                    <circle cx="18.406" cy="5.594" r="1.44"/>
                </svg>
            </a>
            <a href="https://twitter.com" target="_blank" aria-label="Twitter">
                <svg viewBox="0 0 24 24" aria-hidden="true">
                    <path d="M23.954 4.569c-.885.392-1.83.656-2.825.775a4.932 4.932 0 0 0 2.163-2.724 9.868 9.868 0 0 1-3.127 1.195 4.916 4.916 0 0 0-8.374 4.482A13.934 13.934 0 0 1 1.671 3.149a4.916 4.916 0 0 0 1.523 6.562 4.897 4.897 0 0 1-2.228-.616c-.054 2.281 1.581 4.415 3.949 4.89a4.935 4.935 0 0 1-2.224.085 4.922 4.922 0 0 0 4.596 3.417A9.867 9.867 0 0 1 .96 19.54 13.94 13.94 0 0 0 7.548 21c9.142 0 14.307-7.721 14.307-14.415 0-.22-.005-.439-.014-.656A10.22 10.22 0 0 0 24 4.59z"/>
                </svg>
            </a>
        </div>
        <p>© 2025 Cosmetic Shop. </p>
    </footer>
</body>
</html>
