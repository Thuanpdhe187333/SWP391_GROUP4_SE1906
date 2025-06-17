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

@WebServlet("/editUser")
public class EditUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect("user-list"); // Chuyển về servlet hiển thị danh sách
            return;
        }

        try {
            int userId = Integer.parseInt(idParam);
            User user = new UserDAO().getUserById(userId);

            if (user != null) {
                request.setAttribute("user", user);
                request.getRequestDispatcher("edit_user.jsp").forward(request, response);
            } else {
                response.sendRedirect("user-list");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("user-list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
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

            UserDAO dao = new UserDAO();
            User oldUser = dao.getUserById(userId);

            if (oldUser == null) {
                response.sendRedirect("user-list");
                return;
            }

            // Giữ lại các thông tin không thay đổi như passwordHash, createdAt
            User updatedUser = new User(
                    userId,
                    username,
                    oldUser.getPasswordHash(),
                    fullName,
                    email,
                    role,
                    oldUser.getCreatedAt(),
                    gender,
                    phone,
                    address,
                    dob
            );

            boolean success = dao.updateUser(updatedUser);

            if (success) {
                response.sendRedirect("user-list"); // ✅ Điều hướng về servlet danh sách
            } else {
                request.setAttribute("error", "Cập nhật thất bại!");
                request.setAttribute("user", updatedUser);
                request.getRequestDispatcher("edit_user.jsp").forward(request, response);
            }

        } catch (NumberFormatException | ParseException e) {
            e.printStackTrace();
            request.setAttribute("error", "Dữ liệu nhập không hợp lệ!");
            request.getRequestDispatcher("edit_user.jsp").forward(request, response);
        }
    }
}
