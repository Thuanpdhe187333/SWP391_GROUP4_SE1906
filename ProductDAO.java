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
import model.Product;
/**
 *
 * @author daidu
 */
public class ProductDAO {
    public List<Product> getAllProduct(){
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
               list.add(new Product(
               rs.getInt(1),
               rs.getString(2),
               rs.getString(3),
               rs.getDouble(4),
               rs.getInt(5),
               rs.getString(6),
               rs.getInt(7),
               rs.getObject(8) != null ? rs.getInt(8) : null,
               rs.getTimestamp(9)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void addProduct(String productName, String description, double price,
                       int quantity, String image, int categoryID, Integer labelID) {
        String sql = "INSERT INTO Products (ProductName, Description, Price, Quantity, Image, CategoryID, LabelID) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, productName);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);
            ps.setString(5, image); // thêm ảnh
            ps.setInt(6, categoryID);

            if (labelID != null && labelID != 0) {
                ps.setInt(7, labelID);
            } else {
                ps.setNull(7, java.sql.Types.INTEGER);
            }

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // dùng printStackTrace để debug dễ hơn
        }
    }

    
    public void editProduct(int productID, String productName, String description, double price,
                        int quantity, String image, int categoryID, Integer labelID) {
        String sql = "UPDATE Products SET " +
                     "ProductName = ?, Description = ?, Price = ?, Quantity = ?, Image = ?, CategoryID = ?, LabelID = ? " +
                     "WHERE ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, productName);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);
            ps.setString(5, image);          // thêm ảnh
            ps.setInt(6, categoryID);

            if (labelID != null && labelID != 0) {
                ps.setInt(7, labelID);
            } else {
                ps.setNull(7, java.sql.Types.INTEGER);
            }

            ps.setInt(8, productID);         // WHERE điều kiện
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();             // nên dùng printStackTrace để dễ debug
        }
    }

    
    public void deleteProduct(int productID){
        String sql = "delete from Products where ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    public Product getProductById(int productID) {
        String sql = "SELECT * FROM Products WHERE ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Integer labelID = rs.getObject("LabelID") != null ? rs.getInt("LabelID") : null;
                return new Product(
                    rs.getInt("ProductID"),             
                    rs.getString("ProductName"),        
                    rs.getString("Description"),        
                    rs.getDouble("Price"),              
                    rs.getInt("Quantity"),             
                    rs.getString("Image"),             
                    rs.getInt("CategoryID"),            
                    labelID,                            
                    rs.getTimestamp("CreatedAt")        
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<Product> products = dao.getAllProduct();

        if (products != null && !products.isEmpty()) {
            for (Product p : products) {
                System.out.println("Product ID: " + p.getProductID());
                System.out.println("Name      : " + p.getProductName());
                System.out.println("Price     : " + p.getPrice());
                System.out.println("Quantity  : " + p.getQuantity());
                System.out.println("Image     : " + p.getImage());
                System.out.println("-----------");
            }
        } else {
            System.out.println("No products found or error occurred.");
        }
    }
}
