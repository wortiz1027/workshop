package co.com.netec.users.exceptions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;

import co.com.netec.users.dtos.ErrorResponse;

import java.time.LocalDateTime;

@RestControllerAdvice
public class GlobalExceptionHandler {
    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(UserBusinessException.class)
    public ResponseEntity<ErrorResponse> handleUserBusinessException(UserBusinessException ex, WebRequest request) {
        ErrorResponse error = new ErrorResponse(
                java.time.LocalDateTime.now(),
                HttpStatus.UNPROCESSABLE_CONTENT.value(),
                "Unprocessable Content",
                ex.getMessage(),
                request.getDescription(false).replace("uri=", ""));
        return new ResponseEntity<>(error, org.springframework.http.HttpStatus.UNPROCESSABLE_CONTENT);
    }
}
