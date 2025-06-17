package controller;

import dal.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewUserListServlet", urlPatterns = {"/user-list"})
public class ViewUserListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO dao = new UserDAO();
        List<User> userList = dao.getAllUsers();

        request.setAttribute("users", userList);
        request.getRequestDispatcher("user_list.jsp").forward(request, response);
    }
}
