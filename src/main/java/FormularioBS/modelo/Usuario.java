package FormularioBS.modelo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn; // Necesaria para @JoinColumn
import jakarta.persistence.ManyToOne;  // Necesaria para @ManyToOne
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import java.io.Serializable;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat; // <-- ¡NUEVA IMPORTACIÓN REQUERIDA!

@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id_Usuario") // Mapea a la columna 'Id_Usuario' en la DB
    private Long id;

    @Column(name = "Nombres", nullable = false, length = 50)
    private String nombres;

    @Column(name = "Apellidos", nullable = false, length = 50)
    private String apellidos;

    @Column(name = "Telefono", nullable = false, length = 15)
    private String telefono;

    @Column(name = "Direccion", nullable = false, length = 150)
    private String direccion;

    // --- ¡AQUÍ SOLO QUEDA LA RELACIÓN CON CIUDAD! ---
    @ManyToOne // Un Usuario pertenece a una Ciudad
    @JoinColumn(name = "Id_Ciudad", nullable = false) // Nombre de la columna de la FK en la tabla 'usuario' en la BD
    private Ciudad ciudad; // Ahora es un objeto Ciudad

    // ¡CAMBIO CLAVE: NO HAY CAMPO 'DEPARTAMENTO' AQUÍ!

    @Column(name = "Fecha_Nacimiento", nullable = false)
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd") // <-- ¡ESTA ES LA LÍNEA QUE FALTABA!
    private Date fechaNacimiento;

    // Constructor sin argumentos (¡Necesario para JPA!)
    public Usuario() {
    }

    // Constructor con todos los argumentos (¡ACTUALIZA ESTE SI LO USAS!)
    // Deberías cambiar 'Integer idCiudad' por 'Ciudad ciudad' y eliminar 'Departamento departamento'
    // public Usuario(Long id, String nombres, String apellidos, String telefono, String direccion, Ciudad ciudad, Date fechaNacimiento) {
    //     this.id = id;
    //     this.nombres = nombres;
    //     this.apellidos = apellidos;
    //     this.telefono = telefono;
    //     this.direccion = direccion;
    //     this.ciudad = ciudad;
    //     this.fechaNacimiento = fechaNacimiento;
    // }

    // --- Métodos Getters y Setters ---

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    // --- GETTERS Y SETTERS PARA CIUDAD ---
    public Ciudad getCiudad() {
        return ciudad;
    }

    public void setCiudad(Ciudad ciudad) {
        this.ciudad = ciudad;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    // Opcional: Puedes añadir un método toString(), equals() y hashCode() aquí si lo necesitas.
}