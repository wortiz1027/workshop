package co.com.netec.users.controllers;

import co.com.netec.users.dtos.PurchaseRequestDTO;
import co.com.netec.users.dtos.UserAggregateReportDTO;
import co.com.netec.users.dtos.UserProductDetailDTO;
import co.com.netec.users.services.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/users")
public class UserController {

    private static final Logger log = LoggerFactory.getLogger(UserController.class);
    private final UserService userService;

    // Inyección explícita por constructor para pruebas de aislamiento limpia
    public UserController(UserService userService) {
        this.userService = userService;
    }

    /**
     * GET /api/users/{id}/report
     * Retorna el reporte unificado del usuario unificando datos locales del
     * servidor
     * de usuarios y metadatos externos del servidor de productos vía RestClient.
     */
    @GetMapping("/{id}/report")
    public ResponseEntity<UserAggregateReportDTO> getUserAggregateReport(@PathVariable String id) {
        log.info("Recibida solicitud REST para generar reporte agregado del usuario: {}", id);

        UserAggregateReportDTO report = userService.getUserFullReport(id);

        return ResponseEntity.ok(report);
    }

    @PostMapping("/purchase")
    public ResponseEntity<UserProductDetailDTO> createPurchase(@RequestBody PurchaseRequestDTO purchaseRequest) {
        UserProductDetailDTO response = userService.registerPurchase(purchaseRequest);
        return new ResponseEntity<>(response, HttpStatus.CREATED);
    }
}
