package com.mycosmetics.security;

import com.mycosmetics.model.User;
import java.util.*;

/**
 * The RolePermissionManager class manages roles, permissions, and user role assignments.
 */
public class RolePermissionManager {

    private static final Map<Integer, Role> roles = new HashMap<>();
    private static final Map<Integer, Permission> permissions = new HashMap<>();
    private static final Map<Integer, Set<Integer>> rolePermissions = new HashMap<>();
    private static final Map<Integer, Set<Integer>> userRoles = new HashMap<>();

    static {
        // Define roles
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

        // Define permissions
        Permission manageUsers = new Permission(101, "MANAGE_USERS", "Manage users");
        Permission viewUsers = new Permission(102, "VIEW_USERS", "View users");
        Permission assignRoles = new Permission(103, "ASSIGN_ROLES", "Assign roles");

        Permission createProduct = new Permission(201, "CREATE_PRODUCT", "Create product");
        Permission editProduct = new Permission(202, "EDIT_PRODUCT", "Edit product");
        Permission deleteProduct = new Permission(203, "DELETE_PRODUCT", "Delete product");
        Permission viewProduct = new Permission(204, "VIEW_PRODUCT", "View product");

        Permission viewOrders = new Permission(301, "VIEW_ORDERS", "View orders");
        Permission updateOrderStatus = new Permission(302, "UPDATE_ORDER_STATUS", "Update order");
        Permission cancelOrder = new Permission(303, "CANCEL_ORDER", "Cancel order");

        Permission addToCart = new Permission(401, "ADD_TO_CART", "Add to cart");
        Permission checkout = new Permission(402, "CHECKOUT", "Checkout");
        Permission viewOwnOrders = new Permission(403, "VIEW_OWN_ORDERS", "View own orders");

        Permission pickUpOrder = new Permission(501, "PICK_UP_ORDER", "Pick up order");
        Permission deliverOrder = new Permission(502, "DELIVER_ORDER", "Deliver order");

        Permission useChatSuggest = new Permission(601, "USE_CHAT_SUGGEST", "Use chat suggest");

        Permission accessAdminDashboard = new Permission(701, "ACCESS_ADMIN_DASHBOARD", "Access admin dashboard");

        // Add to map
        for (Permission p : Arrays.asList(
                manageUsers, viewUsers, assignRoles,
                createProduct, editProduct, deleteProduct, viewProduct,
                viewOrders, updateOrderStatus, cancelOrder,
                addToCart, checkout, viewOwnOrders,
                pickUpOrder, deliverOrder,
                useChatSuggest, accessAdminDashboard)) {
            permissions.put(p.getId(), p);
        }

        // Assign permissions to roles
        addPermissionsToRole(adminRole.getId(), manageUsers, viewUsers, assignRoles, createProduct, editProduct,
                deleteProduct, viewProduct, viewOrders, updateOrderStatus, cancelOrder, accessAdminDashboard);
        addPermissionsToRole(managerRole.getId(), viewUsers, createProduct, editProduct, deleteProduct, viewProduct,
                viewOrders, updateOrderStatus, cancelOrder, accessAdminDashboard);
        addPermissionsToRole(staffRole.getId(), viewProduct, viewOrders, updateOrderStatus, cancelOrder);
        addPermissionsToRole(shipperRole.getId(), pickUpOrder, deliverOrder, viewOrders);
        addPermissionsToRole(customerRole.getId(), viewProduct, addToCart, checkout, viewOwnOrders, useChatSuggest);
        addPermissionsToRole(guestRole.getId(), viewProduct);
        addPermissionsToRole(chatSuggestRole.getId(), useChatSuggest);
    }

    private RolePermissionManager() {}

    private static void addPermissionsToRole(int roleId, Permission... perms) {
        Set<Integer> permIds = rolePermissions.getOrDefault(roleId, new HashSet<>());
        for (Permission p : perms) {
            permIds.add(p.getId());
        }
        rolePermissions.put(roleId, permIds);
    }

    public static boolean assignRoleToUser(int userId, int roleId) {
        if (!roles.containsKey(roleId)) {
            System.err.println("Error: Role with ID " + roleId + " does not exist.");
            return false;
        }
        Set<Integer> userRoleIds = userRoles.getOrDefault(userId, new HashSet<>());
        boolean added = userRoleIds.add(roleId);
        userRoles.put(userId, userRoleIds);
        return added;
    }

    public static boolean removeRoleFromUser(int userId, int roleId) {
        Set<Integer> userRoleIds = userRoles.get(userId);
        if (userRoleIds != null) {
            return userRoleIds.remove(roleId);
        }
        return false;
    }

    public static List<Role> getUserRoles(int userId) {
        List<Role> userRoleList = new ArrayList<>();
        Set<Integer> roleIds = userRoles.get(userId);
        if (roleIds != null) {
            for (int roleId : roleIds) {
                Role role = roles.get(roleId);
                if (role != null) {
                    userRoleList.add(role);
                }
            }
        }
        return userRoleList;
    }

    public static boolean hasPermission(User user, String requiredPermissionName) {
        if (user == null || user.getId() == 0) {
            return requiredPermissionName.equals("VIEW_PRODUCT");
        }

        Set<Integer> userRoleIds = userRoles.get(user.getId());
        if (userRoleIds == null || userRoleIds.isEmpty()) {
            return false;
        }

        for (int roleId : userRoleIds) {
            Set<Integer> permissionIds = rolePermissions.get(roleId);
            if (permissionIds != null) {
                for (int permId : permissionIds) {
                    Permission perm = permissions.get(permId);
                    if (perm != null && perm.getName().equals(requiredPermissionName)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public static List<Role> getAllRoles() {
        return new ArrayList<>(roles.values());
    }

    public static List<Permission> getAllPermissions() {
        return new ArrayList<>(permissions.values());
    }

    // Inner classes

    public static class Role {
        private final int id;
        private final String name;
        private final String description;

        public Role(int id, String name, String description) {
            this.id = id;
            this.name = name;
            this.description = description;
        }

        public int getId() { return id; }
        public String getName() { return name; }
        public String getDescription() { return description; }

        @Override
        public String toString() {
            return name + " (" + description + ")";
        }
    }

    public static class Permission {
        private final int id;
        private final String name;
        private final String description;

        public Permission(int id, String name, String description) {
            this.id = id;
            this.name = name;
            this.description = description;
        }

        public int getId() { return id; }
        public String getName() { return name; }
        public String getDescription() { return description; }

        @Override
        public String toString() {
            return name + " - " + description;
        }
    }
}
