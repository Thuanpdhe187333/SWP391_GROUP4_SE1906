
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author daidu
 */
public class DBContext {
     protected Connection connection;
     
     public DBContext() {
        try {
            // Thông tin kết nối MySQL
            String url = "jdbc:mysql://127.0.0.1:3306/cosmeticver1?zeroDateTimeBehavior=CONVERT_TO_NULL";
            String username = "root";           // Tên đăng nhập MySQL
            String password = "1234";  // Mật khẩu MySQL

            // Nạp driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Kết nối tới database
            connection = DriverManager.getConnection(url, username, password);

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace(); // Ghi log lỗi ra màn hình
        }
}
}
