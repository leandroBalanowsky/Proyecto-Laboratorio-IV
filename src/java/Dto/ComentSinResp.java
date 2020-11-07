
package Dto;


public class ComentSinResp {
    private int idComentario;
    private String nombre;
    private String mensaje;
    private int idComercio;
    private String comercio;

    public ComentSinResp(int idComentario, String nombre, String mensaje, int idComercio, String comercio) {
        this.idComentario = idComentario;
        this.nombre = nombre;
        this.mensaje = mensaje;
        this.idComercio = idComercio;
        this.comercio = comercio;
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

    public String getComercio() {
        return comercio;
    }

    public void setComercio(String comercio) {
        this.comercio = comercio;
    }
    
    
}
