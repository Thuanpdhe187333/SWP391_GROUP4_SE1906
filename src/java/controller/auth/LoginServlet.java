package controller.auth;

import context.DBContext;
import controller.users.RolePermissionManager;
import model.User;

import java.io.IOException;
import java.sql.*;
import java.util.Set;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("Username");
        String password = request.getParameter("PasswordHash");

        System.out.println("🔍 Username: " + username + ", PasswordHash: " + password);

        User user = authenticate(username, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);

            // 🔐 Gán và in quyền
            Set<String> permissions = RolePermissionManager.assignPermissions(user);
            session.setAttribute("permissions", permissions);

            response.sendRedirect("shop.jsp");
        } else {
            request.setAttribute("errorMessage1", "Invalid username or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private User authenticate(String username, String password) {
        String sql = """
            SELECT Userid, Username, PasswordHash, FullName, Email, Role, CreatedAt, Gender, PhoneNumber, Address
            FROM users
            WHERE Username = ? AND PasswordHash = ?
        """;

        try {
            DBContext db = new DBContext();
            Connection conn = db.getConnection();

            if (conn == null) {
                System.err.println("❌ Không thể kết nối CSDL!");
                return null;
            }

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, username);
                stmt.setString(2, password);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        User user = new User();
                        user.setUserId(rs.getInt("Userid"));
                        user.setUsername(rs.getString("Username"));
                        user.setPasswordHash(rs.getString("PasswordHash"));
                        user.setFullName(rs.getString("FullName"));
                        user.setEmail(rs.getString("Email"));
                        user.setRole(rs.getString("Role"));
                        user.setCreatedAt(rs.getTimestamp("CreatedAt"));
                        user.setGender(rs.getString("Gender"));
                        user.setPhoneNumber(rs.getString("PhoneNumber"));
                        user.setAddress(rs.getString("Address"));
                        return user;
                    }
                }
            }

        } catch (SQLException e) {
            System.err.println("❌ SQL Error in LoginServlet: " + e.getMessage());
        }

        return null;
    }

    @Override
    public String getServletInfo() {
        return "LoginServlet handles login using the users table.";
    }
}
