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
        String sql = "UPDATE products SET " +
                     "ProductName = ?, Description = ?, Price = ?, Quantity = ?, Image = ?, CategoryID = ?, LabelID = ?, BrandID = ? " +
                     "WHERE ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, productName);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);
            ps.setString(5, image);          
            ps.setInt(6, categoryID);
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

    public Product getNewProDuct(){
        String sql = "select top 1 * from products\n"
                + "order by productID desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
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
            System.out.println(e);
        }
        return null;
    }
    
    public List<Product> getLatestProducts(int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products ORDER BY ProductID DESC LIMIT ?"; 
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer labelID = rs.getObject("LabelID") != null ? rs.getInt("LabelID") : null;
                list.add(new Product(
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
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Product> getProductsByBrand(int brandId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE BrandID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, brandId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                    rs.getInt("ProductID"),
                    rs.getString("ProductName"),
                    rs.getString("Description"),
                    rs.getDouble("Price"),
                    rs.getInt("Quantity"),
                    rs.getString("Image"),
                    rs.getInt("CategoryID"),
                    rs.getObject("LabelID") != null ? rs.getInt("LabelID") : null,
                    rs.getInt("BrandID"),
                    rs.getTimestamp("CreatedAt")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> searchProductsByName(String keyword) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE ProductName LIKE ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
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
                    rs.getTimestamp(10)
                ));
            }
        } catch (Exception e) {
            System.out.println("Search error: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Product> getProductsByPage(int offset, int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products ORDER BY CreatedAt DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
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
                    rs.getTimestamp(10)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public int getTotalProductCount() {
        String sql = "SELECT COUNT(*) FROM products";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

   public List<Product> getFilteredAndSortedProducts(String keyword, Integer categoryId, Integer brandId, String sort) {
        List<Product> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Products WHERE 1=1");

        // Điều kiện lọc
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql.append(" AND ProductName LIKE ?");
        }
        if (categoryId != null) {
            sql.append(" AND CategoryID = ?");
        }
        if (brandId != null) {
            sql.append(" AND BrandID = ?");
        }

        // Sắp xếp
        if ("price_asc".equals(sort)) {
            sql.append(" ORDER BY Price ASC");
        } else if ("price_desc".equals(sort)) {
            sql.append(" ORDER BY Price DESC");
        } else {
            sql.append(" ORDER BY ProductID DESC"); // mặc định: mới nhất
        }

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {

            int paramIndex = 1;
            if (keyword != null && !keyword.trim().isEmpty()) {
                ps.setString(paramIndex++, "%" + keyword.trim() + "%");
            }
            if (categoryId != null) {
                ps.setInt(paramIndex++, categoryId);
            }
            if (brandId != null) {
                ps.setInt(paramIndex++, brandId);
            }

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
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
