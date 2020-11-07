
package Models;

public class Valoracion {
    private int idValoracion;
    private String descripcion;
    private int valor;

    public Valoracion(int idValoracion, String descripcion, int valor) {
        this.idValoracion = idValoracion;
        this.descripcion = descripcion;
        this.valor = valor;
    }

    public int getIdValoracion() {
        return idValoracion;
    }

    public void setIdValoracion(int idValoracion) {
        this.idValoracion = idValoracion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }
    
    
}
