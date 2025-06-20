package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

public class User {
    private int userId;
    private String username;
    private String passwordHash;
    private String fullName;
    private String email;
    private String role;
    private Date createdAt;
    private String gender;
    private String phoneNumber;
    private String address;
    private Date dob;

    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public User() {}

    public User(int userId, String username, String passwordHash, String fullName,
                String email, String role, Date createdAt,
                String gender, String phoneNumber, String address, Date dob) {
        this.userId = userId;
        this.username = username;
        this.passwordHash = passwordHash;
        this.fullName = fullName;
        this.email = email;
        this.role = role;
        this.createdAt = createdAt;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.dob = dob;
    }

    // Getters and Setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPasswordHash() { return passwordHash; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public Date getDob() { return dob; }
    public void setDob(Date dob) { this.dob = dob; }

    public void setDobFromString(String dobString) {
        try {
            this.dob = sdf.parse(dobString);
        } catch (ParseException e) {
            System.err.println("❌ Invalid date format for DOB: " + dobString + ". Expected format: yyyy-MM-dd");
            this.dob = null;
        }
    }

    public String getDobAsString() {
        return (dob != null) ? sdf.format(dob) : "N/A";
    }

    public String getCreatedAtAsString() {
        return (createdAt != null) ? new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(createdAt) : "N/A";
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", role='" + role + '\'' +
                ", createdAt=" + getCreatedAtAsString() +
                ", gender='" + gender + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", address='" + address + '\'' +
                ", dob=" + getDobAsString() +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User user)) return false;
        return userId == user.userId &&
                Objects.equals(username, user.username) &&
                Objects.equals(email, user.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, username, email);
    }
}
