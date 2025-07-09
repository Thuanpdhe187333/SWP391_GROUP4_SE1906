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
    private int saleId;
    private int categoryId;
    private Date startTime;
    private Date endTime;
    private int discountPercent;

    public FlashSale() {
    }

    public FlashSale(int saleId, int categoryId, Date startTime, Date endTime, int discountPercent) {
        this.saleId = saleId;
        this.categoryId = categoryId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.discountPercent = discountPercent;
    }

    public int getSaleId() {
        return saleId;
    }

    public void setSaleId(int saleId) {
        this.saleId = saleId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
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
        return "FlashSale{" + "saleId=" + saleId + ", categoryId=" + categoryId + ", startTime=" + startTime + ", endTime=" + endTime + ", discountPercent=" + discountPercent + '}';
    }
    
    
}
