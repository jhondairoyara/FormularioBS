package FormularioBS; // ¡Paquete raíz!

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class FormularioBsApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(FormularioBsApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(FormularioBsApplication.class);
    }
}