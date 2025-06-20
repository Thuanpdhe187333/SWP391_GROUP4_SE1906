package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;
import java.util.Date;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/login"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");

        UserDAO userDAO = new UserDAO();

        // Kiểm tra xem username đã tồn tại chưa
        if (userDAO.checkUsernameExist(username)) {
            request.setAttribute("errorMessage", "Tên đăng nhập đã tồn tại!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Tạo đối tượng User mới
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPasswordHash(password); // nên mã hóa trước khi lưu
        newUser.setFullName(fullName);
        newUser.setEmail(email);
        newUser.setGender(gender);
        newUser.setPhoneNumber(phoneNumber);
        newUser.setAddress(address);
        newUser.setRole("Customer");
        newUser.setCreatedAt(new Date());

        boolean success = userDAO.addUser(newUser);

        if (success) {
            request.setAttribute("successMessage", "Đăng ký thành công! Mời bạn đăng nhập.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Đăng ký thất bại! Vui lòng thử lại.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet xử lý đăng ký người dùng mới";
    }
}
