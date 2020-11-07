
package Models;

public class Oferta {
    private int idOferta;
    private String producto;   
    private int idComercio;
    private String comercio;
    private double precio;
    private String imgProducto;

    public Oferta(int idOferta, String producto, String comercio, double precio) {
        this.idOferta = idOferta;
        this.producto = producto;
        this.comercio = comercio;
        this.precio = precio;
    }

    public String getComercio() {
        return comercio;
    }

    public void setComercio(String comercio) {
        this.comercio = comercio;
    }
    
    

    public Oferta(int idOferta, String producto, int idComercio, double precio, String imgProducto) {
        this.idOferta = idOferta;
        this.producto = producto;
        this.idComercio = idComercio;
        this.precio = precio;
        this.imgProducto = imgProducto;
    }

    public Oferta(String producto, int idComercio, double precio, String imgProducto) {
        this.producto = producto;
        this.idComercio = idComercio;
        this.precio = precio;
        this.imgProducto = imgProducto;
    }

    public int getIdOferta() {
        return idOferta;
    }

    public void setIdOferta(int idOferta) {
        this.idOferta = idOferta;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public int getIdComercio() {
        return idComercio;
    }

    public void setIdComercio(int idComercio) {
        this.idComercio = idComercio;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getImgProducto() {
        return imgProducto;
    }

    public void setImgProducto(String imgProducto) {
        this.imgProducto = imgProducto;
    }
    
    
}
