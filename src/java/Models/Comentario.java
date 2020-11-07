
package Models;

import java.util.ArrayList;

public class Comentario {
    private int idComentario;
    private String nombre;
    private String mensaje;
    private int idComercio;
    private String comercio;
    private Valoracion valoracion;
    

    public Comentario(int idComentario, String nombre, String mensaje, String comercio) {
        this.idComentario = idComentario;
        this.nombre = nombre;
        this.mensaje = mensaje;
        this.comercio = comercio;
    }

    public String getComercio() {
        return comercio;
    }

    public void setComercio(String comercio) {
        this.comercio = comercio;
    }

    

    public Comentario(int idComentario, String nombre, String mensaje, int idComercio, Valoracion valoracion ) {
        this.idComentario = idComentario;
        this.nombre = nombre;
        this.mensaje = mensaje;
        this.idComercio = idComercio;
        this.valoracion = valoracion;
        
    }

    public Comentario(String nombre, String mensaje, int idComercio, Valoracion valoracion) {
        this.nombre = nombre;
        this.mensaje = mensaje;
        this.idComercio = idComercio;
        this.valoracion = valoracion;
    }

    public int getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(int idComentario) {
        this.idComentario = idComentario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public int getIdComercio() {
        return idComercio;
    }

    public void setIdComercio(int idComercio) {
        this.idComercio = idComercio;
    }

    public Valoracion getValoracion() {
        return valoracion;
    }

    public void setValoracion(Valoracion valoracion) {
        this.valoracion = valoracion;
    }


    
    
    
}
