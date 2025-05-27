    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cosmeticshop.users;

/**
 *
 * @author Admin
 */
public class Staff extends User {
    public Staff(String username, String password) {
        super(username, password, "Staff");
    }
    @Override
    public void displayPermissions() {
        System.out.println("- Handle orders");
        System.out.println("- Manage inventory");
        System.out.println("- Support customers");
    }
}