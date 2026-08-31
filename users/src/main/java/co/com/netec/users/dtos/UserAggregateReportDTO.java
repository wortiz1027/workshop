package co.com.netec.users.dtos;

import java.util.List;

public record UserAggregateReportDTO(
        String userId,
        String userName,
        String userEmail,
        String userRole,
        Integer totalProductsCalculatedBySp,
        List<UserProductDetailDTO> purchases) {
}
