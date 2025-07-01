package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "RejectUserServlet", urlPatterns = {"/rejectUser"})
public class RejectUserServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    // Phương thức xử lý yêu cầu GET (dành cho việc từ chối người dùng)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy thông tin userId từ tham số 'id' trong URL
        String userIdParam = request.getParameter("id");

        // Kiểm tra xem 'id' có tồn tại không
        if (userIdParam != null) {
            try {
                // Chuyển userId từ String sang int
                int userId = Integer.parseInt(userIdParam);

                // Gọi phương thức 'rejectUser' trong UserDAO để từ chối người dùng
                boolean success = userDAO.rejectUser(userId);

                // Kiểm tra kết quả và thiết lập thông báo thành công hoặc lỗi
                if (success) {
                    request.setAttribute("message", "Người dùng đã bị từ chối thành công.");
                } else {
                    request.setAttribute("error", "Không tìm thấy người dùng hoặc không thể từ chối.");
                }
            } catch (NumberFormatException e) {
                // Nếu xảy ra lỗi khi chuyển ID thành int, thông báo lỗi
                request.setAttribute("error", "ID người dùng không hợp lệ.");
            }
        } else {
            // Nếu không có tham số 'id', thông báo thiếu ID người dùng
            request.setAttribute("error", "ID người dùng bị thiếu.");
        }

        // Sau khi thực hiện hành động, chuyển tiếp đến trang danh sách người dùng
        request.getRequestDispatcher("user-list").forward(request, response);
    }
}
