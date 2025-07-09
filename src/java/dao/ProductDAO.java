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
import java.util.Map;

/**
 *
 * @author daidu
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
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
                        rs.getTimestamp(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void addProduct(String productName, String description, double price,
            int quantity, String image, int categoryId, Integer labelId, int brandId, String usage, String ingredients, String howToUse, String note, String preservation) {
        String sql = "INSERT INTO Products (ProductName, Description, Price, Quantity, Image, CategoryId, LabelId, BrandId, `Usage`, Ingredients, HowToUse, Note, Preservation) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, productName);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);
            ps.setString(5, image); // thêm ảnh
            ps.setInt(6, categoryId);

            if (labelId != null && labelId != 0) {
                ps.setInt(7, labelId);
            } else {
                ps.setNull(7, java.sql.Types.INTEGER);
            }
            ps.setInt(8, brandId);
            ps.setString(9, usage);
            ps.setString(10, ingredients);
            ps.setString(11, howToUse);
            ps.setString(12, note);
            ps.setString(13, preservation);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // dùng printStackTrace để debug dễ hơn
        }
    }

    public void editProduct(int productId, String productName, String description, double price,
            int quantity, String image, int categoryId, Integer labelId, int brandId, String usage, String ingredients, String howToUse, String note, String preservation) {
        String sql = "UPDATE products SET "
                + "ProductName = ?, Description = ?, Price = ?, Quantity = ?, Image = ?, CategoryId = ?, LabelId = ?, BrandId = ?, `Usage` = ?, Ingredients = ?, HowToUse = ?, Note = ?, Preservation = ? "
                + "WHERE ProductId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, productName);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);
            ps.setString(5, image);
            ps.setInt(6, categoryId);
            if (labelId != null && labelId != 0) {
                ps.setInt(7, labelId);
            } else {
                ps.setNull(7, java.sql.Types.INTEGER);
            }
            ps.setInt(8, brandId);
            ps.setString(9, usage);
            ps.setString(10, ingredients);
            ps.setString(11, howToUse);
            ps.setString(12, note);
            ps.setString(13, preservation);
            ps.setInt(14, productId);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int productId) {
        String sql = "delete from Products where ProductId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public Product getProductById(int productId) {
        String sql = "SELECT * FROM Products WHERE ProductId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Integer labelId = rs.getObject("LabelId") != null ? rs.getInt("LabelId") : null;
                return new Product(
                        rs.getInt("ProductId"),
                        rs.getString("ProductName"),
                        rs.getString("Description"),
                        rs.getDouble("Price"),
                        rs.getInt("Quantity"),
                        rs.getString("Image"),
                        rs.getInt("CategoryId"),
                        labelId,
                        rs.getInt("BrandId"),
                        rs.getTimestamp("CreatedAt"),
                        rs.getString("Usage"),
                        rs.getString("Ingredients"),
                        rs.getString("HowToUse"),
                        rs.getString("Note"),
                        rs.getString("Preservation")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Product> getProductByCateId(int categoryId) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products\n"
                + "where categoryId = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
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
                        rs.getTimestamp(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

//    public List<Product> getProductsByPriceRange(double minPrice, double maxPrice) {
//        List<Product> products = new ArrayList<>();
//        String query = "SELECT * FROM Products WHERE Price BETWEEN ? AND ?";
//
//        try (PreparedStatement ps = connection.prepareStatement(query)) {
//            ps.setDouble(1, minPrice);
//            ps.setDouble(2, maxPrice);
//
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                Product p = new Product();
//                p.setProductId(rs.getInt("ProductId"));
//                p.setProductName(rs.getString("ProductName"));
//                p.setDescription(rs.getString("Description"));
//                p.setPrice(rs.getDouble("Price"));
//                p.setQuantity(rs.getInt("Quantity"));
//                p.setImage(rs.getString("Image"));
//                p.setCategoryId(rs.getInt("CategoryId"));
//                p.setLabelId(rs.getInt("LabelId"));
//                p.setBrandId(rs.getInt("BrandId"));
//                p.setCreateAt(rs.getTimestamp("CreatedAt"));
//                products.add(p);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return products;
//    }

    public Product getNewProDuct() {
        String sql = "SELECT * FROM products ORDER BY productId DESC LIMIT 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer labelId = rs.getObject("LabelId") != null ? rs.getInt("LabelId") : null;
                return new Product(
                        rs.getInt("ProductId"),
                        rs.getString("ProductName"),
                        rs.getString("Description"),
                        rs.getDouble("Price"),
                        rs.getInt("Quantity"),
                        rs.getString("Image"),
                        rs.getInt("CategoryId"),
                        labelId,
                        rs.getInt("BrandId"),
                        rs.getTimestamp("CreatedAt"),
                        rs.getString("Usage"),
                        rs.getString("Ingredients"),
                        rs.getString("HowToUse"),
                        rs.getString("Note"),
                        rs.getString("Preservation")
                );
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getLatestProducts(int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products ORDER BY ProductId DESC LIMIT ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer labelId = rs.getObject("LabelId") != null ? rs.getInt("LabelId") : null;
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
                        rs.getTimestamp(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsByBrand(int brandId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE BrandId = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, brandId);
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
                        rs.getTimestamp(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
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
                        rs.getTimestamp(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
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
                        rs.getTimestamp(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15)
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
            sql.append(" AND CategoryId = ?");
        }
        if (brandId != null) {
            sql.append(" AND BrandId = ?");
        }

        // Sắp xếp
        if ("price_asc".equals(sort)) {
            sql.append(" ORDER BY Price ASC");
        } else if ("price_desc".equals(sort)) {
            sql.append(" ORDER BY Price DESC");
        } else {
            sql.append(" ORDER BY ProductId DESC"); // mặc định: mới nhất
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
                p.setProductId(rs.getInt("ProductId"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setPrice(rs.getDouble("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setImage(rs.getString("Image"));
                p.setCategoryId(rs.getInt("CategoryId"));
                p.setLabelId(rs.getObject("LabelId") != null ? rs.getInt("LabelId") : null);

                p.setBrandId(rs.getInt("BrandId"));
//                p.setCreateAt(rs.getTimestamp("CreatedAt"));
                p.setCreatedAt(rs.getTimestamp("CreatedAt")); // đúng chính tả

                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

//    public static void main(String[] args) {
//        ProductDAO dao = new ProductDAO();
//
//        List<Product> products = dao.getAllProduct();
//        for (Product p : products) {
//            System.out.println("Id: " + p.getProductId());
//            System.out.println("Name: " + p.getProductName());
//            System.out.println("Price: $" + p.getPrice());
//            System.out.println("Quantity: " + p.getQuantity());
//            System.out.println("Image: " + p.getImage());
//            System.out.println("CategoryId: " + p.getCategoryId());
//            System.out.println("LabelId: " + p.getLabelId());
//            System.out.println("BrandId: " + p.getBrandId());
//            System.out.println("CreatedAt: " + p.getCreatedAt());
//            System.out.println("----------------------------------");
//        }
//    }
    
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();

        // Dữ liệu mẫu để test update sản phẩm có productId = 1
        int productId = 96;
        String name = "Updated Product Name";
        String description = "Updated description";
        double price = 199.99;
        int quantity = 50;
        String image = "https://example.com/updated-image.jpg";
        int categoryId = 2;
        Integer labelId = 1; // hoặc null nếu muốn xóa label
        int brandId = 3;
        String usage = "Use twice daily";
        String ingredients = "Water, Aloe Vera";
        String howToUse = "Apply gently to skin";
        String note = "Keep away from eyes";
        String preservation = "Store in a cool place";

        dao.editProduct(productId, name, description, price, quantity, image,
                categoryId, labelId, brandId, usage, ingredients, howToUse, note, preservation);

        System.out.println("Cập nhật sản phẩm thành công!");
    }

}
