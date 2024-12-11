/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.NewsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.News;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

/**
 * @author micha
 */
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

    private final NewsDAO noticiaDAO = new NewsDAO();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        switch (action) {
            case "create" -> crearNoticia(request, response);
            case "update" -> response.getWriter().write("Actuali: ");
            case "delete" -> response.getWriter().write("Elimi: ");
            default -> throw new RuntimeException("Error");
        }

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void crearNoticia(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {

        String titulo = request.getParameter("titulo");
        String texto = request.getParameter("texto");
        if (titulo == null || titulo.isEmpty() || texto == null || texto.isEmpty()) {
            response.getWriter().println("Error: Los campos 'título' y 'texto' son obligatorios.");
            return;
        }
        /*String permalink = generarPermalink(titulo);

        String imagePath = cargarImagen(request, response);
        if (imagePath == null) {
            response.getWriter().println("Error: No se pudo cargar la imagen.");
            return;
        }*/

        LocalDate fecha = LocalDate.now();
        News newNoticia = News.builder()
                .titulo(titulo)
                .texto(texto)
                .fecha(fecha)
                .imagen("")
                .build();
        try {
            noticiaDAO.crearNoticia(newNoticia);
            response.sendRedirect("view/common/creada.jsp");
        } catch (SQLException e) {
            response.sendRedirect("view/common/nocreada.jsp");
        }

    }

}
