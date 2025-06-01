package com.mycosmetics.ai;

import com.mycosmetics.model.User; // Assuming User class is in this package
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * AIRecommendationEngine provides personalized product recommendations based on user
 * behavior and product attributes.
 * In a real-world scenario, this would involve machine learning models.
 */
public class AIRecommendationEngine {

    // Simulating product inventory (replace with actual ProductService/DAO in real app)
    private static Map<Integer, Product> productInventory = new HashMap<>();

    static {
        // Sample Product Data (replace with database actual data)
        productInventory.put(1, new Product(1, "Hydrating Face Cream", "Moisturizes skin", 50.0, "Skin Care", "Dry Skin"));
        productInventory.put(2, new Product(2, "Anti-Aging Serum", "Reduces wrinkles", 85.0, "Skin Care", "Mature Skin"));
        productInventory.put(3, new Product(3, "Vitamin C Brightening Mask", "Brightens complexion", 30.0, "Face Mask", "Dull Skin"));
        productInventory.put(4, new Product(4, "SPF 50 Sunscreen", "Protects from UV rays", 25.0, "Sun Protection", "All Skin Types"));
        productInventory.put(5, new Product(5, "Volumizing Mascara", "Adds volume to lashes", 20.0, "Makeup", "Eye Makeup"));
        productInventory.put(6, new Product(6, "Matte Lipstick (Red)", "Long-lasting matte finish", 18.0, "Makeup", "Lipstick"));
        productInventory.put(7, new Product(7, "Gentle Cleansing Foam", "Removes impurities", 35.0, "Skin Care", "Sensitive Skin"));
        productInventory.put(8, new Product(8, "Exfoliating Scrub", "Deeply cleanses pores", 40.0, "Skin Care", "Oily Skin"));
        productInventory.put(9, new Product(9, "Hair Repair Mask", "Repairs damaged hair", 28.0, "Hair Care", "Damaged Hair"));
        productInventory.put(10, new Product(10, "Perfume (Floral)", "Fresh floral scent", 95.0, "Fragrance", "Luxury"));
    }

    private AIRecommendationEngine() {
        // Private constructor for utility class
    }

    /**
     * Recommends products based on the user's past interactions (simulated)
     * and general popular products.
     *
     * @param user The User object for whom to generate recommendations.
     * @param numberOfRecommendations The desired number of recommendations.
     * @return A list of recommended Product objects.
     */
    public static List<Product> getRecommendations(User user, int numberOfRecommendations) {
        List<Product> recommendations = new ArrayList<>();
        Random random = new Random();

        Set<Integer> recommendedProductIds = new HashSet<>();

        // Simulate user preferences based on an assumed skin type (e.g., from user profile)
        String userSimulatedSkinType = getUserSimulatedSkinType(user);

        List<Product> skinTypeMatches = productInventory.values().stream()
                .filter(p -> p.getTags().contains(userSimulatedSkinType))
                .collect(Collectors.toList());

        // Add skin type matches first
        for (Product p : skinTypeMatches) {
            if (recommendations.size() < numberOfRecommendations && recommendedProductIds.add(p.getId())) {
                recommendations.add(p);
            }
        }

        // Fill remaining slots with other random popular products
        List<Product> allProducts = new ArrayList<>(productInventory.values());
        Collections.shuffle(allProducts, random);

        for (Product p : allProducts) {
            if (recommendations.size() < numberOfRecommendations && recommendedProductIds.add(p.getId())) {
                recommendations.add(p);
            }
        }

        // Ensure the list is exactly the requested size if too many were added, or fill up
        // if still not enough unique products were found through initial logic
        if (recommendations.size() > numberOfRecommendations) {
            return recommendations.subList(0, numberOfRecommendations);
        } else { // If less than requested, try to fill with any remaining unique products
            for (Product p : productInventory.values()) {
                if (recommendations.size() < numberOfRecommendations && recommendedProductIds.add(p.getId())) {
                    recommendations.add(p);
                }
            }
        }

        return recommendations;
    }

    /**
     * A simulated method to get user's skin type/preference.
     * In a real application, this would come from the User object's profile or
     * be inferred from purchase history.
     * @param user The user object.
     * @return A simulated skin type.
     */
    private static String getUserSimulatedSkinType(User user) {
        if (user != null && user.getId() != 0) {
            // Very basic simulation based on user ID
            if (user.getId() % 3 == 0) return "Dry Skin";
            if (user.getId() % 3 == 1) return "Oily Skin";
            if (user.getId() % 3 == 2) return "Sensitive Skin";
        }
        return "All Skin Types"; // Default for guests or new users
    }

    /**
     * Internal Product class for demonstration.
     * In a real application, this would be a separate class in com.mycosmetics.model.
     */
    public static class Product {
        private int id;
        private String name;
        private String description;
        private double price;
        private String category;
        private Set<String> tags; // e.g., "Dry Skin", "Anti-Aging", "Lipstick"

        public Product(int id, String name, String description, double price, String category, String... tags) {
            this.id = id;
            this.name = name;
            this.description = description;
            this.price = price;
            this.category = category;
            this.tags = new HashSet<>();
            Collections.addAll(this.tags, tags);
        }

        public int getId() { return id; }
        public String getName() { return name; }
        public String getDescription() { return description; }
        public double getPrice() { return price; }
        public String getCategory() { return category; }
        public Set<String> getTags() { return tags; }

        @Override
        public String toString() {
            return "Product{" + "id=" + id + ", name='" + name + '\'' + ", price=" + price + '}';
        }
        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Product product = (Product) o;
            return id == product.id;
        }
        @Override
        public int hashCode() {
            return Integer.hashCode(id);
        }
    }
}