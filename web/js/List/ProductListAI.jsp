<%-- 
    Document   : ProductList
    Created on : Jun 4, 2025, 12:12:27 AM
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #fff0f5;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #d63384;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .product-card {
            background-color: #ffffff;
            border: 1px solid #f8c1d1;
            border-radius: 10px;
            box-shadow: 0 0 8px rgba(0,0,0,0.05);
            padding: 15px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-card img {
            width: 25%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
            
        }

        .product-card h3 {
            margin: 10px 0 5px;
            color: #c71585;
        }

        .product-card p {
            color: #555;
            font-size: 14px;
        }

        .product-card .price {
            margin-top: 10px;
            font-weight: bold;
            color: #ff1493;
            
        
}

        }
    </style>
</head>
<body>
    <h2>Danh sách sản phẩm gợi ý theo AI</h2>

    <div class="product-grid">
    <div class="product-card">
        <img src="images/1.jpg" alt="Son môi">
        <h3>Sữa tắm Damask Weilaiya Shower Gel</h3>
        <p>Sữa tắm dưỡng trắng cánh hoa hồng</p>
        <div class="price">349.000₫</div>
        <button class="buy-btn">Mua hàng</button>
    </div>

    <div class="product-card">
        <img src="images/2.jpg" alt="Phấn nước">
        <h3>Sữa Tắm Purité </h3>
        <p>Sữa Tắm Thiên Nhiên Purite Hoa Hồng</p>
        <div class="price">446.000₫</div>
        <button class="buy-btn">Mua hàng</button>
    </div>

    <div class="product-card">
        <img src="images/3.jpg" alt="Sữa rửa mặt">
        <h3>Sữa Tắm OLAY</h3>
        <p>B3+ Siêu Dưỡng Trắng Da, Cấp Ẩm Và Đàn Hồi Cho Da</p>
        <div class="price">150.000₫</div>
        <button class="buy-btn">Mua hàng</button>
    </div>

</div>
