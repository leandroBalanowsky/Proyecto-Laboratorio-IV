//
package Models;


public class Rubro {
    private int idRubro;
    private String rubro;

    public Rubro(int idRubro, String rubro) {
        this.idRubro = idRubro;
        this.rubro = rubro;
    }

    public Rubro(String rubro) {
        this.rubro = rubro;
    }

    public int getIdRubro() {
        return idRubro;
    }

    public void setIdRubro(int idRubro) {
        this.idRubro = idRubro;
    }

    public String getRubro() {
        return rubro;
    }

    public void setRubro(String rubro) {
        this.rubro = rubro;
    }
    
    
}
