package co.com.netec.microservice.exception;

public class ProductBusinessException extends RuntimeException {

    public ProductBusinessException(String message) {
        super(message);
    }
}