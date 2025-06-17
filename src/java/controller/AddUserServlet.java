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

        String username = req.getParameter("username");
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String role = req.getParameter("role");
        String gender = req.getParameter("gender");
        String phone = req.getParameter("phoneNumber");
        String address = req.getParameter("address");
        String dobStr = req.getParameter("dob");
        String password = req.getParameter("password");

        try {
            // Kiểm tra các trường bắt buộc
            if (isEmpty(username) || isEmpty(fullName) || isEmpty(email) || isEmpty(role)
                    || isEmpty(gender) || isEmpty(phone) || isEmpty(address)
                    || isEmpty(dobStr) || isEmpty(password)) {
                req.setAttribute("error", "Vui lòng nhập đầy đủ tất cả các thông tin.");
                req.getRequestDispatcher("addUser.jsp").forward(req, resp);
                return;
            }

            // Parse ngày sinh
            LocalDate dob = LocalDate.parse(dobStr);

            User user = new User();
            user.setUsername(username);
            user.setFullName(fullName);
            user.setEmail(email);
            user.setRole(role);
            user.setGender(gender);
            user.setPhoneNumber(phone);
            user.setAddress(address);
            user.setDob(java.sql.Date.valueOf(dob));
            user.setCreatedAt(new Timestamp(System.currentTimeMillis()));
            user.setPasswordHash(md5(password));

            boolean success = userDAO.insertUser(user);

            if (success) {
                resp.sendRedirect("user-list");
            } else {
                req.setAttribute("error", "Không thể thêm người dùng. Vui lòng thử lại.");
                req.getRequestDispatcher("addUser.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            req.setAttribute("error", "Lỗi khi tạo người dùng: " + e.getMessage());
            req.getRequestDispatcher("addUser.jsp").forward(req, resp);
        }
    }

    // Hàm kiểm tra chuỗi rỗng
    private boolean isEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }

    // Hàm mã hóa MD5
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
