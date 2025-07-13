package controller;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.LabelDAO;
import dal.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Brand;
import model.Category;
import model.Label;
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
        CategoryDAO catDAO = new CategoryDAO();
        BrandDAO brandDAO = new BrandDAO(); 
        LabelDAO labelDAO = new LabelDAO();
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
            
            List<Category> categoryList = catDAO.getAllCategories();
            List<Label> labelList = labelDAO.getAllLabels();
            List<Brand> brandList = brandDAO.getAllBrands();

            request.setAttribute("categoryList", categoryList);
            request.setAttribute("labelList", labelList);
            request.setAttribute("brandList", brandList);
            
            Map<Integer, String> categoryMap = new HashMap<>(); //Hien thi CateName trong list edit
            for (Category c : categoryList) {
                categoryMap.put(c.getCategoryId(), c.getCategoryName());
            }

            Map<Integer, String> brandMap = new HashMap<>(); //Hien thi Brandname trong list edit
            for (Brand b : brandList) {
                brandMap.put(b.getBrandId(), b.getBrandName());
            }
            
            Map<Integer, String> labelMap = new HashMap<>();
            for (Label l : labelList) {
                labelMap.put(l.getLabelId(), l.getLabelName());//Hien thi Labelname trong list edit
            }

            request.setAttribute("categoryMap", categoryMap);
            request.setAttribute("brandMap", brandMap);
            request.setAttribute("labelMap", labelMap);

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
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String labelRaw = request.getParameter("labelId");
            Integer labelId = (labelRaw == null || labelRaw.isEmpty()) ? null : Integer.parseInt(labelRaw);
            int brandId = Integer.parseInt(request.getParameter("brandId"));
            String usage = request.getParameter("usage");
            String ingredients = request.getParameter("ingredients");
            String howToUse = request.getParameter("howToUse");
            String note = request.getParameter("note");
            String preservation = request.getParameter("preservation");

            if (idRaw == null || idRaw.isEmpty()) {
                
                dao.addProduct(name, desc, price, quantity, image, categoryId, labelId, brandId, usage, ingredients, howToUse, note, preservation);
            } else {
                
                int id = Integer.parseInt(idRaw);
                dao.editProduct(id, name, desc, price, quantity, image, categoryId, labelId, brandId, usage, ingredients, howToUse, note, preservation);
            }

            
            response.sendRedirect("product-management");

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
