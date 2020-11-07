
package Models;

public class Comercio 
{
    private int idComercio;
    private String nombre;
    private String descripcion;
    private String direccion;
    private Rubro rubro;
    private String imgComercio;

    public Comercio(int idComercio, String nombre, String descripcion, String direccion, Rubro rubro, String imgComercio) {
        this.idComercio = idComercio;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.direccion = direccion;
        this.rubro = rubro;
        this.imgComercio = imgComercio;
    }

    public Comercio(String nombre, String descripcion, String direccion, Rubro rubro, String imgComercio) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.direccion = direccion;
        this.rubro = rubro;
        this.imgComercio = imgComercio;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Rubro getRubro() {
        return rubro;
    }

    public void setRubro(Rubro rubro) {
        this.rubro = rubro;
    }

    public String getImgComercio() {
        return imgComercio;
    }

    public void setImgComercio(String imgComercio) {
        this.imgComercio = imgComercio;
    }
    
    
    
    
            
}
