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
public class ProductDAO extends DBContext{
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
               rs.getInt(9),
               rs.getTimestamp(10)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void addProduct(String productName, String description, double price,
                       int quantity, String image, int categoryID, Integer labelID, int brandID) {
        String sql = "INSERT INTO Products (ProductName, Description, Price, Quantity, Image, CategoryID, LabelID, BrandID) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
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
            ps.setInt(8, brandID);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // dùng printStackTrace để debug dễ hơn
        }
    }

    
    public void editProduct(int productID, String productName, String description, double price,
                        int quantity, String image, int categoryID, Integer labelID, int brandID) {
        String sql = "UPDATE Products SET " +
                     "ProductName = ?, Description = ?, Price = ?, Quantity = ?, Image = ?, CategoryID = ?, LabelID = ?, BrandID = ? " +
                     "WHERE ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, productName);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);
            ps.setString(5, image);          

            if (labelID != null && labelID != 0) {
                ps.setInt(7, labelID);
            } else {
                ps.setNull(7, java.sql.Types.INTEGER);
            }
            ps.setInt(8, brandID);
            ps.setInt(9, productID); 
            
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();             
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
                    rs.getInt("BrandID"),
                    rs.getTimestamp("CreatedAt")        
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Product> getProductByCateID(int categoryID){
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products\n"
                + "where categoryID = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryID);
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
               rs.getInt(9),
               rs.getTimestamp(10)));
                       
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
     
    public List<Product> getProductsByPriceRange(double minPrice, double maxPrice) {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE Price BETWEEN ? AND ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setDouble(1, minPrice);
            ps.setDouble(2, maxPrice);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setPrice(rs.getDouble("Price")); 
                p.setQuantity(rs.getInt("Quantity"));
                p.setImage(rs.getString("Image"));
                p.setCategoryID(rs.getInt("CategoryID"));
                p.setLabelID(rs.getInt("LabelID"));
                p.setBrandID(rs.getInt("BrandID"));
                p.setCreateAt(rs.getTimestamp("CreatedAt"));
                products.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }


    
    


}
