package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import model.Order;

@WebServlet(name = "ViewRevenueServlet", urlPatterns = {"/revenue-management"})
public class RevenueServlet extends HttpServlet {

    private final OrderDAO dao = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy danh sách đơn hàng
            List<Order> orders = dao.getAllOrders();

            // Tính tổng doanh thu
            double totalRevenue = dao.getTotalRevenue();

            // Truyền dữ liệu sang JSP
            request.setAttribute("orders", orders);
            request.setAttribute("totalRevenue", totalRevenue);

            // Hiển thị giao diện JSP
            request.getRequestDispatcher("view_revenue.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Lỗi khi hiển thị doanh thu: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Hiển thị danh sách đơn hàng và tổng doanh thu";
    }
}
