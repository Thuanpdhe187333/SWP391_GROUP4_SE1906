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
                list.add(new Product(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6), 
                        rs.getTimestamp(7), 
                        rs.getObject(8) != null ? rs.getInt(8) : null));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void addProduct(String productName, String description, double price, int quantity, int categoryId, Integer labelID ){
        String sql = "insert into Products(ProductName, Description, Price, Quantity, CategoryID, LabelID)\n"
                +"values(?,?,?,?,?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, productName);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);
            ps.setInt(5, categoryId);
            if (labelID != null && labelID != 0) {
                ps.setInt(6, labelID);
            } else {
                ps.setNull(6, java.sql.Types.INTEGER);
            }
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void editProduct(int productID, String productName, String description, double price, int quantity, int categoryId, Integer labelID){
        String sql = "update Products set ProductName = ?, description = ?, price = ?, quantity = ?, categoryId = ? , labelID = ? where ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, productName);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);
            ps.setInt(5, categoryId);
            if (labelID != null && labelID != 0) {
                ps.setInt(6, labelID);
            } else {
                ps.setNull(6, java.sql.Types.INTEGER);
            }
            ps.setInt(7, productID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
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
                rs.getDouble("price"),
                rs.getInt("quantity"),
                rs.getInt("CategoryID"),
                    rs.getTimestamp("CreatedAt"),
                labelID
            );
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
    }
}
