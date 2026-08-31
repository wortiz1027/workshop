package co.com.netec.users.repositories;

import co.com.netec.users.entities.UserProduct;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserProductRepository extends JpaRepository<UserProduct, String> {

    // Consulta directa de relaciones filtradas por el ID del usuario
    List<UserProduct> findByUserId(String userId);
}
