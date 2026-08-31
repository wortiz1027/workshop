package co.com.netec.products.repository;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import co.com.netec.products.entity.Product;

public interface ProductRepository extends JpaRepository<Product, String> {

    @Procedure(procedureName = "sp_listar_nombres_productos")
    String llamarSpListarNombres();

    @Query("SELECT p FROM Product p WHERE LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<Product> findByNameContainingKeyword(@Param("keyword") String keyword);

    @Query(value = "SELECT * FROM PRODUCTS WHERE PRODUCT_PRICE >= :minPrice",
           countQuery = "SELECT COUNT(*) FROM PRODUCTS WHERE PRODUCT_PRICE >= :minPrice",
           nativeQuery = true)
    Page<Product> findByPriceNativePaged(@Param("minPrice") BigDecimal minPrice, Pageable pageable);

    @Modifying
    @Query(value = "INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_CODE, PRODUCT_NAME, PRODUCT_DESCRIPTION, PRODUCT_PRICE) " +
                   "VALUES (:id, :code, :name, :description, :price)", 
           nativeQuery = true)
    void insertProductNative(
            @Param("id") String id,
            @Param("code") String code,
            @Param("name") String name,
            @Param("description") String description,
            @Param("price") BigDecimal price
    );
    
}
