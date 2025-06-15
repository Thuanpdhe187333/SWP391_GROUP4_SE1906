/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import  jakarta.servlet.ServletException;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;

/**
 *
 * @author daidu
 */
public class ViewCategoryServlet extends HttpServlet {
   private final CategoryDAO dao = new CategoryDAO();
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
            out.println("<title>Servlet ViewCategoryServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewCategoryServlet at " + request.getContextPath () + "</h1>");
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
        
        String action = request.getParameter("action");
        String idRaw = request.getParameter("id");

        try {
            // Xử lý xóa
            if ("delete".equals(action) && idRaw != null) {
                int id = Integer.parseInt(idRaw);
                dao.deleteCategory(id);
                response.sendRedirect("category-management");
                return;
            }

            // Xử lý edit: hiển thị thông tin category để sửa
            if ("edit".equals(action) && idRaw != null) {
                int id = Integer.parseInt(idRaw);
                Category category = dao.getCategoryByID(id);
                request.setAttribute("category", category); // truyền dữ liệu sửa
            }

            // Hiển thị danh sách danh mục
            List<Category> categories = dao.getAllCategories();
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("view_category.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi GET: " + e.getMessage());
        }
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
         try {
            String idRaw = request.getParameter("id");
            String name = request.getParameter("name");
            String parentRaw = request.getParameter("parentID");

            Integer parentID = (parentRaw == null || parentRaw.isEmpty()) ? null : Integer.parseInt(parentRaw);

            Category category = new Category();
            category.setCategoryName(name);
            category.setParentID(parentID);

            if (idRaw == null || idRaw.isEmpty()) {
                // Thêm mới
                dao.addCategory(category);
            } else {
                // Sửa
                category.setCategoryID(Integer.parseInt(idRaw));
                dao.editCategory(category);
            }

            response.sendRedirect("category-management");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Lỗi POST: " + e.getMessage());
        }
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
