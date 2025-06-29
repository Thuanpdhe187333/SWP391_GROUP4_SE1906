package controller.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Coupon;
import context.DBContext;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ViewCouponsServlet")
public class ViewCouponsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Thiết lập encoding cho hỗ trợ tiếng Việt
        req.setCharacterEncoding("UTF-8");
        res.setCharacterEncoding("UTF-8");

        List<Coupon> coupons = new ArrayList<>();

        try (Connection conn = new DBContext().getConnection()) {

            String sql = """
                SELECT CouponID, Code, Description, Discount, ExpiryDate, UsageLimit, CreatedAt
                FROM coupons
                ORDER BY CreatedAt DESC
            """;

            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Coupon c = new Coupon();
                    c.setCouponId(rs.getInt("CouponID"));
                    c.setCode(rs.getString("Code"));
                    c.setDescription(rs.getString("Description"));
                    c.setDiscount(rs.getDouble("Discount"));
                    c.setExpiryDate(rs.getTimestamp("ExpiryDate"));
                    c.setUsageLimit(rs.getInt("UsageLimit"));
                    c.setCreatedAt(rs.getTimestamp("CreatedAt"));
                    coupons.add(c);
                }
            }

            // Gán dữ liệu cho request
            req.setAttribute("coupons", coupons);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "❌ Không thể tải danh sách coupon: " + e.getMessage());
        }

        // Chuyển tiếp sang đúng trang JSP hiển thị dashboard
        req.getRequestDispatcher("CouponDashboard.jsp").forward(req, res);
    }
}
