
package Dto;

public class PromValoracion {
    public int idComercio;
    private String nombre;
    private String rubro;
    private int promEstrella;

    public PromValoracion(int idComercio, String nombre, String rubro, int promEstrella) {
        this.idComercio = idComercio;
        this.nombre = nombre;
        this.rubro = rubro;
        this.promEstrella = promEstrella;
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

    public String getRubro() {
        return rubro;
    }

    public void setRubro(String rubro) {
        this.rubro = rubro;
    }

    public int getPromEstrella() {
        return promEstrella;
    }

    public void setPromEstrella(int promEstrella) {
        this.promEstrella = promEstrella;
    }
    
    
}
