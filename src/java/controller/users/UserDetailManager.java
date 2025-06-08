package controller.users;

import dao.UserDetailDAO;
import model.UserDetail;
import java.util.List;
import java.util.Scanner;

public class UserDetailManager {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        UserDetailDAO dao = new UserDetailDAO();

        while (true) {
            System.out.println("\n=== User Detail Manager ===");
            System.out.println("1. Add User");
            System.out.println("2. Update User");
            System.out.println("3. Delete User");
            System.out.println("4. Reject User (simulate)");
            System.out.println("5. View User Detail");
            System.out.println("6. Exit");
            System.out.print("Choose an option: ");
            int choice = scanner.nextInt();
            scanner.nextLine(); // consume newline

            switch (choice) {
                case 1:
                    addUser(scanner, dao);
                    break;
                case 2:
                    int toUpdate = chooseUser(scanner, dao);
                    if (toUpdate > 0) updateUser(scanner, dao, toUpdate);
                    break;
                case 3:
                    int toDelete = chooseUser(scanner, dao);
                    if (toDelete > 0) deleteUser(scanner, dao, toDelete);
                    break;
                case 4:
                    int toReject = chooseUser(scanner, dao);
                    if (toReject > 0) rejectUser(toReject);
                    break;
                case 5:
                    int toView = chooseUser(scanner, dao);
                    if (toView > 0) viewUserDetail(dao, toView);
                    break;
                case 6:
                    System.out.println("Goodbye!");
                    scanner.close();
                    System.exit(0);
                default:
                    System.out.println("Invalid option. Try again.");
            }
        }
    }

    /** Cho phép print all hoặc nhập ID rồi trả về ID đó */
    private static int chooseUser(Scanner sc, UserDetailDAO dao) {
        while (true) {
            System.out.println("\n1. Show all users");
            System.out.println("2. Enter user ID");
            System.out.print("Choice: ");
            int c = sc.nextInt();
            sc.nextLine();
            if (c == 1) {
                List<UserDetail> list = dao.getAllUserDetails();
                if (list.isEmpty()) {
                    System.out.println("No users found.");
                } else {
                    System.out.println("\n--- All Users ---");
                    for (UserDetail u : list) {
                        printSummary(u);
                    }
                }
                System.out.print("Enter user ID: ");
                int id = sc.nextInt();
                sc.nextLine();
                return id;
            } else if (c == 2) {
                System.out.print("Enter user ID: ");
                int id = sc.nextInt();
                sc.nextLine();
                return id;
            } else {
                System.out.println("Invalid choice, try again.");
            }
        }
    }

    /** In tóm tắt mỗi user trong list */
    private static void printSummary(UserDetail u) {
        System.out.printf("%-5d | %-15s | %s%n",
            u.getUserId(), u.getUsername(), u.getFullName());
    }

    /** In chi tiết một user */
    private static void viewUserDetail(UserDetailDAO dao, int id) {
        UserDetail u = dao.getUserDetailById(id);
        if (u != null) {
            System.out.println("\n--- User Detail ---");
            printUser(u);
        } else {
            System.out.println("User with ID " + id + " not found.");
        }
    }

    /** Create mới */
    private static void addUser(Scanner sc, UserDetailDAO dao) {
        System.out.println("\n--- Add User ---");
        System.out.print("Username: ");
        String username = sc.nextLine();
        System.out.print("Password: ");
        String passwordHash = sc.nextLine();
        System.out.print("Full Name: ");
        String fullName = sc.nextLine();
        System.out.print("Email: ");
        String email = sc.nextLine();
        System.out.print("Role: ");
        String role = sc.nextLine();
        System.out.print("Created At (YYYY-MM-DD): ");
        String createdAt = sc.nextLine();

        UserDetail u = new UserDetail(0, username, passwordHash, fullName, email, role, createdAt);
        boolean ok = dao.insertUser(u);
        System.out.println(ok ? "✅ Added." : "❌ Add failed.");
    }

    /** Update */
    private static void updateUser(Scanner sc, UserDetailDAO dao, int id) {
        UserDetail old = dao.getUserDetailById(id);
        if (old == null) {
            System.out.println("User not found.");
            return;
        }
        System.out.println("\n--- Current Data ---");
        printUser(old);
        System.out.println("\n--- Enter new values (blank = keep old) ---");

        System.out.print("Username ("+old.getUsername()+"): ");
        String username = sc.nextLine();
        if (username.isEmpty()) username = old.getUsername();

        System.out.print("Password: ");
        String pass = sc.nextLine();
        if (pass.isEmpty()) pass = old.getPasswordHash();

        System.out.print("Full Name ("+old.getFullName()+"): ");
        String fullName = sc.nextLine();
        if (fullName.isEmpty()) fullName = old.getFullName();

        System.out.print("Email ("+old.getEmail()+"): ");
        String email = sc.nextLine();
        if (email.isEmpty()) email = old.getEmail();

        System.out.print("Role ("+old.getRole()+"): ");
        String role = sc.nextLine();
        if (role.isEmpty()) role = old.getRole();

        System.out.print("Created At ("+old.getCreatedAt()+"): ");
        String createdAt = sc.nextLine();
        if (createdAt.isEmpty()) createdAt = old.getCreatedAt();

        UserDetail upd = new UserDetail(id, username, pass, fullName, email, role, createdAt);
        boolean ok = dao.updateUser(upd);
        System.out.println(ok ? "✅ Updated." : "❌ Update failed.");
    }

    /** Delete */
    private static void deleteUser(Scanner sc, UserDetailDAO dao, int id) {
        System.out.print("Confirm delete user ID " + id + "? (y/N): ");
        String ans = sc.nextLine();
        if (ans.equalsIgnoreCase("y")) {
            boolean ok = dao.deleteUser(id);
            System.out.println(ok ? "✅ Deleted." : "❌ Delete failed.");
        } else {
            System.out.println("Cancelled.");
        }
    }

    /** Simulate reject */
    private static void rejectUser(int id) {
        System.out.println("✅ User with ID " + id + " has been rejected (simulated).");
    }

    /** In chi tiết toàn bộ */
    private static void printUser(UserDetail u) {
        System.out.println("ID:            " + u.getUserId());
        System.out.println("Username:      " + u.getUsername());
        System.out.println("Full Name:     " + u.getFullName());
        System.out.println("Email:         " + u.getEmail());
        System.out.println("Role:          " + u.getRole());
        System.out.println("Created At:    " + u.getCreatedAt());
    }
}
