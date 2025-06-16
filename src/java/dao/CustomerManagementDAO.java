/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author daidu
 */
public class CustomerManagementDAO extends DBContext{
    
    public List<User> getAllCustomers() {
    List<User> list = new ArrayList<>();
    String sql = "SELECT * FROM Users WHERE Role = 'Customer' ORDER BY UserID";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            User u = new User();
            u.setUserId(rs.getInt("UserID"));
            u.setUsername(rs.getString("Username"));
            u.setFullName(rs.getString("FullName"));
            u.setGender(rs.getString("Gender"));
            u.setAddress(rs.getString("Address"));
            u.setPhoneNumber(rs.getString("PhoneNumber"));
            u.setDob(rs.getDate("Dob"));
            u.setEmail(rs.getString("Email"));
            u.setRole(rs.getString("Role"));
            list.add(u);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}

    public int countCustomersByUserName(String keyword) {
        String sql = "SELECT COUNT(*) FROM Users WHERE Role = 'Customer' AND Username LIKE ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public List<User> getCustomersByPage(String keyword, int offset, int limit) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM Users " +
                     "WHERE Role = 'Customer' AND Username LIKE ? " +
                     "ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ps.setInt(2, offset);
            ps.setInt(3, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("UserID"));
                u.setUsername(rs.getString("Username"));
                u.setFullName(rs.getString("FullName"));
                u.setGender(rs.getString("Gender"));
                u.setAddress(rs.getString("Address"));
                u.setPhoneNumber(rs.getString("PhoneNumber"));
                u.setDob(rs.getDate("Dob"));
                u.setEmail(rs.getString("Email"));
                u.setRole(rs.getString("Role"));
                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public User getCustomerByUsername(String username) {
        String sql = "SELECT * FROM Users WHERE Role = 'Customer' AND Username = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("UserID"));
                u.setUsername(rs.getString("Username"));
                u.setFullName(rs.getString("FullName"));
                u.setGender(rs.getString("Gender"));
                u.setAddress(rs.getString("Address"));
                u.setPhoneNumber(rs.getString("PhoneNumber"));
                u.setDob(rs.getDate("Dob"));
                u.setEmail(rs.getString("Email"));
                u.setRole(rs.getString("Role"));
                return u;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    
    public User getCustomerById(int id) {
        String sql = "SELECT * FROM Users WHERE Role = 'Customer' AND UserID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("UserID"));
                u.setUsername(rs.getString("Username"));
                u.setFullName(rs.getString("FullName"));
                u.setGender(rs.getString("Gender"));
                u.setAddress(rs.getString("Address"));
                u.setPhoneNumber(rs.getString("PhoneNumber"));
                u.setDob(rs.getDate("dob"));
                u.setEmail(rs.getString("Email"));
                u.setRole(rs.getString("Role"));
                return u;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
     public boolean updateCustomerInfo(User u) {
        String sql = "UPDATE Users SET FullName = ?, Gender = ?, Address = ?, PhoneNumber = ?, dob = ? " +
                     "WHERE UserID = ? AND Role = 'Customer'";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, u.getFullName());
            ps.setString(2, u.getGender());
            ps.setString(3, u.getAddress());
            ps.setString(4, u.getPhoneNumber());
            if (u.getDob() != null) {
                ps.setDate(5, new java.sql.Date(u.getDob().getTime()));
            } else {
                ps.setNull(5, java.sql.Types.DATE);
            }
            ps.setInt(6, u.getUserId());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
     
//     public static void main(String[] args) {
//        CustomerManagementDAO dao = new CustomerManagementDAO();
//        List<User> all = dao.getAllCustomers();
//        for (User u : all) {
//            System.out.println(u.getUserId() + " - " + u.getUsername());
//        }
//    }
     
//     public static void main(String[] args) {
//        CustomerManagementDAO dao = new CustomerManagementDAO();
//        String username = "admin";
//
//        User user = dao.getCustomerByUsername(username);
//
//        if (user != null) {
//            System.out.println("✅ Tìm thấy: " + user.getUsername() + " - " + user.getFullName());
//        } else {
//            System.out.println("❌ Không tìm thấy tài khoản với Username = " + username);
//        }
//    }
}
