package co.com.netec.microservice.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.math.BigDecimal;

@Entity
@Table(name = "PRODUCTS")
public class Product {

    @Id
    @Column(name = "PRODUCT_ID", length = 512)
    private String id;

    @Column(name = "PRODUCT_CODE", length = 512)
    private String code;

    @Column(name = "PRODUCT_NAME", length = 512)
    private String name;

    @Column(name = "PRODUCT_DESCRIPTION", length = 512)
    private String description;

    @Column(name = "PRODUCT_PRICE", precision = 10, scale = 2)
    private BigDecimal price;

    // Constructores, Getters y Setters
    public Product() {
    }

    public Product(String id, String code, String name, String description, BigDecimal price) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.description = description;
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}