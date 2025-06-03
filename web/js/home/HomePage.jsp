<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Cosmetic Shop Online</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #fff0f5;
            margin: 0;
            padding: 20px;
        }

        header {
            max-width: 1200px;
            margin: 0 auto 20px;
            display: flex;
            justify-content: center;
        }

        /* Thanh tìm kiếm */
        .search-bar {
            flex: 1;
            display: flex;
            max-width: 500px;
        }

        .search-bar input[type="text"] {
            flex: 1;
            padding: 10px;
            border: 2px solid #d63384;
            border-right: none;
            border-radius: 8px 0 0 8px;
            font-size: 16px;
        }

        .search-bar button {
            background-color: #d63384;
            border: none;
            padding: 10px 20px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            border-radius: 0 8px 8px 0;
            transition: background-color 0.3s ease;
        }

        .search-bar button:hover {
            background-color: #b02a6a;
        }

        /* Danh mục category */
        nav.categories {
            margin: 20px 0;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
        }

        nav.categories a {
            text-decoration: none;
            color: #d63384;
            border: 1.5px solid #d63384;
            padding: 8px 15px;
            border-radius: 20px;
            font-weight: 600;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        nav.categories a:hover,
        nav.categories a.active {
            background-color: #d63384;
            color: white;
        }

        /* Danh sách sản phẩm */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px 0;
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
            width: 100%;
            height: 200px;
            object-fit: contain;
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

        .product-card button {
            margin-top: 15px;
            padding: 10px 25px;
            background-color: #ff69b4;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .product-card button:hover {
            background-color: #ff4d94;
        }

        /* Phân trang */
        .pagination {
            max-width: 1200px;
            margin: 30px auto;
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .pagination a {
            padding: 8px 15px;
            border: 1.5px solid #d63384;
            border-radius: 6px;
            color: #d63384;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .pagination a:hover,
        .pagination a.active {
            background-color: #d63384;
            color: white;
        }
    </style>
</head>
<body>
    <header>
        <form class="search-bar" action="#" method="get">
            <input type="text" name="search" placeholder="Tìm sản phẩm..." />
            <button type="submit">Tìm</button>
        </form>
    </header>

    <nav class="categories">
        <a href="#" class="active">Tất cả</a>
        <a href="#">Son môi</a>
        <a href="#">Phấn nước</a>
        <a href="#">Sữa rửa mặt</a>
    </nav>

    <div class="product-grid">
        <div class="product-card">
            <img src="img/1.png" alt="Son Dưỡng Dior Addict Lip Glow" />
            <h3>Son Dưỡng Dior Addict Lip Glow </h3>
            <p>Chất son mịn, dưỡng ẩm tốt.</p>
            <div class="price">900.000₫</div>
            <button>Xem chi tiết</button>
        </div>

        <div class="product-card">
            <img src="img/2.png" alt="Cushion YSL" />
            <h3>Cushion YSL</h3>
            <p>Phấn nước kiềm dầu, che phủ hoàn hảo.</p>
            <div class="price">1.350.000₫</div>
            <button>Xem chi tiết</button>
        </div>

        <div class="product-card">
            <img src="img/3.png" alt="Bảng Phấn Mắt 10 Màu Romand" />
            <h3>Bảng Phấn Mắt 10 Màu Romand</h3>
            <p>Tạo điểm nhắn sáng tối, tạo đôi mắt có chiều sâu.</p>
            <div class="price">390.000₫</div>
            <button>Xem chi tiết</button>
        </div>
        
</div>

    <div class="pagination">
        <a href="#" class="active">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
    </div>
</body>
</html>
