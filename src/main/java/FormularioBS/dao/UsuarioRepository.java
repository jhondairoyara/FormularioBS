package FormularioBS.dao; // ¡Asegúrate de que este paquete sea correcto!

import FormularioBS.modelo.Usuario; // Importa la entidad Usuario
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository // Le dice a Spring que esta interfaz es un repositorio (DAO)
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
    // Spring Data JPA se encargará de crear una implementación
    // de esta interfaz en tiempo de ejecución, proporcionando métodos CRUD.
}