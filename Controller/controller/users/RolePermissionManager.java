package controller.users;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import model.User;

/**
 *
 * @author daidu
 */
public class RolePermissionManager {

    private static final Map<String, Set<String>> rolePermissions = new HashMap<>();

    static {
        // Manager
        registerRole("Manager",
                "product:create", "product:update", "product:delete",
                "category:manage", "brand:manage",
                "coupon:create", "coupon:view", "coupon:delete", "coupon:send_notification",
                "employee:create", "employee:update", "employee:delete", "employee:list",
                "report:view", "order:list"
        );
        // Staff
        registerRole("Staff",
                "review:view", "review:reply",
                "chat:manage", "video:chat:start",
                "product:create.limited", "product:update.limited", "stock:update",
                "order:confirm", "order:update_status"
        );
        // Customer
        registerRole("Customer",
                "account:register", "account:login", "account:forgot_password",
                "account:change_password", "account:profile:update",
                "product:browse", "product:detail", "wishlist:add",
                "cart:manage", "discount:apply",
                "order:create", "order:track", "order:cancel", "order:refund",
                "review:create", "message:seller",
                "history:view"
        );
        // Guest
        registerRole("Guest",
                "product:browse", "product:detail",
                "account:register", "account:login"
        );
        // Shipper
        registerRole("Shipper",
                "order:assigned:view", "order:status:update", "delivery:history:view"
        );
        // Admin
        registerRole("Admin",
                "user:list", "user:permission:assign",
                "system:log:view"
        );
    }

    private static void registerRole(String role, String... perms) {
        rolePermissions.put(role, new HashSet<>(Arrays.asList(perms)));
    }

    /**
     * In ra & trả về permission của user
     */
    public static Set<String> assignPermissions(User u) {
        String r = u.getRole();
        Set<String> perms = rolePermissions.getOrDefault(r, Collections.emptySet());
        System.out.println("Role: " + r);
        perms.forEach(p -> System.out.println("  • " + p));
        return perms;
    }

    /**
     * Kiểm tra quyền
     */
    public static boolean hasPermission(User u, String perm) {
        return rolePermissions
                .getOrDefault(u.getRole(), Collections.emptySet())
                .contains(perm);
    }
}
