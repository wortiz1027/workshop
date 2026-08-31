package co.com.netec.users;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "co.com.netec.users")
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

}
