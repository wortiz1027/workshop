package co.com.netec.users.entities;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "USERS")
public class User {

    @Id
    @Column(name = "USER_ID", length = 512)
    private String id;

    @Column(name = "USER_NAME", length = 512)
    private String name;

    @Column(name = "USER_EMAIL", length = 512)
    private String email;

    @Column(name = "USER_ROLE", length = 128)
    private String role;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<UserProduct> purchasedProducts = new ArrayList<>();

    // Constructores
    public User() {
    }

    public User(String id, String name, String email, String role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.role = role;
    }

    // Métodos Helper para gestionar la relación bidireccional de forma segura
    public void addProduct(UserProduct product) {
        purchasedProducts.add(product);
        product.setUser(this);
    }

    public void removeProduct(UserProduct product) {
        purchasedProducts.remove(product);
        product.setUser(null);
    }

    // Getters y Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public List<UserProduct> getPurchasedProducts() {
        return purchasedProducts;
    }

    public void setPurchasedProducts(List<UserProduct> purchasedProducts) {
        this.purchasedProducts = purchasedProducts;
    }
}
