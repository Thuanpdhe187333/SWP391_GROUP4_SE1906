package model;

import java.sql.Timestamp;

public class Coupon {
    private int couponId;
    private String code;
    private String description;
    private double discount;
    private Timestamp expiryDate;
    private int usageLimit;
    private Timestamp createdAt;

    // Constructor mặc định
    public Coupon() {
    }

    // Constructor đầy đủ
    public Coupon(int couponId, String code, String description, double discount,
                  Timestamp expiryDate, int usageLimit, Timestamp createdAt) {
        this.couponId = couponId;
        this.code = code;
        this.description = description;
        this.discount = discount;
        this.expiryDate = expiryDate;
        this.usageLimit = usageLimit;
        this.createdAt = createdAt;
    }

    // Getter và Setter
    public int getCouponId() {
        return couponId;
    }

    public void setCouponId(int couponId) {
        this.couponId = couponId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code != null ? code.trim() : null;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description != null ? description.trim() : null;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public Timestamp getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Timestamp expiryDate) {
        this.expiryDate = expiryDate;
    }

    public int getUsageLimit() {
        return usageLimit;
    }

    public void setUsageLimit(int usageLimit) {
        this.usageLimit = usageLimit;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    // Optional: hiển thị thông tin để debug
    @Override
    public String toString() {
        return "Coupon{" +
                "couponId=" + couponId +
                ", code='" + code + '\'' +
                ", description='" + description + '\'' +
                ", discount=" + discount +
                ", expiryDate=" + expiryDate +
                ", usageLimit=" + usageLimit +
                ", createdAt=" + createdAt +
                '}';
    }
}
