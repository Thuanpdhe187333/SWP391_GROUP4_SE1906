package com.mycosmetics.security;

import com.mycosmetics.model.User; // Assuming User class is in this package
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * The RolePermissionManager class manages roles, permissions, and user role assignments.
 * This is the core of the authorization system in the online cosmetics application.
 */
public class RolePermissionManager {

    private static Map<Integer, Role> roles = new HashMap<>();
    private static Map<Integer, Permission> permissions = new HashMap<>();
    private static Map<Integer, Set<Integer>> rolePermissions = new HashMap<>();
    private static Map<Integer, Set<Integer>> userRoles = new HashMap<>();

    static {
        // 1. Create Roles
        Role adminRole = new Role(1, "ADMIN", "Administrator with full system access");
        Role managerRole = new Role(2, "MANAGER", "Manages business, products, and orders");
        Role staffRole = new Role(3, "STAFF", "Handles order processing and customer support");
        Role shipperRole = new Role(4, "SHIPPER", "Responsible for order delivery");
        Role customerRole = new Role(5, "CUSTOMER", "Regular shopping customer");
        Role guestRole = new Role(6, "GUEST", "Unregistered visitor");
        Role chatSuggestRole = new Role(7, "CHAT_SUGGEST", "User interacting via chat suggestions");

        roles.put(adminRole.getId(), adminRole);
        roles.put(managerRole.getId(), managerRole);
        roles.put(staffRole.getId(), staffRole);
        roles.put(shipperRole.getId(), shipperRole);
        roles.put(customerRole.getId(), customerRole);
        roles.put(guestRole.getId(), guestRole);
        roles.put(chatSuggestRole.getId(), chatSuggestRole);

        // 2. Create Permissions
        // User management permissions
        Permission manageUsers = new Permission(101, "MANAGE_USERS", "Manage (create/edit/delete) users");
        Permission viewUsers = new Permission(102, "VIEW_USERS", "View user list");
        Permission assignRoles = new Permission(103, "ASSIGN_ROLES", "Assign/Unassign roles to users");

        // Product management permissions
        Permission createProduct = new Permission(201, "CREATE_PRODUCT", "Create new products");
        Permission editProduct = new Permission(202, "EDIT_PRODUCT", "Edit existing products");
        Permission deleteProduct = new Permission(203, "DELETE_PRODUCT", "Delete products");
        Permission viewProduct = new Permission(204, "VIEW_PRODUCT", "View product details");

        // Order management permissions
        Permission viewOrders = new Permission(301, "VIEW_ORDERS", "View list of orders");
        Permission updateOrderStatus = new Permission(302, "UPDATE_ORDER_STATUS", "Update order status");
        Permission cancelOrder = new Permission(303, "CANCEL_ORDER", "Cancel orders");

        // Cart and checkout permissions
        Permission addToCart = new Permission(401, "ADD_TO_CART", "Add products to shopping cart");
        Permission checkout = new Permission(402, "CHECKOUT", "Proceed to checkout");
        Permission viewOwnOrders = new Permission(403, "VIEW_OWN_ORDERS", "View personal orders");

        // Shipping permissions
        Permission pickUpOrder = new Permission(501, "PICK_UP_ORDER", "Pick up an order for delivery");
        Permission deliverOrder = new Permission(502, "DELIVER_ORDER", "Deliver order and update status");

        // Chat interaction permissions
        Permission useChatSuggest = new Permission(601, "USE_CHAT_SUGGEST", "Use chat suggestion feature");

        // General access permissions
        Permission accessAdminDashboard = new Permission(701, "ACCESS_ADMIN_DASHBOARD", "Access Admin Dashboard");

        permissions.put(manageUsers.getId(), manageUsers);
        permissions.put(viewUsers.getId(), viewUsers);
        permissions.put(assignRoles.getId(), assignRoles);
        permissions.put(createProduct.getId(), createProduct);
        permissions.put(editProduct.getId(), editProduct);
        permissions.put(deleteProduct.getId(), deleteProduct);
        permissions.put(viewProduct.getId(), viewProduct);
        permissions.put(viewOrders.getId(), viewOrders);
        permissions.put(updateOrderStatus.getId(), updateOrderStatus);
        permissions.put(cancelOrder.getId(), cancelOrder);
        permissions.put(addToCart.getId(), addToCart);
        permissions.put(checkout.getId(), checkout);
        permissions.put(viewOwnOrders.getId(), viewOwnOrders);
        permissions.put(pickUpOrder.getId(), pickUpOrder);
        permissions.put(deliverOrder.getId(), deliverOrder);
        permissions.put(useChatSuggest.getId(), useChatSuggest);
        permissions.put(accessAdminDashboard.getId(), accessAdminDashboard);

        // 3. Assign Permissions to Roles (Role-Permission Mapping)
        // ADMIN
        addPermissionsToRole(adminRole.getId(), manageUsers, viewUsers, assignRoles, createProduct, editProduct,
                             deleteProduct, viewProduct, viewOrders, updateOrderStatus, cancelOrder,
                             accessAdminDashboard);

        // MANAGER
        addPermissionsToRole(managerRole.getId(), viewUsers, createProduct, editProduct, deleteProduct, viewProduct,
                             viewOrders, updateOrderStatus, cancelOrder, accessAdminDashboard);

        // STAFF
        addPermissionsToRole(staffRole.getId(), viewProduct, viewOrders, updateOrderStatus, cancelOrder);

        // SHIPPER
        addPermissionsToRole(shipperRole.getId(), pickUpOrder, deliverOrder, viewOrders);

        // CUSTOMER
        addPermissionsToRole(customerRole.getId(), viewProduct, addToCart, checkout, viewOwnOrders, useChatSuggest);

        // GUEST
        addPermissionsToRole(guestRole.getId(), viewProduct);

        // CHAT_SUGGEST
        addPermissionsToRole(chatSuggestRole.getId(), useChatSuggest);

        // 4. Assign Roles to Users (User-Role Mapping) - Example data
        // In a real application, user roles would be assigned upon registration or by an Admin.
        // User adminUser = new User(1, "admin@example.com", "admin", "Admin");
        // User customerUser = new User(2, "customer@example.com", "customer", "Customer");
        // assignRoleToUser(adminUser.getId(), adminRole.getId());
        // assignRoleToUser(customerUser.getId(), customerRole.getId());
    }

    // Private constructor to enforce utility class or Singleton pattern (e.g., using Spring @Service)
    private RolePermissionManager() {}

    /**
     * Helper method to add permissions to a role.
     * @param roleId The ID of the role.
     * @param perms An array of Permission objects to add.
     */
    private static void addPermissionsToRole(int roleId, Permission... perms) {
        Set<Integer> permIds = rolePermissions.getOrDefault(roleId, new HashSet<>());
        for (Permission p : perms) {
            permIds.add(p.getId());
        }
        rolePermissions.put(roleId, permIds);
    }

    /**
     * Assigns a role to a user.
     * In a real application, this would persist to a database (e.g., a user_roles table).
     *
     * @param userId The ID of the user.
     * @param roleId The ID of the role.
     * @return true if assignment was successful, false otherwise.
     */
    public static boolean assignRoleToUser(int userId, int roleId) {
        if (!roles.containsKey(roleId)) {
            System.err.println("Error: Role with ID " + roleId + " does not exist.");
            return false;
        }
        // Assuming userId exists, in a real app, you'd validate with User DAO.
        Set<Integer> userRoleIds = userRoles.getOrDefault(userId, new HashSet<>());
        boolean added = userRoleIds.add(roleId);
        userRoles.put(userId, userRoleIds);
        return added;
    }

    /**
     * Removes a role from a user.
     *
     * @param userId The ID of the user.
     * @param roleId The ID of the role.
     * @return true if removal was successful, false otherwise.
     */
    public static boolean removeRoleFromUser(int userId, int roleId) {
        Set<Integer> userRoleIds = userRoles.get(userId);
        if (userRoleIds != null) {
            return userRoleIds.remove(roleId);
        }
        return false;
    }

    /**
     * Retrieves all roles assigned to a user.
     *
     * @param userId The ID of the user.
     * @return A list of Role objects assigned to the user.
     */
    public static List<Role> getUserRoles(int userId) {
        List<Role> userRoleList = new ArrayList<>();
        Set<Integer> roleIds = userRoles.get(userId);
        if (roleIds != null) {
            for (int roleId : roleIds) {
                if (roles.containsKey(roleId)) {
                    userRoleList.add(roles.get(roleId));
                }
            }
        }
        return userRoleList;
    }

    /**
     * Checks if a user has a specific permission.
     * This is the most crucial method for authorization.
     *
     * @param user The current authenticated User object.
     * @param requiredPermissionName The name of the permission to check (e.g., "EDIT_PRODUCT").
     * @return true if the user has the permission, false otherwise.
     */
    public static boolean hasPermission(User user, String requiredPermissionName) {
        if (user == null || user.getId() == 0) { // Assuming guest user might have ID 0 or be null
            // Guests only have VIEW_PRODUCT permission
            return requiredPermissionName.equals("VIEW_PRODUCT");
        }

        // 1. Get all roles for the user
        Set<Integer> userRoleIds = userRoles.get(user.getId());
        if (userRoleIds == null || userRoleIds.isEmpty()) {
            return false; // User has no roles
        }

        // 2. For each of the user's roles, check assigned permissions
        for (int roleId : userRoleIds) {
            Set<Integer> permissionIdsForRole = rolePermissions.get(roleId);
            if (permissionIdsForRole != null) {
                for (int permId : permissionIdsForRole) {
                    Permission permission = permissions.get(permId);
                    if (permission != null && permission.getName().equals(requiredPermissionName)) {
                        return true; // Permission found, return true immediately
                    }
                }
            }
        }
        return false; // No matching permission found
    }

    /**
     * Retrieves a list of all defined roles.
     * @return List of all Role objects.
     */
    public static List<Role> getAllRoles() {
        return new ArrayList<>(roles.values());
    }

    /**
     * Retrieves a list of all defined permissions.
     * @return List of all Permission objects.
     */
    public static List<Permission> getAllPermissions() {
        return new ArrayList<>(permissions.values());
    }

    // Inner Model Classes (Can be moved to separate files in com.mycosmetics.model package)
    // ------------------------------------------------------------------------------------------

    /**
     * Represents a Role in the system.
     */
    public static class Role {
        private int id;
        private String name; // e.g., "ADMIN", "CUSTOMER"
        private String description;

        public Role(int id, String name, String description) {
            this.id = id;
            this.name = name;
            this.description = description;
        }

        public int getId() { return id; }
        public String getName() { return name; }
        public String getDescription() { return description; }

        @Override
        public String toString() { return "Role{" + "id=" + id + ", name='" + name + '\'' + '}'; }
        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Role role = (Role) o;
            return id == role.id;
        }
        @Override
        public int hashCode() { return Integer.hashCode(id); }
    }

    /**
     * Represents a specific Permission.
     */
    public static class Permission {
        private int id;
        private String name; // e.g., "CREATE_PRODUCT", "VIEW_ORDERS"
        private String description;

        public Permission(int id, String name, String description) {
            this.id = id;
            this.name = name;
            this.description = description;
        }

        public int getId() { return id; }
        public String getName() { return name; }
        public String getDescription() { return description; }

        @Override
        public String toString() { return "Permission{" + "id=" + id + ", name='" + name + '\'' + '}'; }
        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Permission that = (Permission) o;
            return id == that.id;
        }
        @Override
        public int hashCode() { return Integer.hashCode(id); }
    }
}