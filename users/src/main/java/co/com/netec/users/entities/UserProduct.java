package co.com.netec.users.entities;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "USERS_PRODUCTS")
public class UserProduct {

    @Id
    @Column(name = "RELATION_ID", length = 512)
    private String relationId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "USER_ID", nullable = false, foreignKey = @ForeignKey(name = "FK_USERS_PRODUCTS_USER"))
    private User user;

    @Column(name = "PRODUCT_ID", length = 512, nullable = false)
    private String productId;

    @Column(name = "PURCHASE_DATE")
    private LocalDateTime purchaseDate;

    // Constructores
    public UserProduct() {
    }

    public UserProduct(String relationId, String productId, LocalDateTime purchaseDate) {
        this.relationId = relationId;
        this.productId = productId;
        this.purchaseDate = purchaseDate;
    }

    // Getters y Setters
    public String getRelationId() {
        return relationId;
    }

    public void setRelationId(String relationId) {
        this.relationId = relationId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public LocalDateTime getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(LocalDateTime purchaseDate) {
        this.purchaseDate = purchaseDate;
    }
}
