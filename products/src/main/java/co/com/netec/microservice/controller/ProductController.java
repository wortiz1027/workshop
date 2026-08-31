package co.com.netec.microservice.controller;

import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import co.com.netec.microservice.dtos.ProductDTO;
import co.com.netec.microservice.exception.ProductBusinessException;
import co.com.netec.microservice.service.ProductService;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/api/products")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/search-native")
    public ResponseEntity<Page<ProductDTO>> getProductsByPriceNative(
            @RequestParam BigDecimal minPrice,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size) {
        return ResponseEntity.ok(productService.getProductsByPriceNative(minPrice, page, size));
    }

    @PostMapping("/native")
    public ResponseEntity<ProductDTO> addProductNative(@RequestBody ProductDTO productDTO) {
        ProductDTO savedProduct = productService.createProductNative(productDTO);
        return new ResponseEntity<>(savedProduct, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<ProductDTO>> getAllProducts() {
        return ResponseEntity.ok(productService.findAll());
    }

    @GetMapping("/names-list")
    public ResponseEntity<String> getNamesList() {
        return ResponseEntity.ok(productService.getConcatenatedProductNames());
    }

    @PutMapping("/bulk-discount")
    public ResponseEntity<List<ProductDTO>> applyDiscount(
            @RequestParam String keyword,
            @RequestParam String percentage) {

        double percentValue;
        try {
            percentValue = Double.parseDouble(percentage);
        } catch (NumberFormatException e) {
            throw new ProductBusinessException("El porcentaje debe ser un número válido.");
        }

        List<ProductDTO> updatedProducts = productService.applyBulkDiscount(keyword, percentValue);
        return ResponseEntity.ok(updatedProducts);
    }
}
