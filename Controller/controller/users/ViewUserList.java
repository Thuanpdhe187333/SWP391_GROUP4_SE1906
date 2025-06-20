package controller.users;

import dal.UserDAO;
import model.User;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Hiển thị danh sách người dùng từ bảng Users.
 */
public class ViewUserList {
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        List<User> users = dao.getAllUsers(); 

        if (users == null || users.isEmpty()) {
            System.out.println("No users found.");
            return;
        }

        // Định dạng ngày giờ và ngày sinh
        SimpleDateFormat sdfDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");

        System.out.println("=== User List ===");
        for (User u : users) {
            System.out.println("----------------------------");
            System.out.println("ID:           " + u.getUserId());
            System.out.println("Username:     " + u.getUsername());
            System.out.println("Password:     " + u.getPasswordHash()); // Chỉ hiển thị khi debug
            System.out.println("Full Name:    " + u.getFullName());
            System.out.println("Email:        " + u.getEmail());
            System.out.println("Role:         " + u.getRole());
            System.out.println("Gender:       " + u.getGender());
            System.out.println("Phone:        " + u.getPhoneNumber());
            System.out.println("Address:      " + u.getAddress());
            System.out.println("Date of Birth:" + (u.getDob() != null ? sdfDate.format(u.getDob()) : "N/A"));
            System.out.println("Created At:   " + (u.getCreatedAt() != null ? sdfDateTime.format(u.getCreatedAt()) : "N/A"));
        }
        System.out.println("----------------------------");
    }
}
