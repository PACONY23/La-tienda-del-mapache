package utez.edu.mx.market.entities;

public class Product {
    private long id;
    private String name;
    private String description;
    private long stock;
    private boolean onSale;
    private Category category;

    public Product() {
    }

    public Product(long id, String name, String description, long stock, boolean onSale, Category category) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.stock = stock;
        this.onSale = onSale;
        this.category = category;
    }

    public Product(String name, String description, long stock, boolean onSale, Category category) {
        this.name = name;
        this.description = description;
        this.stock = stock;
        this.onSale = onSale;
        this.category = category;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getStock() {
        return stock;
    }

    public void setStock(long stock) {
        this.stock = stock;
    }

    public boolean isOnSale() {
        return onSale;
    }

    public void setOnSale(boolean onSale) {
        this.onSale = onSale;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", stock=" + stock +
                ", onSale=" + onSale +
                ", category=" + category +
                '}';
    }
}
