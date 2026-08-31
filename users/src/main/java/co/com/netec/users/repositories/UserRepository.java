package co.com.netec.users.repositories;

import co.com.netec.users.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, String> {

    // 🚀 Optimización: Recupera el usuario y sus productos en una sola consulta SQL
    @Query("SELECT u FROM User u LEFT JOIN FETCH u.purchasedProducts WHERE u.id = :userId")
    Optional<User> findByIdWithProducts(@Param("userId") String userId);

    // Ejecuta el procedimiento almacenado nativo de este servidor de usuarios
    @Procedure(procedureName = "sp_obtener_metricas_usuario")
    Integer obtenerMetricasUsuario(@Param("p_user_id") String userId);
}
