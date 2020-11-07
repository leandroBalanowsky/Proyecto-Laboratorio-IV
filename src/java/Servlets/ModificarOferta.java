/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Gestor.GestorDB;
import Models.Oferta;
import Models.Rubro;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author aelde
 */
@WebServlet(name = "ModificarOferta", urlPatterns = {"/ModificarOferta"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 6,
        location = "E:/Backup/Disco D/Document and Settings/Documentos de Leandro/TUP/Ejercitacion/LCIV/Parcial2/web/imagen/Ofertas"
)
public class ModificarOferta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ModificarOferta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModificarOferta at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("Usuario") == null) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/LoginServlet");
            rd.forward(request, response);
            return;
        }
        GestorDB g = new GestorDB();	

	String idModificar = (String) request.getParameter("id");
        int id = Integer.parseInt(idModificar);
        
        Oferta o = g.getOferta(id);
        
        request.setAttribute("oferta", o);

	RequestDispatcher rd = getServletContext().getRequestDispatcher("/ModificarOferta.jsp");
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
        GestorDB g = new GestorDB();
        int idOferta = Integer.parseInt(request.getParameter("txtIdOferta"));
        String producto = request.getParameter("txtProducto");
        int idComercio = Integer.parseInt(request.getParameter("cboComercios"));
        double precio = Double.parseDouble(request.getParameter("txtPrecio"));
        String imgProducto = request.getParameter("txtImgProducto");
        
        
        for(Part part:  request.getParts()) {
            String fileName = getFileName(part);
            if (!fileName.isEmpty()) 
                part.write(producto + fileName);
        }
        for(Part part:  request.getParts()) {
            String fileName = getFileName(part);
            if (!fileName.isEmpty()){
                imgProducto= producto + fileName;
            }
                
        }
        
        
        
        g.modificarOferta(new Oferta(idOferta, producto, idComercio, precio, imgProducto));
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/BajaModificacion");
	rd.forward(request, response);
    }
    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "";
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
