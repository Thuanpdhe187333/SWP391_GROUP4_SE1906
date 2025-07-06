package controller;

import dal.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewUserListServlet", urlPatterns = {"/user-list"})
public class ViewUserListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy tham số 'status' và 'search' từ request (nếu có)
        String status = request.getParameter("status");  // Giá trị có thể là 'active', 'suspended', hoặc null (tất cả)
        String search = request.getParameter("search");  // Giá trị tìm kiếm theo tên đăng nhập, họ tên hoặc email

        // Gọi UserDAO để lấy danh sách người dùng, có thể lọc theo trạng thái và tìm kiếm
        UserDAO dao = new UserDAO();
        List<User> userList;

        // Kiểm tra nếu có từ khóa tìm kiếm, sử dụng cả lọc theo trạng thái và tìm kiếm
        if (search != null && !search.isEmpty()) {
            userList = dao.searchUsers(search, status);  // Tìm kiếm theo tên hoặc email với trạng thái
        } else {
            userList = dao.getUsersByStatus(status);  // Lọc theo trạng thái
        }

        // Truyền dữ liệu danh sách người dùng vào request
        request.setAttribute("users", userList);

        // Chuyển hướng sang trang JSP để hiển thị kết quả
        request.getRequestDispatcher("user_list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý khi người dùng gửi form, chúng ta có thể gọi doGet() để tái sử dụng logic
        doGet(request, response);
    }
}
