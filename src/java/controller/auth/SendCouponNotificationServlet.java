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
import java.sql.*;

@WebServlet("/SendCouponNotificationServlet")
public class SendCouponNotificationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("currentUser");

        if (user == null || !RolePermissionManager.hasPermission(user, "coupon:send_notification")) {
            res.sendRedirect("unauthorized.jsp");
            return;
        }

        String message = req.getParameter("message");
        String couponIdStr = req.getParameter("couponId");

        int couponId;
        try {
            couponId = Integer.parseInt(couponIdStr);
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Coupon ID không hợp lệ!");
            req.getRequestDispatcher("send-coupon.jsp").forward(req, res);
            return;
        }

        try (Connection conn = new DBContext().getConnection()) {
            // Lấy thông tin coupon
            String couponSql = "SELECT Code, Description FROM coupons WHERE CouponID = ?";
            try (PreparedStatement couponStmt = conn.prepareStatement(couponSql)) {
                couponStmt.setInt(1, couponId);
                try (ResultSet rs = couponStmt.executeQuery()) {
                    if (!rs.next()) {
                        req.setAttribute("error", "Không tìm thấy coupon!");
                        req.getRequestDispatcher("send-coupon.jsp").forward(req, res);
                        return;
                    }

                    String couponCode = rs.getString("Code");
                    String couponDescription = rs.getString("Description");

                    // Gửi notification đến tất cả Customer
                    String userSql = "SELECT Userid FROM users WHERE Role = 'Customer'";
                    try (PreparedStatement userStmt = conn.prepareStatement(userSql);
                         ResultSet userRs = userStmt.executeQuery();
                         PreparedStatement notifyStmt = conn.prepareStatement(
                                 "INSERT INTO notifications (user_id, message, is_read, created_at) VALUES (?, ?, 0, NOW())"
                         )) {

                        while (userRs.next()) {
                            int uid = userRs.getInt("Userid");
                            String fullMessage = message + " - Coupon: " + couponCode + " (" + couponDescription + ")";
                            notifyStmt.setInt(1, uid);
                            notifyStmt.setString(2, fullMessage);
                            notifyStmt.executeUpdate();
                        }
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Lỗi khi gửi thông báo!");
            req.getRequestDispatcher("send-coupon.jsp").forward(req, res);
            return;
        }

        res.sendRedirect("ViewCouponsServlet");
    }
}
