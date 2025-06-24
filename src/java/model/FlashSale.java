/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author daidu
 */
public class FlashSale {
    private int saleID;
    private int categoryID;
    private Date startTime;
    private Date endTime;
    private int discountPercent;

    public FlashSale() {
    }

    public FlashSale(int saleID, int categoryID, Date startTime, Date endTime, int discountPercent) {
        this.saleID = saleID;
        this.categoryID = categoryID;
        this.startTime = startTime;
        this.endTime = endTime;
        this.discountPercent = discountPercent;
    }

    public int getSaleID() {
        return saleID;
    }

    public void setSaleID(int saleID) {
        this.saleID = saleID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public int getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(int discountPercent) {
        this.discountPercent = discountPercent;
    }

    @Override
    public String toString() {
        return "FlashSale{" + "saleID=" + saleID + ", categoryID=" + categoryID + ", startTime=" + startTime + ", endTime=" + endTime + ", discountPercent=" + discountPercent + '}';
    }
    
    
}
