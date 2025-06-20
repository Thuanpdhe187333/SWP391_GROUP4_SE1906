package controller.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import controller.users.RolePermissionManager;
import context.DBContext;
import model.User;

@WebServlet("/CreateCouponServlet")
public class CreateCouponServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Đặt encoding để hỗ trợ tiếng Việt
        req.setCharacterEncoding("UTF-8");
        res.setCharacterEncoding("UTF-8");

        // Kiểm tra quyền người dùng
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("currentUser");

        if (user == null || !RolePermissionManager.hasPermission(user, "coupon:create")) {
            res.sendRedirect("unauthorized.jsp");
            return;
        }

        // Lấy dữ liệu từ form
        String code = req.getParameter("code");
        String description = req.getParameter("description");
        String discountStr = req.getParameter("discount");
        String usageLimitStr = req.getParameter("usageLimit");
        String expiryDate = req.getParameter("expiryDate");

        try {
            double discount = Double.parseDouble(discountStr);
            int usageLimit = Integer.parseInt(usageLimitStr);

            // Ghi dữ liệu vào DB
            try (Connection conn = new DBContext().getConnection()) {
                String sql = "INSERT INTO coupons (Code, Description, Discount, ExpiryDate, UsageLimit, CreatedAt) " +
                             "VALUES (?, ?, ?, ?, ?, NOW())";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, code);
                    stmt.setString(2, description);
                    stmt.setDouble(3, discount);
                    stmt.setString(4, expiryDate);
                    stmt.setInt(5, usageLimit);
                    stmt.executeUpdate();
                }
            }

            // ✅ Thành công → chuyển hướng về danh sách coupon
            res.sendRedirect("ViewCoupons.jsp");

        } catch (NumberFormatException e) {
            req.setAttribute("error", "❌ Vui lòng nhập đúng định dạng cho giảm giá và số lượt sử dụng.");
            req.getRequestDispatcher("create-coupon.jsp").forward(req, res);
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "❌ Lỗi khi ghi dữ liệu vào cơ sở dữ liệu.");
            req.getRequestDispatcher("create-coupon.jsp").forward(req, res);
        }
    }
}
