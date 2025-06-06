<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff8f6;
            color: #333;
        }

        header {
            background-color: #ffb6c1;
            padding: 20px;
            text-align: center;
        }

        main {
            padding: 20px;
        }

        .contact-form {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffeef2;
            padding: 20px;
            border-radius: 10px;
        }

        .contact-form label {
            display: block;
            margin-top: 15px;
        }

        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .contact-form button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #ff69b4;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        .contact-form button:hover {
            background-color: #ff1493;
        }

        footer {
            text-align: center;
            padding: 10px;
            background-color: #f8c1d1;
        }
    </style>
</head>
<body>
    <header>
        <h1>Contact Us!</h1>
        <p>Chúng tôi luôn sẵn sàng lắng nghe bạn!</p>
    </header>

    <main>
        <section class="contact-form">
            <form action="sendContact.jsp" method="post">
                <label for="name">Họ và tên:</label>
                <input type="text" id="name" name="name" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="subject">Chủ đề:</label>
                <input type="text" id="subject" name="subject">

                <label for="message">Nội dung:</label>
                <textarea id="message" name="message" rows="5" required></textarea>

                <button type="submit">Gửi liên hệ</button>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2025 Cosmetic Shop. All rights reserved.</p>
    </footer>
</body>
</html>


