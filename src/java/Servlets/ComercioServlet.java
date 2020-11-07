/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Dto.ComercioCompleto;
import Gestor.GestorDB;
import Models.Respuesta;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aelde
 */
@WebServlet(name = "ComercioServlet", urlPatterns = {"/ComercioServlet"})
public class ComercioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 		
       GestorDB g = new GestorDB();
        
        String idBuscarComercio = (String) request.getParameter("id");
        int id = Integer.parseInt(idBuscarComercio);
        ComercioCompleto com = new ComercioCompleto();
        com.setComercio(g.getComercioCompleto(id));
        com.setOferta(g.getOfertas(id));
        com.setComentario(g.getComentarios(id));
        com.setRespuestas(g.getRespuestas());
        
        request.setAttribute("com", com);
                
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/Comercio.jsp");
	rd.forward(request, response);

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        GestorDB g = new GestorDB();
        
        String idBuscarComercio = (String) request.getParameter("id");
        int id = Integer.parseInt(idBuscarComercio);
        ComercioCompleto com = new ComercioCompleto();
        com.setComercio(g.getComercioCompleto(id));
        com.setOferta(g.getOfertas(id));
        com.setComentario(g.getComentarios(id));
        com.setRespuestas(g.getRespuestas());
        
        request.setAttribute("com", com);
                
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/Comercio.jsp");
	rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
