package FormularioBS; // ¡Paquete raíz!

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// Para aplicaciones WAR, se recomienda extender SpringBootServletInitializer
// Esto permite que el WAR sea desplegado en un servidor de aplicaciones tradicional
// y también pueda ser ejecutado como un JAR embebido.
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


@SpringBootApplication // Esta es la anotación principal de Spring Boot
public class FormularioBsApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        // Método principal que inicia la aplicación Spring Boot
        SpringApplication.run(FormularioBsApplication.class, args);
    }

    // Sobreescribe este método para configurar el constructor de la aplicación
    // Esto es necesario para el despliegue como WAR
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(FormularioBsApplication.class);
    }
}