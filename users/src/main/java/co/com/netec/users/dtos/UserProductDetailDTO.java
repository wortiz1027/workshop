package co.com.netec.users.dtos;

import java.time.LocalDateTime;

public record UserProductDetailDTO(
        String relationId,
        String productId,
        LocalDateTime purchaseDate,
        ProductDTO productMetadata // Información recuperada en caliente desde la API externa
) {
}
