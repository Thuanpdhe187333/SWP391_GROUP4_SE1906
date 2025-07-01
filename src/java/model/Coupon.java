/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

public class Coupon {
    private int id;
    private String code;
    private String description;
    private double discount;
    private Date expiryDate;
    private int usageLimit;

    // Constructors, getters, setters
    public Coupon(int id, String code, String description, double discount, Date expiryDate, int usageLimit) {
        this.id = id;
        this.code = code;
        this.description = description;
        this.discount = discount;
        this.expiryDate = expiryDate;
        this.usageLimit = usageLimit;
    }

    public String getCode() {
        return code;
    }

    public double getDiscount() {
        return discount;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public int getUsageLimit() {
        return usageLimit;
    }

    public boolean isExpired() {
        return expiryDate != null && expiryDate.before(new Date());
    }
}

