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
        List<Product> productList;
        
        String brandParam = request.getParameter("brand");
        if (brandParam != null) {
            try {
                int brandId = Integer.parseInt(brandParam);
                productList = dao.getProductsByBrand(brandId); 
            } catch (NumberFormatException e) {
                productList = dao.getAllProduct(); 
            }
        } else {
            productList = dao.getAllProduct(); 
        }
        
        String categoryParam = request.getParameter("category");
        if (categoryParam != null) {
            try {
                int categoryId = Integer.parseInt(categoryParam);
                productList = dao.getProductByCateID(categoryId); // gọi hàm bạn vừa viết
            } catch (NumberFormatException e) {
                productList = dao.getAllProduct(); // fallback nếu lỗi
            }
        }
        
        String keyword = request.getParameter("search");
        if (keyword != null && !keyword.trim().isEmpty()) {
            productList = dao.searchProductsByName(keyword.trim());
        } else {
            productList = dao.getAllProduct();
        }
        
        int page = 1;
        int pageSize = 9;
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            try {
                page = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        int totalProducts = productList.size();
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
        int fromIndex = (page - 1) * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, totalProducts);
        List<Product> pagedList = productList.subList(fromIndex, toIndex);
        

        request.setAttribute("productList", pagedList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        
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
