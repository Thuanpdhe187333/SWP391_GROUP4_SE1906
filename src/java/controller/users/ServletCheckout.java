/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Contrller;

import dal.OrderDAO;
import dal.OrderDetailsDAO;
import java.io.IOException;
import java.sql.Date;
import java.util.Vector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Cart;
import models.OrderDetails;
import models.Orders;

@WebServlet(name = "ServletCheckout", urlPatterns = {"/checkout"})
public class ServletCheckout extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String service = request.getParameter("service");

        if (service.equals("insertOrder")) {
            // Lấy session
            HttpSession session = request.getSession();
            Vector<Cart> cartList = (Vector<Cart>) session.getAttribute("cart"); // Lấy giỏ hàng từ session
            String userID = (String) session.getAttribute("userID"); // Lấy userID từ session

            // Lấy dữ liệu từ form
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String notes = request.getParameter("notes");

            // Lấy tổng tiền từ request thay vì session
            double totalAmount = 0.0;
            try {
                totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
            } catch (NumberFormatException e) {
                System.out.println("Lỗi chuyển đổi totalAmount: " + e.getMessage());
            }

            // Kiểm tra dữ liệu hợp lệ
            if (cartList == null || cartList.isEmpty()) {
                System.out.println("Lỗi: Giỏ hàng rỗng!");
                response.sendRedirect("showCart.jsp");
                return;
            }
            if (userID == null || userID.isEmpty()) {
                System.out.println("Lỗi: Chưa đăng nhập!");
                response.sendRedirect("login.jsp");
                return;
            }
            if (name == null || name.isEmpty() || phone == null || phone.isEmpty() || address == null || address.isEmpty()) {
                System.out.println("Lỗi: Thiếu thông tin người nhận hàng!");
                response.sendRedirect("checkout.jsp");
                return;
            }

            // Tạo đơn hàng
            OrderDAO orderDAO = new OrderDAO();
            Orders order = new Orders(new Date(System.currentTimeMillis()), totalAmount, userID);
            int orderID = orderDAO.insertOrder(order); // Chèn đơn hàng vào DB và lấy ID

            if (orderID > 0) {
                // Thêm từng sản phẩm vào OrderDetails
                OrderDetailsDAO orderDetailDAO = new OrderDetailsDAO();
                for (Cart cart : cartList) {
                    OrderDetails orderDetail = new OrderDetails(orderID, cart.getProductID(), (int) cart.getPrice(), cart.getQuantity());
                    orderDetailDAO.insertOrderDetail(orderDetail);
                }

                // Xóa giỏ hàng sau khi đặt hàng thành công
                session.removeAttribute("cart");

                // Lưu thông tin đơn hàng vào request để hiển thị trên trang success
                request.setAttribute("orderID", orderID);
                request.setAttribute("totalAmount", totalAmount);
                request.setAttribute("name", name);
                request.setAttribute("phone", phone);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("notes", notes);

                // Chuyển hướng đến trang xác nhận đơn hàng
                request.getRequestDispatcher("susscess.jsp").forward(request, response);
            } else {
                System.out.println("Lỗi khi tạo đơn hàng!");
                response.sendRedirect("checkout.jsp");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet xử lý đặt hàng";
    }
}