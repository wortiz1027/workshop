package co.com.netec.users.dtos;

import java.math.BigDecimal;

public record ProductDTO(
        String id,
        String code,
        String name,
        String description,
        BigDecimal price) {
}
