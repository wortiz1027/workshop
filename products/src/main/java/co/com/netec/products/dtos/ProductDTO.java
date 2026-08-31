package co.com.netec.products.dtos;

import java.math.BigDecimal;

public record ProductDTO(
        String id,
        String code,
        String name,
        String description,
        BigDecimal price) {
}