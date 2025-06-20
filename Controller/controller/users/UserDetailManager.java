package controller.users;

import dal.UserDAO;
import model.User;

import java.util.List;
import java.util.Scanner;

public class UserDetailManager {
    private static final Scanner scanner = new Scanner(System.in);
    private static final UserDAO DAO = new UserDAO();

    public static void run() {
        int choice;
        do {
            System.out.println("\n=== User Manager ===");
            System.out.println("1. Add User");
            System.out.println("2. Update User");
            System.out.println("3. Delete User");
            System.out.println("4. Reject User (simulate)");
            System.out.println("5. View User Detail");
            System.out.println("6. Exit");
            System.out.println("7. View All Users (Table)");
            System.out.print("Choose an option: ");

            choice = Integer.parseInt(scanner.nextLine());

            switch (choice) {
                case 1:
                    addUser();
                    break;
                case 2:
                    updateUser();
                    break;
                case 3:
                    deleteUser();
                    break;
                case 4:
                    rejectUser();
                    break;
                case 5:
                    viewUserDetail();
                    break;
                case 6:
                    System.out.println("Exiting User Manager.");
                    break;
                case 7:
                    viewAllUsers();
                    break;
                default:
                    System.out.println("Invalid choice. Try again.");
            }

        } while (choice != 6);
    }

    private static void addUser() {
        System.out.print("Enter username: ");
        String username = scanner.nextLine();

        System.out.print("Enter full name: ");
        String fullName = scanner.nextLine();

        System.out.print("Enter email: ");
        String email = scanner.nextLine();

        System.out.print("Enter role: ");
        String role = scanner.nextLine();

        System.out.print("Enter gender: ");
        String gender = scanner.nextLine();

        System.out.print("Enter phone number: ");
        String phone = scanner.nextLine();

        System.out.print("Enter address: ");
        String address = scanner.nextLine();

        System.out.print("Enter date of birth (yyyy-mm-dd): ");
        String dob = scanner.nextLine();

        User user = new User();
        user.setUsername(username);
        user.setFullName(fullName);
        user.setEmail(email);
        user.setRole(role);
        user.setGender(gender);
        user.setPhoneNumber(phone);
        user.setAddress(address);
        user.setDobFromString(dob);

        DAO.insertUser(user);
        System.out.println("User added successfully.");
    }

    private static void updateUser() {
        System.out.print("Enter User ID to update: ");
        int userId = Integer.parseInt(scanner.nextLine());

        User existing = DAO.getUserById(userId);
        if (existing == null) {
            System.out.println("User not found.");
            return;
        }

        System.out.print("New full name (" + existing.getFullName() + "): ");
        String fullName = scanner.nextLine();
        if (!fullName.isEmpty()) existing.setFullName(fullName);

        System.out.print("New email (" + existing.getEmail() + "): ");
        String email = scanner.nextLine();
        if (!email.isEmpty()) existing.setEmail(email);

        System.out.print("New role (" + existing.getRole() + "): ");
        String role = scanner.nextLine();
        if (!role.isEmpty()) existing.setRole(role);

        System.out.print("New phone number (" + existing.getPhoneNumber() + "): ");
        String phone = scanner.nextLine();
        if (!phone.isEmpty()) existing.setPhoneNumber(phone);

        DAO.updateUser(existing);
        System.out.println("User updated successfully.");
    }

    private static void deleteUser() {
        System.out.print("Enter User ID to delete: ");
        int userId = Integer.parseInt(scanner.nextLine());

        boolean success = DAO.deleteUser(userId);
        if (success) {
            System.out.println("User deleted successfully.");
        } else {
            System.out.println("User not found or could not be deleted.");
        }
    }

    private static void rejectUser() {
        System.out.print("Enter User ID to reject: ");
        int userId = Integer.parseInt(scanner.nextLine());

        User user = DAO.getUserById(userId);
        if (user != null) {
            System.out.println("Simulating rejection of user: " + user.getFullName());
        } else {
            System.out.println("User not found.");
        }
    }

    private static void viewUserDetail() {
        System.out.print("Enter User ID to view: ");
        int userId = Integer.parseInt(scanner.nextLine());

        User user = DAO.getUserById(userId);
        if (user != null) {
            printDetail(user);
        } else {
            System.out.println("User not found.");
        }
    }

    private static void viewAllUsers() {
        List<User> users = DAO.getAllUsers();
        if (users.isEmpty()) {
            System.out.println("No users found.");
        } else {
            for (User u : users) {
                printDetail(u);
            }
        }
    }

    private static void printDetail(User u) {
        System.out.println("----------------------------");
        System.out.println("ID: " + u.getUserId());
        System.out.println("Username: " + u.getUsername());
        System.out.println("Full Name: " + u.getFullName());
        System.out.println("Email: " + u.getEmail());
        System.out.println("Role: " + u.getRole());
        System.out.println("Gender: " + u.getGender());
        System.out.println("Phone: " + u.getPhoneNumber());
        System.out.println("Address: " + u.getAddress());
        System.out.println("DOB: " + u.getDob());
        System.out.println("Created At: " + u.getCreatedAt());
    }
}
