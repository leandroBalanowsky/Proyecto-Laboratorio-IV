
package Dto;

import Models.Comentario;
import Models.Comercio;
import Models.Oferta;
import Models.Respuesta;
import Models.Rubro;
import java.util.ArrayList;


public class ComercioCompleto {
    private Comercio comercio;
    private ArrayList<Oferta> oferta;
    private ArrayList<Comentario> comentario;
    private ArrayList<Respuesta> respuestas;

    public ArrayList<Respuesta> getRespuestas() {
        return respuestas;
    }

    public void setRespuestas(ArrayList<Respuesta> respuestas) {
        this.respuestas = respuestas;
    }
    
    
    public Comercio getComercio() {
        return comercio;
    }

    public void setComercio(Comercio comercio) {
        this.comercio = comercio;
    }

    public ArrayList<Oferta> getOferta() {
        return oferta;
    }

    public void setOferta(ArrayList<Oferta> oferta) {
        this.oferta = oferta;
    }

    public ArrayList<Comentario> getComentario() {
        return comentario;
    }

    public void setComentario(ArrayList<Comentario> comentario) {
        this.comentario = comentario;
    }

    
    
    
    
    
    
    
    
}
