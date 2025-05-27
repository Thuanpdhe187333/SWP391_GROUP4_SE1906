package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AddressDAO {
    private DBContext dbContext;

    public AddressDAO() {
        dbContext = new DBContext();
    }

    public void createAddress(String fullName, String phoneNumber, String street, String city, String zipCode) {
        String sql = "INSERT INTO addresses (full_name, phone_number, street, city, zip_code) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = dbContext.connection.prepareStatement(sql)) {
            stmt.setString(1, fullName);
            stmt.setString(2, phoneNumber);
            stmt.setString(3, street);
            stmt.setString(4, city);
            stmt.setString(5, zipCode);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Address> getAllAddresses() {
        List<Address> addresses = new ArrayList<>();
        String sql = "SELECT * FROM addresses";
        try (Statement stmt = dbContext.connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Address addr = new Address(rs.getInt("id"), rs.getString("full_name"),
                                           rs.getString("phone_number"), rs.getString("street"),
                                           rs.getString("city"), rs.getString("zip_code"));
                addresses.add(addr);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return addresses;
    }

    public Address getAddressById(int id) {
        Address address = null;
        String sql = "SELECT * FROM addresses WHERE id = ?";
        try (PreparedStatement stmt = dbContext.connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    address = new Address(rs.getInt("id"), rs.getString("full_name"),
                                          rs.getString("phone_number"), rs.getString("street"),
                                          rs.getString("city"), rs.getString("zip_code"));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return address;
    }

    public void updateAddress(Address address) {
        String sql = "UPDATE addresses SET full_name = ?, phone_number = ?, street = ?, city = ?, zip_code = ? WHERE id = ?";
        try (PreparedStatement stmt = dbContext.connection.prepareStatement(sql)) {
            stmt.setString(1, address.getFullName());
            stmt.setString(2, address.getPhoneNumber());
            stmt.setString(3, address.getStreet());
            stmt.setString(4, address.getCity());
            stmt.setString(5, address.getZipCode());
            stmt.setInt(6, address.getId());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAddress(int id) {
        String sql = "DELETE FROM addresses WHERE id = ?";
        try (PreparedStatement stmt = dbContext.connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}