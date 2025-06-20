/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author daidu
 */
public class BrandDAO extends DBContext{
    public List<Brand> getAllBrands() {
        List<Brand> list = new ArrayList<>();
        String sql = "SELECT * FROM brands";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Brand b = new Brand(
                    rs.getInt("BrandID"),
                    rs.getString("BrandName"),
                    rs.getString("Description")
                );
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Map<Brand, Integer> getBrandWithProductCount() {
        Map<Brand, Integer> map = new LinkedHashMap<>();
        String sql = """
            SELECT b.BrandID, b.BrandName, b.Description, COUNT(p.ProductID) AS ProductCount
            FROM brands b
            LEFT JOIN products p ON b.BrandID = p.BrandID
            GROUP BY b.BrandID, b.BrandName, b.Description
            ORDER BY b.BrandName
        """;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(
                    rs.getInt("BrandID"),
                    rs.getString("BrandName"),
                    rs.getString("Description")
                );
                int count = rs.getInt("ProductCount");
                map.put(brand, count);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

}
