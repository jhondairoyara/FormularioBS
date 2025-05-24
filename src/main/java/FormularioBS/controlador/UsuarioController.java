package FormularioBS.controlador;

import FormularioBS.modelo.Usuario;
import FormularioBS.modelo.Ciudad;     // ¡Necesitas esta importación!
import FormularioBS.dao.UsuarioRepository;
// import FormularioBS.dao.CiudadRepository; // Puedes mantenerlo si lo usas para cargar la ciudad completa

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam; // ¡Necesitas esta importación para recibir el ID de Ciudad!

@Controller
public class UsuarioController {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @GetMapping({"/", "/index", "/home"})
    public String mostrarFormulario(Model model) {
        model.addAttribute("usuario", new Usuario());
        return "index";
    }

    @PostMapping("/crearUsuario")
    public String crearUsuario(@ModelAttribute("usuario") Usuario usuario,
                               @RequestParam("idCiudad") Integer idCiudad,      // <--- Solo recibimos el ID numérico de Ciudad
                               Model model) { // ¡CAMBIO CLAVE: Eliminado @RequestParam para idDepartamento!
        try {
            // Spring ya llenó los campos básicos del 'usuario' (nombres, apellidos, etc.)
            // Ahora, MANEJAMOS LA RELACIÓN CON CIUDAD:

            // 1. Creamos un objeto Ciudad usando solo el ID recibido.
            Ciudad ciudad = new Ciudad(idCiudad);

            // 2. Asignamos este objeto Ciudad al usuario.
            usuario.setCiudad(ciudad);

            // 3. Guardar el usuario completo en la base de datos
            usuarioRepository.save(usuario);

            return "redirect:/registro_exito";

        } catch (Exception e) {
            model.addAttribute("mensajeError", "Error al registrar el usuario: " + e.getMessage() + ". Por favor, inténtalo de nuevo.");
            System.err.println("Error al crear usuario en UsuarioController: " + e.getMessage());
            e.printStackTrace();
            model.addAttribute("usuario", usuario); // Mantenemos los datos en el formulario si hay error
            return "index";
        }
    }

    @GetMapping("/registro_exito")
    public String registroExito() {
        return "registro_exito";
    }
}