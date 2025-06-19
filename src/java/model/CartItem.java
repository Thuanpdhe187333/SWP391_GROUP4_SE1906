package model;

public class CartItem {
    private Product product;
    private int quantity;

    public CartItem() {
    }

    public CartItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    // Thêm phương thức getTotalPrice()
    public double getTotalPrice() {
        if (product != null && product.getPrice() != 0) {
            return product.getPrice() * quantity;
        }
        return 0.0;
    }
}
