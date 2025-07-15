package dal;

import context.DBContext;
import model.User;

import java.sql.*;
import java.util.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO extends DBContext {

    private final DBContext dbContext;
    private static final Logger LOGGER = Logger.getLogger(UserDAO.class.getName());

    public UserDAO() {
        this.dbContext = new DBContext();
    }

    private static final Map<String, OtpData> otpStore = new HashMap<>();
    private static final long OTP_EXPIRATION_MS = 5 * 60 * 1000;

    private static class OtpData {

        String otp;
        long expirationTime;

        OtpData(String otp, long expirationTime) {
            this.otp = otp;
            this.expirationTime = expirationTime;
        }
    }

    public List<User> getAllCustomers(String search, String sort, int page, int pageSize) {
        List<User> customers = new ArrayList<>();
        StringBuilder query = new StringBuilder(
                "SELECT UserID, Username, FullName, Email, PhoneNumber, Address, Gender, dob, CreatedAt, Role "
                + "FROM users WHERE Role = 'Customer' AND isDeleted = FALSE"
        );

        if (search != null && !search.isEmpty()) {
            query.append(" AND (Username LIKE ? OR FullName LIKE ? OR Email LIKE ? OR PhoneNumber LIKE ?)");
        }

        if (sort != null && !sort.isEmpty()) {
            query.append(" ORDER BY ").append(sort);
        } else {
            query.append(" ORDER BY FullName ASC");
        }

        query.append(" LIMIT ? OFFSET ?");

        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(query.toString())) {

            int paramIndex = 1;
            if (search != null && !search.isEmpty()) {
                String like = "%" + search + "%";
                ps.setString(paramIndex++, like);
                ps.setString(paramIndex++, like);
                ps.setString(paramIndex++, like);
                ps.setString(paramIndex++, like); // Thêm PhoneNumber vào tìm kiếm
            }

            ps.setInt(paramIndex++, pageSize);
            ps.setInt(paramIndex, (page - 1) * pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setFullName(rs.getString("FullName"));
                user.setEmail(rs.getString("Email"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                user.setAddress(rs.getString("Address"));
                user.setGender(rs.getString("Gender"));
                user.setDob(rs.getDate("dob"));
                user.setCreatedAt(rs.getTimestamp("CreatedAt"));
                user.setRole(rs.getString("Role"));
                customers.add(user);
            }

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error in getAllCustomers: ", e);
        }

        return customers;
    }

    private void setSearchParameters(PreparedStatement ps, String search, int paramIndex) throws SQLException {
        String like = "%" + search + "%";
        ps.setString(paramIndex++, like);
        ps.setString(paramIndex++, like);
        ps.setString(paramIndex++, like);
    }

    public int getTotalCustomers(String search) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM users WHERE Role = 'Customer' AND isDeleted = FALSE");
        if (search != null && !search.isEmpty()) {
            sql.append(" AND (Username LIKE ? OR FullName LIKE ? OR Email LIKE ? OR PhoneNumber LIKE ?)");
        }

        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            int index = 1;
            if (search != null && !search.isEmpty()) {
                setSearchParameters(ps, search, index);
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error in getTotalCustomers: ", e);
        }
        return 0;
    }

    public boolean deleteCustomer(int userId) {
        String query = "DELETE FROM users WHERE UserID = ?";
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            conn.setAutoCommit(false);
            ps.setInt(1, userId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                conn.commit();
                return true;
            } else {
                conn.rollback();
                return false;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error in deleteCustomer: ", e);
            return false;
        }
    }

    public boolean checkUsernameExist(String username) {
        String sql = "SELECT 1 FROM users WHERE Username = ?";
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error checking username existence: ", ex);
            return false;
        }
    }

    public boolean addUser(User user) {
        String sql = "INSERT INTO users (Username, PasswordHash, FullName, Email, Role, CreatedAt, Gender, PhoneNumber, Address, Dob, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPasswordHash());
            ps.setString(3, user.getFullName());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getRole());
            ps.setTimestamp(6, user.getCreatedAt() != null
                    ? new Timestamp(user.getCreatedAt().getTime())
                    : new Timestamp(System.currentTimeMillis()));
            ps.setString(7, user.getGender());
            ps.setString(8, user.getPhoneNumber());
            ps.setString(9, user.getAddress());
            if (user.getDob() != null) {
                ps.setDate(10, new java.sql.Date(user.getDob().getTime()));
            } else {
                ps.setNull(10, Types.DATE);
            }
            ps.setString(11, "active"); // Mặc định trạng thái là active khi tạo mới
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error in addUser: ", ex);
            return false;
        }
    }

    private void checkConnection() throws SQLException {
        if (dbContext.getConnection() == null || dbContext.getConnection().isClosed()) {
            throw new SQLException("Database connection is null or closed");
        }
    }

    public boolean updateUserProfile(User user) {
        String query = "UPDATE users SET username = ?, fullName = ?, email = ?, phoneNumber = ?, address = ?, dob = ?, role = ? WHERE userId = ?";
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getFullName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setString(5, user.getAddress());
            ps.setDate(6, user.getDob() != null ? new java.sql.Date(user.getDob().getTime()) : null);
            ps.setString(7, user.getRole());
            ps.setInt(8, user.getUserId());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error in updateUserProfile: ", e);
            return false;
        }
    }

    public User getUserById(int userId) {
        User user = null;
        String query = "SELECT userId, username, fullName, email, phoneNumber, address, gender, dob, createdAt, role "
                + "FROM users WHERE userId = ?";
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setUsername(rs.getString("username"));
                user.setFullName(rs.getString("fullName"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setAddress(rs.getString("address"));
                user.setGender(rs.getString("gender"));
                user.setDob(rs.getDate("dob"));
                user.setCreatedAt(rs.getTimestamp("createdAt"));
                user.setRole(rs.getString("role"));
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error in getUserById: ", e);
        }
        return user;
    }

    public User authenticate(String username, String passwordHash) {
        String sql = "SELECT * FROM users WHERE Username = ? AND PasswordHash = ?";
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, passwordHash);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error in authenticate: ", ex);
        }
        return null;
    }

    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUserId(rs.getInt("UserID"));
        user.setUsername(rs.getString("Username"));
        user.setPasswordHash(rs.getString("PasswordHash"));
        user.setFullName(rs.getString("FullName"));
        user.setEmail(rs.getString("Email"));
        user.setRole(rs.getString("Role"));
        user.setCreatedAt(rs.getTimestamp("CreatedAt"));
        user.setGender(rs.getString("Gender"));
        user.setPhoneNumber(rs.getString("PhoneNumber"));
        user.setAddress(rs.getString("Address"));
        user.setDob(rs.getDate("Dob"));
        return user;
    }

    private void setUserParams(PreparedStatement ps, User user) throws SQLException {
        ps.setString(1, user.getUsername());
        ps.setString(2, user.getPasswordHash());
        ps.setString(3, user.getFullName());
        ps.setString(4, user.getEmail());
        ps.setString(5, user.getRole());
        ps.setTimestamp(6, new Timestamp(user.getCreatedAt().getTime()));
        ps.setString(7, user.getGender());
        ps.setString(8, user.getPhoneNumber());
        ps.setString(9, user.getAddress());
        ps.setDate(10, user.getDob() != null ? new java.sql.Date(user.getDob().getTime()) : null);
    }

    private void executeUpdate(String sql, Object... params) {
        try (Connection conn = dbContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            for (int i = 0; i < params.length; i++) {
                stmt.setObject(i + 1, params[i]);
            }
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private boolean checkExist(String sql, String value) {
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, value);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public void softDeleteUser(int id) {
        String sql = "UPDATE users SET isDeleted = TRUE WHERE UserID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> getDeletedUsers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE Role = 'Customer' AND isDeleted = TRUE";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("UserID"));
                u.setUsername(rs.getString("Username"));
                u.setPasswordHash(rs.getString("PasswordHash"));
                u.setFullName(rs.getString("FullName"));
                u.setEmail(rs.getString("Email"));
                u.setRole(rs.getString("Role"));
                u.setCreatedAt(rs.getTimestamp("CreatedAt"));
                u.setGender(rs.getString("Gender"));
                u.setPhoneNumber(rs.getString("PhoneNumber"));
                u.setAddress(rs.getString("Address"));
                u.setDob(rs.getDate("dob"));
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // Khôi phục tài khoản người dùng (chuyển trạng thái từ 'suspended' thành 'active')
    public boolean restoreUser(int userId) {
        String sql = "UPDATE users SET status = 'active' WHERE UserID = ? AND status = 'suspended'";
        try {
            checkConnection();
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, userId);
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "❌ Lỗi khôi phục tài khoản", ex);
            return false;
        }
    }

    public boolean insertUser(User user) {
        return addUser(user);
    }
    // Cập nhật thông tin người dùng

    public boolean updateUser(User user) {
        String sql = "UPDATE users SET Username = ?, FullName = ?, Email = ?, Role = ?, Gender = ?, PhoneNumber = ?, Address = ?, Dob = ? "
                + "WHERE UserID = ? AND status = 'active'";
        try {
            checkConnection();
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, user.getUsername());
                ps.setString(2, user.getFullName());
                ps.setString(3, user.getEmail());
                ps.setString(4, user.getRole());
                ps.setString(5, user.getGender());
                ps.setString(6, user.getPhoneNumber());
                ps.setString(7, user.getAddress());
                if (user.getDob() != null) {
                    ps.setDate(8, new java.sql.Date(user.getDob().getTime()));
                } else {
                    ps.setNull(8, Types.DATE);
                }
                ps.setInt(9, user.getUserId());
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "❌ Lỗi cập nhật user", ex);
            return false;
        }
    }
    // Từ chối người dùng (thay đổi trạng thái thành 'rejected')

    public boolean rejectUser(int userId) {
        // Kiểm tra người dùng có tồn tại và trạng thái 'active'
        User user = getUserById(userId);
        if (user == null || !user.getStatus().equals("active")) {
            LOGGER.log(Level.WARNING, "Người dùng không tồn tại hoặc không phải trạng thái 'active'");
            return false;
        }

        // Cập nhật trạng thái thành 'rejected'
        String sql = "UPDATE users SET status = 'rejected' WHERE UserID = ? AND status = 'active'";
        try {
            checkConnection();  // Kiểm tra kết nối CSDL
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, userId);  // Gán giá trị ID người dùng vào câu truy vấn
                return ps.executeUpdate() > 0;  // Nếu cập nhật thành công, trả về true
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "❌ Lỗi từ chối người dùng", ex);
            return false;
        }
    }
// Tìm kiếm người dùng theo tên đăng nhập, họ tên, hoặc email và trạng thái

    public List<User> searchUsers(String search, String status) {
        List<User> users = new ArrayList<>();
        // Sử dụng câu truy vấn SQL với điều kiện LIKE và trạng thái
        String sql = "SELECT * FROM users WHERE (username LIKE ? OR fullName LIKE ? OR email LIKE ?) AND status = ?";

        // Kiểm tra kết nối trước khi thực hiện truy vấn
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            // Nếu status là null, chuyển thành điều kiện không có trạng thái
            if (status == null) {
                sql = "SELECT * FROM users WHERE (username LIKE ? OR fullName LIKE ? OR email LIKE ?)";
                ps.setString(1, "%" + search + "%");
                ps.setString(2, "%" + search + "%");
                ps.setString(3, "%" + search + "%");
            } else {
                ps.setString(1, "%" + search + "%");
                ps.setString(2, "%" + search + "%");
                ps.setString(3, "%" + search + "%");
                ps.setString(4, status);
            }

            try (ResultSet rs = ps.executeQuery()) {
                // Duyệt qua kết quả trả về và thêm vào danh sách người dùng
                while (rs.next()) {
                    users.add(extractUserFromResultSet(rs));
                }
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "❌ Lỗi tìm kiếm người dùng", ex);
        }
        return users;
    }

// Chuyển đổi kết quả truy vấn từ ResultSet thành đối tượng User
private User extractUserFromResultSet(ResultSet rs) throws SQLException {
    User user = new User();

    // Lấy giá trị từ ResultSet và xử lý null values (nếu có)
    user.setUserId(rs.getInt("UserID")); // ID người dùng
    user.setUsername(rs.getString("Username")); // Tên đăng nhập
    user.setPasswordHash(rs.getString("PasswordHash")); // Mật khẩu (hashed)
    user.setFullName(rs.getString("FullName")); // Họ và tên
    user.setEmail(rs.getString("Email")); // Email
    user.setRole(rs.getString("Role")); // Vai trò (Admin, Staff, Customer, ...)
    
    // Xử lý ngày thr.setCreatedAt(new Daáng (sử dụng Optional để tránh lỗi null)
    Timestamp createdAt = rs.getTimestamp("CreatedAt");
    if (createdAt != null) {
        user.setCreatedAt(new java.util.Date(createdAt.getTime())); 
    }
    
    user.setGender(rs.getString("Gender")); // Giới tính
    user.setPhoneNumber(rs.getString("PhoneNumber")); // Số điện thoại
    user.setAddress(rs.getString("Address")); // Địa chỉ
    user.setDob(rs.getDate("Dob")); // Ngày sinh (Date type)

    // Lấy trạng thái (suspended or active)
    user.setStatus(rs.getString("status")); // Trạng thái người dùng (active/suspended)

    return user;
}

    // Lấy danh sách người dùng theo trạng thái
    public List<User> getUsersByStatus(String status) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE status = ?";
        try {
            checkConnection();  // Kiểm tra kết nối CSDL
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, status);  // Gán giá trị trạng thái vào câu truy vấn
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        users.add(extractUserFromResultSet(rs));  // Chuyển đổi dữ liệu kết quả truy vấn thành đối tượng User
                    }
                }
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "❌ Lỗi lấy danh sách người dùng theo trạng thái", ex);
        }
        return users;  // Trả về danh sách người dùng
    }

    public boolean verifyOtp(String email, String otp) {
        OtpData otpData = otpStore.get(email);
        if (otpData == null || System.currentTimeMillis() > otpData.expirationTime) {
            otpStore.remove(email);
            return false;
        }
        boolean isValid = otpData.otp.equals(otp);
        if (isValid) {
            otpStore.remove(email);
        }
        return isValid;
    }

    public boolean updatePassword(int userId, String newPassword) {
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement("UPDATE users SET PasswordHash = ? WHERE UserID = ?")) {
            ps.setString(1, newPassword);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Error updating password: " + e.getMessage(), e);
            return false;
        }
    }

    public int getUserIdByEmail(String email) {
        try (PreparedStatement ps = connection.prepareStatement("SELECT UserID FROM users WHERE Email = ?")) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("UserID");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public boolean checkEmailExist(String email) {
        return checkExist("SELECT * FROM users WHERE Email = ?", email);
    }

    public void storeOtp(String email, String otp) {
        otpStore.put(email, new OtpData(otp, System.currentTimeMillis() + OTP_EXPIRATION_MS));
    }

    // Xoá người dùng (tạm ngưng tài khoản)
    public boolean deleteUser(int userId) {
        String sql = "UPDATE users SET status = 'suspended' WHERE UserID = ?";
        try {
            checkConnection();
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, userId);
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "❌ Lỗi cập nhật trạng thái user", ex);
            return false;
        }
    }
}
