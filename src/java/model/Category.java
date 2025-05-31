/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author daidu
 */
public class Category {
    private int categoryID;
    private String categoryName;
    private Integer parentID;
    private List<Category> children;

    public Category() {
    }

    public Category(int categoryID, String categoryName, Integer parentID) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.parentID = parentID;
    }
    
    

    public Category(int categoryID, String categoryName, Integer parentID, List<Category> children) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.parentID = parentID;
        this.children = children;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Integer getParentID() {
        return parentID;
    }

    public void setParentID(Integer parentID) {
        this.parentID = parentID;
    }

    public List<Category> getChildren() {
        return children;
    }

    public void setChildren(List<Category> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryID=" + categoryID + ", categoryName=" + categoryName + ", parentID=" + parentID + ", children=" + children + '}';
    }

    
    
    
    
    
}
