package controller.auth;

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
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "1234";

    // Kết nối cơ sở dữ liệu
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
    }

    // Xử lý yêu cầu từ người dùng
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Xác thực người dùng
        if (authenticateUser(username, password)) {
            // Lưu log đăng nhập vào hệ thống
            saveLoginLog(username);
            // Chuyển hướng tới trang chủ hoặc trang khác sau khi lưu log
            response.sendRedirect("home.jsp"); // Hoặc trang nào đó bạn muốn chuyển đến
        } else {
            // Nếu xác thực thất bại, chuyển đến trang đăng nhập với thông báo lỗi
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    // Xác thực người dùng dựa trên username và password
    private boolean authenticateUser(String username, String password) {
        String query = "SELECT * FROM user WHERE username = ? AND password = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, username);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next(); // Kiểm tra xem có bản ghi nào khớp không
            }
        } catch (SQLException ex) {
            log("Error during authentication: " + ex.getMessage());
            return false;
        }
    }

    // Lưu log đăng nhập của người dùng vào bảng system_log
    private void saveLoginLog(String username) {
        String sql = "INSERT INTO system_log (username, email, role, login_time, login_date, timestamp) "
                   + "SELECT username, email, role, CURRENT_TIME(), CURRENT_DATE(), CURRENT_TIMESTAMP() "
                   + "FROM user WHERE username = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            log("Error during logging login information: " + ex.getMessage());
        }
    }

    // Hàm doGet để xử lý yêu cầu GET
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // Hàm doPost để xử lý yêu cầu POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
