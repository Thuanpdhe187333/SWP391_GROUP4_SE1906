/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import model.FlashSale;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Product;
/**
 *
 * @author daidu
 */
public class FlashSaleDAO extends DBContext{
    public boolean insertFlashSale(FlashSale sale) {
        String sql = "INSERT INTO FlashSale (CategoryID, StartTime, EndTime, DiscountPercent) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, sale.getCategoryID());
            ps.setObject(2, sale.getStartTime()); // dùng java.util.Date
            ps.setObject(3, sale.getEndTime());
            ps.setInt(4, sale.getDiscountPercent());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Product> getAllFlashSaleProducts() {
        List<Product> list = new ArrayList<>();
        String sql = """
            SELECT p.*, f.DiscountPercent
            FROM Products p
            JOIN FlashSale f ON p.CategoryID = f.CategoryID
            WHERE NOW() BETWEEN f.StartTime AND f.EndTime
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setPrice(rs.getDouble("Price"));
                p.setImage(rs.getString("Image"));
                p.setCategoryID(rs.getInt("CategoryID"));
                int discount = rs.getInt("DiscountPercent");
                double priceAfterDiscount = p.getPrice() * (1 - discount / 100.0);
                p.setPrice(priceAfterDiscount); // Hoặc thêm thuộc tính riêng nếu cần giữ giá gốc
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public int getDiscountPercentIfActive(int categoryId) {
        String sql = """
            SELECT DiscountPercent
            FROM FlashSale
            WHERE CategoryID = ?
              AND NOW() BETWEEN StartTime AND EndTime
            ORDER BY StartTime DESC
            LIMIT 1
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("DiscountPercent");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0; // Không có sale nào đang active
    }

}
