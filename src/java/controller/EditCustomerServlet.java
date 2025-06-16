/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CustomerManagementDAO;
import java.io.IOException;
import java.io.PrintWriter;
import  jakarta.servlet.ServletException;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author daidu
 */
public class EditCustomerServlet extends HttpServlet {
   
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
            out.println("<title>Servlet EditCustomerServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditCustomerServlet at " + request.getContextPath () + "</h1>");
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
        try {
        int id = Integer.parseInt(request.getParameter("userId"));
        CustomerManagementDAO dao = new CustomerManagementDAO();
        User customer = dao.getCustomerById(id);
        if (customer != null) {
            request.setAttribute("customer", customer);
            request.getRequestDispatcher("edit-customer.jsp").forward(request, response);
        } else {
            response.sendRedirect("customer-list?error=notfound");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("customer-list?error=true");
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
            int id = Integer.parseInt(request.getParameter("userId"));
            String fullName = request.getParameter("fullName");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String phone = request.getParameter("phoneNumber");
            String dobStr = request.getParameter("dob");
            java.util.Date dob = null;
            if (dobStr != null && !dobStr.isEmpty()) {
                dob = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(dobStr);
            }

            User u = new User();
            u.setUserId(id);
            u.setFullName(fullName);
            u.setGender(gender);
            u.setAddress(address);
            u.setPhoneNumber(phone);
            u.setDob(dob);

            boolean updated = new CustomerManagementDAO().updateCustomerInfo(u);
            response.sendRedirect("customer-list");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("customer-list?error=true");
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
