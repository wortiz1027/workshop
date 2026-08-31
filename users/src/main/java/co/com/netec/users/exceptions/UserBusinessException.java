package co.com.netec.users.exceptions;

public class UserBusinessException extends RuntimeException {
    public UserBusinessException(String message) {
        super(message);
    }
}
