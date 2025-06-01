package com.mycosmetics.controller;

import com.mycosmetics.ai.AIRecommendationEngine;
import com.mycosmetics.model.User; // Assuming User class is in this package
import com.mycosmetics.security.RolePermissionManager;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson; // Import Gson library

/**
 * Servlet to handle product recommendation requests.
 * It checks user permissions before generating recommendations.
 */
@WebServlet("/recommendations")
public class ProductRecommendationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final Gson GSON = new Gson(); // For JSON serialization

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User currentUser = (User) request.getSession().getAttribute("currentUser");

        // Permission check: Define which roles are allowed to receive recommendations.
        // CUSTOMERs and CHAT_SUGGEST users get personalized recommendations.
        // GUESTs (and any user with VIEW_PRODUCT permission) can get general recommendations.
        boolean canReceiveRecommendations =
                RolePermissionManager.hasPermission(currentUser, "VIEW_PRODUCT") ||
                RolePermissionManager.hasPermission(currentUser, "USE_CHAT_SUGGEST") ||
                RolePermissionManager.hasPermission(currentUser, "VIEW_OWN_ORDERS"); // Customer specific check

        if (!canReceiveRecommendations) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "You are not authorized to receive product recommendations.");
            return;
        }

        int numberOfRecommendations = 5; // Default number of recommendations

        try {
            String numStr = request.getParameter("count");
            if (numStr != null && !numStr.isEmpty()) {
                numberOfRecommendations = Integer.parseInt(numStr);
            }
        } catch (NumberFormatException e) {
            System.err.println("Invalid 'count' parameter for recommendations: " + e.getMessage());
            // Continue with default number
        }

        // Get recommendations from the AI engine
        List<AIRecommendationEngine.Product> recommendedProducts =
                AIRecommendationEngine.getRecommendations(currentUser, numberOfRecommendations);

        // Set content type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Convert recommendations to JSON and send as response
        response.getWriter().write(GSON.toJson(recommendedProducts));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // For recommendations, GET method is typically used.
        // You might use POST if recommendations are triggered by complex user input or events.
        doGet(request, response);
    }
}