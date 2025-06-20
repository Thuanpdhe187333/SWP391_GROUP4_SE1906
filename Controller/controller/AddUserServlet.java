package controller;

import dal.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;

@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        req.getRequestDispatcher("addUser.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu từ form
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String role = req.getParameter("role");
        String gender = req.getParameter("gender");
        String phone = req.getParameter("phoneNumber");
        String address = req.getParameter("address");
        String dobStr = req.getParameter("dob");

        try {
            // Kiểm tra các trường bắt buộc
            if (isEmpty(username) || isEmpty(password) || isEmpty(fullName) || isEmpty(email)
                    || isEmpty(role) || isEmpty(gender) || isEmpty(phone)
                    || isEmpty(address) || isEmpty(dobStr)) {
                req.setAttribute("error", "Vui lòng nhập đầy đủ tất cả các thông tin.");
                req.getRequestDispatcher("addUser.jsp").forward(req, resp);
                return;
            }

            // Kiểm tra định dạng số điện thoại
            if (!phone.matches("^0\\d{9}$")) {
                req.setAttribute("error", "Số điện thoại phải bắt đầu bằng số 0 và gồm đúng 10 chữ số.");
                req.getRequestDispatcher("addUser.jsp").forward(req, resp);
                return;
            }

            // Chuyển đổi ngày sinh
            LocalDate dob = LocalDate.parse(dobStr);

            // Tạo đối tượng User
            User user = new User();
            user.setUsername(username);
            user.setPasswordHash(md5(password)); // Có thể thay bằng Bcrypt nếu muốn bảo mật cao hơn
            user.setFullName(fullName);
            user.setEmail(email);
            user.setRole(role);
            user.setCreatedAt(new Timestamp(System.currentTimeMillis()));
            user.setGender(gender);
            user.setPhoneNumber(phone);
            user.setAddress(address);
            user.setDob(java.sql.Date.valueOf(dob));

            // Gọi DAO để lưu
            boolean success = userDAO.insertUser(user);
            if (success) {
                resp.sendRedirect("user-list");
            } else {
                req.setAttribute("error", "Không thể thêm người dùng. Vui lòng thử lại.");
                req.getRequestDispatcher("addUser.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            req.setAttribute("error", "Lỗi hệ thống: " + e.getMessage());
            req.getRequestDispatcher("addUser.jsp").forward(req, resp);
        }
    }

    private boolean isEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }

    private String md5(String input) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(input.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : array) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (Exception e) {
            return null;
        }
    }
}
