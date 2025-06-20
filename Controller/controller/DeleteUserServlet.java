package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "DeleteUserServlet", urlPatterns = {"/deleteUser"})
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam != null) {
            try {
                int userId = Integer.parseInt(idParam);
                UserDAO dao = new UserDAO();
                dao.deleteUser(userId);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Redirect đúng URL đã mapping
        response.sendRedirect("user-list");
    }
}
