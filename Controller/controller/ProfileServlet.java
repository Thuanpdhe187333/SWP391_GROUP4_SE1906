package controller;

import dal.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            String phoneNumber = request.getParameter("phoneNumber");
            String gender = request.getParameter("gender");
            String dobStr = request.getParameter("dob");

            user.setPhoneNumber(phoneNumber);
            user.setGender(gender);

            if (dobStr != null && !dobStr.trim().isEmpty()) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date dob = sdf.parse(dobStr);
                user.setDob(dob);
            }

            UserDAO userDAO = new UserDAO();
            boolean updated = userDAO.updateUserProfile(user);

            if (updated) {
                session.setAttribute("user", user);
                request.setAttribute("successMessage", "Cập nhật hồ sơ thành công!");
            } else {
                request.setAttribute("errorMessage", "Cập nhật thất bại. Vui lòng thử lại.");
            }

        } catch (Exception e) {
            request.setAttribute("errorMessage", "Lỗi xử lý dữ liệu: " + e.getMessage());
            e.printStackTrace();
        }

        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Xử lý hiển thị và cập nhật hồ sơ người dùng";
    }
}
