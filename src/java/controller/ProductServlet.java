package controller;

import dal.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;
import model.Product;

public class ProductServlet extends HttpServlet {
    private ProductDAO dao;

    @Override
    public void init() {
        dao = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String idRaw = request.getParameter("id");

        try {
            
            if ("delete".equals(action) && idRaw != null) {
                int id = Integer.parseInt(idRaw);
                dao.deleteProduct(id);
            }

            
            if ("edit".equals(action) && idRaw != null) {
                int id = Integer.parseInt(idRaw);
                Product product = dao.getProductById(id);
                request.setAttribute("product", product);
            }

            List<Product> list = dao.getAllProduct();
            request.setAttribute("products", list);

            request.getRequestDispatcher("edit-product.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi xử lý GET: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
            String idRaw = request.getParameter("id");
            String name = request.getParameter("name");
            String desc = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String image = request.getParameter("image");
            int categoryID = Integer.parseInt(request.getParameter("categoryID"));
            String labelRaw = request.getParameter("labelID");
            Integer labelID = (labelRaw == null || labelRaw.isEmpty()) ? null : Integer.parseInt(labelRaw);
            int brandID = Integer.parseInt(request.getParameter("brandID"));

            if (idRaw == null || idRaw.isEmpty()) {
                
                dao.addProduct(name, desc, price, quantity, image, categoryID, labelID, brandID);
            } else {
                
                int id = Integer.parseInt(idRaw);
                dao.editProduct(id, name, desc, price, quantity, image, categoryID, labelID, brandID);
            }

            
            response.sendRedirect("ProductServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Lỗi xử lý POST: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet quản lý thêm/sửa/xóa sản phẩm";
    }
}
