import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AddressDAO {
    public void createAddress(String fullName, String phoneNumber, String street, String city, String zipCode) throws SQLException {
        String sql = "INSERT INTO addresses (full_name, phone_number, street, city, zip_code) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, fullName);
            stmt.setString(2, phoneNumber);
            stmt.setString(3, street);
            stmt.setString(4, city);
            stmt.setString(5, zipCode);
            stmt.executeUpdate();
        }
    }

    public List<Address> getAllAddresses() throws SQLException {
        List<Address> addresses = new ArrayList<>();
        String sql = "SELECT * FROM addresses";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Address addr = new Address(rs.getInt("id"), rs.getString("full_name"),
                                           rs.getString("phone_number"), rs.getString("street"),
                                           rs.getString("city"), rs.getString("zip_code"));
                addresses.add(addr);
            }
        }
        return addresses;
    }
}