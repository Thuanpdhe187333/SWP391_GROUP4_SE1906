package com.cosmeticshop.users;

public class Admin extends User {
    public Admin(String username, String password) {
        super(username, password, "Admin");
    }

    public void manageUsers() {
        System.out.println("Admin is managing users...");
    }
}
