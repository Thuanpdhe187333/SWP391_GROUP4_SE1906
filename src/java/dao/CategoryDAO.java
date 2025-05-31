/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import context.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author daidu
 */
public class CategoryDAO extends DBContext{
    public List<Category> getAllCategories(){
        List<Category> list = new ArrayList<>();
        String sql = "Select * from categories";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Integer parentID = rs.getObject("ParentID") != null ? rs.getInt("ParentID") : null;
                list.add(new Category(
                rs.getInt("CategoryID"),
                rs.getString("CategoryName"),
                parentID));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Category getCategoryByID(int categoryID){
        String sql = "select * from categories where CategoryID = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
               Integer parentID = rs.getObject("ParentID") != null ? rs.getInt("ParentID") : null;
                return new Category(
                rs.getInt("CategoryID"),
                rs.getString("CategoryName"),
                parentID); 
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public List<Category> getParentCategories() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM categories WHERE ParentID IS NULL";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(
                    rs.getInt("CategoryID"),
                    rs.getString("CategoryName"),
                    null
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Category> getChildCategories(int parentID) {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM categories WHERE ParentID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, parentID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(
                    rs.getInt("CategoryID"),
                    rs.getString("CategoryName"),
                    rs.getInt("ParentID")
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();

        System.out.println("=== Danh sách danh mục cha ===");
        List<Category> parents = dao.getParentCategories();
        for (Category parent : parents) {
            System.out.println("Parent: " + parent.getCategoryName());

            List<Category> children = dao.getChildCategories(parent.getCategoryID());
            for (Category child : children) {
                System.out.println("   - Child: " + child.getCategoryName());
            }
        }
    }

    
    

}
