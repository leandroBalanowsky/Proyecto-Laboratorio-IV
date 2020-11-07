/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Gestor.GestorDB;
import Models.Comercio;
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
@WebServlet(name = "ModificarComercio", urlPatterns = {"/ModificarComercio"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 6,
        location = "E:/Backup/Disco D/Document and Settings/Documentos de Leandro/TUP/Ejercitacion/LCIV/Parcial2/web/imagen/Comercios"
)
public class ModificarComercio extends HttpServlet {

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
            out.println("<title>Servlet ModificarComercio</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModificarComercio at " + request.getContextPath() + "</h1>");
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
        
        Comercio c = g.getComercioCompleto(id);
        
        request.setAttribute("comercio", c);

	RequestDispatcher rd = getServletContext().getRequestDispatcher("/ModificarComercio.jsp");
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
        
        int idComercio = Integer.parseInt(request.getParameter("txtIdComercio"));
        String nombre = request.getParameter("txtNombreComercio");
        String descripcion = request.getParameter("txtDescripcionComercio");
        String direccion = request.getParameter("txtDireccionComercio");
        int idRubro = Integer.parseInt(request.getParameter("cboRubros"));
        Rubro rubro = g.getRubro(idRubro);
        String imgComercio = request.getParameter("txtImgAnterior");
        for(Part part:  request.getParts()) {
            String fileName = getFileName(part);
            if (!fileName.isEmpty()) 
                part.write(nombre + fileName);
        }
        for(Part part:  request.getParts()) {
            String fileName = getFileName(part);
            if (!fileName.isEmpty()){
                imgComercio= nombre + fileName;
            }                
        }
        g.modificarComercio(new Comercio(idComercio, nombre, descripcion, direccion, rubro, imgComercio));
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
