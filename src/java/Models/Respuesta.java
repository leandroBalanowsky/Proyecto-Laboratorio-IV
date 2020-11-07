
package Models;

public class Respuesta {
    private int idRespuesta;
    private String mensaje;
    private int idComentario;

    public Respuesta(String mensaje, int idComentario) {
        this.mensaje = mensaje;
        this.idComentario = idComentario;
    }

    public Respuesta(int idRespuesta, String mensaje, int idComentario) {
        this.idRespuesta = idRespuesta;
        this.mensaje = mensaje;
        this.idComentario = idComentario;
    }

    public int getIdRespuesta() {
        return idRespuesta;
    }

    public void setIdRespuesta(int idRespuesta) {
        this.idRespuesta = idRespuesta;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setRespuesta(String mensaje) {
        this.mensaje = mensaje;
    }

    public int getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(int idComentario) {
        this.idComentario = idComentario;
    }
    
    
}
