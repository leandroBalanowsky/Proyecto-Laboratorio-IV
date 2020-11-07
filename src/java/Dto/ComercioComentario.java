
package Dto;


public class ComercioComentario {
    private int idComercio;
    private String nombre;
    private int cantiComentarios;

    public ComercioComentario(int idComercio, String nombre, int cantiComentarios) {
        this.idComercio = idComercio;
        this.nombre = nombre;
        this.cantiComentarios = cantiComentarios;
    }

    public int getIdComercio() {
        return idComercio;
    }

    public void setIdComercio(int idComercio) {
        this.idComercio = idComercio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantiComentarios() {
        return cantiComentarios;
    }

    public void setCantiComentarios(int cantiComentarios) {
        this.cantiComentarios = cantiComentarios;
    }
    
    
}
