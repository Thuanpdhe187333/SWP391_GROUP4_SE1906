package controller.auth;

import context.DBContext;
import model.LogEntry;
import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SystemLogServlet", urlPatterns = {"/SystemLogServlet"})
public class SystemLogServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/cosmeticver1?zeroDateTimeBehavior=CONVERT_TO_NULL";
    private static final String DB_USERNAME = "root";           // Tên đăng nhập MySQL
    private static final String DB_PASSWORD = "1234";           // Mật khẩu MySQL
    
    // Xử lý yêu cầu GET và POST
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Lấy thông tin người dùng từ form đăng nhập
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Kiểm tra thông tin đăng nhập (bạn có thể sử dụng logic xác thực của mình)
        boolean isValidUser = authenticateUser(username, password);
        
        if (isValidUser) {
            // Nếu đăng nhập thành công, lưu log vào database
            saveLoginLog(username);
            // Chuyển hướng đến trang Dashboard hoặc trang chủ
            response.sendRedirect("dashboard.jsp");
        } else {
            // Nếu đăng nhập thất bại, chuyển hướng về trang đăng nhập với thông báo lỗi
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    // Kiểm tra thông tin đăng nhập người dùng
    private boolean authenticateUser(String username, String password) {
        // Logic xác thực người dùng (thực hiện kiểm tra thông tin với cơ sở dữ liệu)
        // Ví dụ đơn giản: trả về true nếu username và password hợp lệ
        return true; // Giả sử người dùng hợp lệ
    }

    // Lưu log đăng nhập vào cơ sở dữ liệu
    private void saveLoginLog(String username) {
        // Truy vấn email và role của người dùng từ bảng `user`
        String sql = "INSERT INTO system_log (username, email, role, login_time, login_date) "
                + "SELECT username, email, role, CURRENT_TIME(), CURRENT_DATE() FROM user WHERE username = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.executeUpdate(); // Thực thi câu lệnh để lưu log vào cơ sở dữ liệu

        } catch (SQLException ex) {
            ex.printStackTrace(); // Log lỗi nếu có sự cố khi lưu log
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "SystemLogServlet handles the logging of user logins and displays the logs.";
    }
}
