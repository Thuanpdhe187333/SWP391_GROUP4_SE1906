package controller;

import dal.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            // Lấy dữ liệu từ form
            int userId = Integer.parseInt(request.getParameter("userId"));
            String username = request.getParameter("username");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phoneNumber");
            String address = request.getParameter("address");
            String dobStr = request.getParameter("dob");

            Date dob = null;
            if (dobStr != null && !dobStr.isEmpty()) {
                dob = new SimpleDateFormat("yyyy-MM-dd").parse(dobStr);
            }

            // Tạo đối tượng User mới (mật khẩu và createdAt giả sử không cập nhật)
            User user = new User(userId, username, null, fullName, email, role, null, gender, phone, address, dob);

            // Gọi DAO cập nhật
            UserDAO dao = new UserDAO();
            dao.updateUser(user);

            // Quay lại servlet danh sách
            response.sendRedirect("user-list");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Cập nhật thất bại: " + e.getMessage());
            request.getRequestDispatcher("edit_user.jsp").forward(request, response);
        }
    }
}
