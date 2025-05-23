package com.cosmeticshop.auth;

import com.cosmeticshop.users.*;

import java.util.HashMap;
import java.util.Scanner;

public class LoginSystem {
    private static HashMap<String, User> users = new HashMap<>();

    public static void main(String[] args) {
        initializeUsers();
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter username: ");
        String username = scanner.nextLine();

        System.out.print("Enter password: ");
        String password = scanner.nextLine();

        User user = authenticate(username, password);
        if (user != null) {
            user.login();
            assignPermissions(user);
        } else {
            System.out.println("Invalid username or password.");
        }

        scanner.close();
    }

    private static void initializeUsers() {
        users.put("adminUser", new Admin("adminUser", "admin123"));
        users.put("customerUser", new Customer("customerUser", "customer123"));
    }

    private static User authenticate(String username, String password) {
        if (users.containsKey(username) && users.get(username).password.equals(password)) {
            return users.get(username);
        }
        return null;
    }

    private static void assignPermissions(User user) {
        switch (user.getRole()) {
            case "Admin":
                ((Admin) user).manageUsers();
                break;
            case "Customer":
                ((Customer) user).browseProducts();
                break;
            default:
                System.out.println("No special permissions assigned.");
        }
    }
}
