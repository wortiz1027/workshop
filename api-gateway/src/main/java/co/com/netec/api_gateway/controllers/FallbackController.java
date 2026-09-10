package co.com.netec.api_gateway.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FallbackController {
    @GetMapping("/fallback")
    public String fallback() {
        return "Service is currently unavailable. Please try again later.";
    }
}
