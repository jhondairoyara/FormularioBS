package FormularioBS.dao; 

import FormularioBS.modelo.Usuario; // Importa la entidad Usuario
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository 
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
}