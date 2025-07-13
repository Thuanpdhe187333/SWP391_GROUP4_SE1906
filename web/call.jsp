<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Giả lập người dùng đã đăng nhập (bạn có thể thay thế bằng session thật)
    String userId = "user1";        // người gọi
    String calleeId = "user2";      // người nhận
%>
<html>
<head>
    <title>Stringee Video Call</title>
    <!-- Stringee SDK -->
    <script src="https://cdn.stringee.com/sdk/web/latest/stringee-web-sdk.min.js"></script>
    <style>
        video {
            width: 300px;
            height: 225px;
            border: 1px solid #ccc;
            margin: 10px;
        }
    </style>
</head>
<body>

<h2>Video Call - Stringee Demo</h2>

<!-- Hiển thị video -->
<video id="localVideo" autoplay muted></video>
<video id="remoteVideo" autoplay></video>
<br/>

<!-- Nút gọi -->
<button onclick="startCall()">📞 Gọi đến <%= calleeId %></button>

<script>
    const userId = "<%= userId %>";       // người đang dùng trình duyệt này
    const calleeId = "<%= calleeId %>";   // người được gọi

    const client = new StringeeClient();
    let call;

    // Lấy token từ servlet
    fetch('getToken?userId=' + userId)
        .then(res => res.text())
        .then(token => {
            client.connect(token);
        });

    // Khi kết nối thành công
    client.on('connect', () => {
        console.log('✅ Đã kết nối tới Stringee');
    });

    // Khi có cuộc gọi đến
    client.on('incomingcall', function (incomingCall) {
        console.log('📥 Cuộc gọi đến từ:', incomingCall.fromNumber);

        incomingCall.on('addlocalstream', function (stream) {
            document.getElementById('localVideo').srcObject = stream;
        });

        incomingCall.on('addremotestream', function (stream) {
            document.getElementById('remoteVideo').srcObject = stream;
        });

        // Tự động trả lời
        incomingCall.answer(function (res) {
            console.log('🎤 Đã trả lời:', res);
        });
    });

    // Hàm gọi đi
    function startCall() {
        call = new StringeeCall(client, userId, calleeId, true); // true = video call

        call.on('addlocalstream', function (stream) {
            document.getElementById('localVideo').srcObject = stream;
        });

        call.on('addremotestream', function (stream) {
            document.getElementById('remoteVideo').srcObject = stream;
        });

        call.makeCall(function (res) {
            console.log('🚀 Đang gọi...', res);
        });
    }
</script>

</body>
</html>
