/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import  jakarta.servlet.ServletException;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author daidu
 */
public class ProductListServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductListServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductListServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();

        // Lấy các tham số filter & sort
        String keyword = request.getParameter("search");
        String categoryParam = request.getParameter("category");
        String brandParam = request.getParameter("brand");
        String sort = request.getParameter("sort");
        String pageParam = request.getParameter("page");

        Integer categoryId = null;
        Integer brandId = null;
        int currentPage = 1;
        int pageSize = 9;

        try {
            if (categoryParam != null) categoryId = Integer.parseInt(categoryParam);
            if (brandParam != null) brandId = Integer.parseInt(brandParam);
        } catch (NumberFormatException ignored) {}

        try {
            if (pageParam != null) currentPage = Integer.parseInt(pageParam);
        } catch (NumberFormatException ignored) {}

        // Gọi DAO lấy danh sách theo điều kiện
        List<Product> filteredList = dao.getFilteredAndSortedProducts(keyword, categoryId, brandId, sort);

        // Phân trang
        int totalProducts = filteredList.size();
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
        int fromIndex = (currentPage - 1) * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, totalProducts);
        List<Product> pagedList = filteredList.subList(fromIndex, toIndex);

        // Gửi danh sách sản phẩm và thông tin phân trang
        request.setAttribute("productList", pagedList);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        // Gửi lại các tham số để giữ trạng thái giao diện
        request.setAttribute("sort", sort);
        request.setAttribute("category", categoryParam);
        request.setAttribute("brand", brandParam);
        request.setAttribute("keyword", keyword);

        // Gửi danh sách category + brand
        CategoryDAO categoryDao = new CategoryDAO();
        List<Category> parents = categoryDao.getParentCategories();
        for (Category parent : parents) {
            List<Category> children = categoryDao.getChildCategories(parent.getCategoryID());
            parent.setChildren(children);
        }
        request.setAttribute("categoryList", parents);

        BrandDAO brandDAO = new BrandDAO();
        List<Brand> brandList = brandDAO.getAllBrands();
        request.setAttribute("brandList", brandList);

        Map<Brand, Integer> brandMap = brandDAO.getBrandWithProductCount();
        request.setAttribute("brandMap", brandMap);

        // Forward đến JSP
        request.getRequestDispatcher("product-list.jsp").forward(request, response);

    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
