package FormularioBS.modelo;

import jakarta.persistence.Column; // Asegúrate de importar Column
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "ciudad")
public class Ciudad {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idCiudad;

    @Column(name = "Nom_Ciudad") // ¡CAMBIO AQUÍ! Nombre de la columna en tu BD
    private String nombreCiudad;

    public Ciudad() {
    }

    public Ciudad(Integer idCiudad) {
        this.idCiudad = idCiudad;
    }

    public Integer getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(Integer idCiudad) {
        this.idCiudad = idCiudad;
    }

    public String getNombreCiudad() {
        return nombreCiudad;
    }

    public void setNombreCiudad(String nombreCiudad) {
        this.nombreCiudad = nombreCiudad;
    }

    @Override
    public String toString() {
        return "Ciudad{" +
               "idCiudad=" + idCiudad +
               ", nombreCiudad='" + nombreCiudad + '\'' +
               '}';
    }
}