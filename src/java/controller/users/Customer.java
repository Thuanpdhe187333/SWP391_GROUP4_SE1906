package com.cosmeticshop.users;

public class Customer extends User {
    public Customer(String username, String password) {
        super(username, password, "Customer");
    }

    public void browseProducts() {
        System.out.println("Customer is browsing products...");
    }
}
