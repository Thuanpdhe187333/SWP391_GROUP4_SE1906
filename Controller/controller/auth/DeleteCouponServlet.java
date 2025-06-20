package controller.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import controller.users.RolePermissionManager;
import context.DBContext;
import model.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/DeleteCouponServlet")
public class DeleteCouponServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        res.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("currentUser");

        // Kiểm tra quyền truy cập
        if (user == null || !RolePermissionManager.hasPermission(user, "coupon:delete")) {
            res.sendRedirect("unauthorized.jsp");
            return;
        }

        // Lấy ID từ request
        String idParam = req.getParameter("couponId");

        if (idParam == null || idParam.trim().isEmpty()) {
            session.setAttribute("error", "Thiếu mã coupon.");
            res.sendRedirect("ViewCouponsServlet");
            return;
        }

        try {
            int couponId = Integer.parseInt(idParam);

            try (Connection conn = new DBContext().getConnection();
                 PreparedStatement stmt = conn.prepareStatement("DELETE FROM coupons WHERE CouponID = ?")) {

                stmt.setInt(1, couponId);
                int result = stmt.executeUpdate();

                if (result == 0) {
                    session.setAttribute("error", "Không tìm thấy coupon để xóa.");
                } else {
                    session.setAttribute("success", "Đã xóa coupon thành công.");
                }

            } catch (SQLException e) {
                e.printStackTrace();
                session.setAttribute("error", "Lỗi khi xóa coupon: " + e.getMessage());
            }

        } catch (NumberFormatException e) {
            session.setAttribute("error", "Mã coupon không hợp lệ: " + idParam);
        }

        res.sendRedirect("ViewCouponsServlet");
    }
}
