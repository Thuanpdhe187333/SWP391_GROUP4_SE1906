package yourpackage;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Date;

@WebServlet("/getToken")
public class GetTokenServlet extends HttpServlet {

    // Khóa API của bạn
    private static final String API_KEY_SID = "SK.0.mH5WPxq4tKVlxLKoy0uKNBKwvygx31oe";
    private static final String API_KEY_SECRET = "R2FJS1NJRzNPVkxaZEhlbGdjSHhIY2LbEZ3Y3hDUg==";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy userId từ query ?userId=user1
        String userId = request.getParameter("userId");

        if (userId == null || userId.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Missing userId");
            return;
        }

        try {
            Algorithm algorithm = Algorithm.HMAC256(API_KEY_SECRET);
            long nowMillis = System.currentTimeMillis();
            long expMillis = nowMillis + 3600 * 1000; // Token sống 1 tiếng

            String token = JWT.create()
                    .withIssuer(API_KEY_SID)
                    .withClaim("userId", userId)
                    .withExpiresAt(new Date(expMillis))
                    .sign(algorithm);

            response.setContentType("text/plain");
            response.getWriter().write(token);

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Token generation failed");
        }
    }
}
