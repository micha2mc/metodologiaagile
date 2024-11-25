/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.Administracion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.io.File;
import jakarta.servlet.http.Part;

import model.Administracion.administracionDAO.NoticiaDAO;
import config.ConnectionDB;
import jakarta.servlet.annotation.MultipartConfig;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import model.Administracion.NoticiaModelo;

/**
 *
 * @author Home
 */
@WebServlet("/administracion-noticia/*")
@MultipartConfig
public class NoticiaControllador extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "src/main/webapp/img";
    private NoticiaDAO noticiaDAO;

    /**
     *
     * @throws ServletException
     */
    @Override
    public void init() throws ServletException {

        ConnectionDB connectionDB = new ConnectionDB();
        Connection connection = connectionDB.ConnectionDB();
        noticiaDAO = new NoticiaDAO(connection);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path = request.getPathInfo();

        try {
            if (path != null) {
                switch (path) {
                    case "/create":
                        crearNoticia(request, response);
                        break;
                    case "/delete":
                        eliminarNoticia(request, response);
                        break;
                          default:
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Ruta no válida");
                        break;
                }
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ruta no especificada");
            }
        }catch (Exception e) {
            throw new ServletException(e);
    }

}

private void crearNoticia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = 0;
        String titulo = request.getParameter("titulo");
        String texto = request.getParameter("texto");
        if (titulo == null || titulo.isEmpty() || texto == null || texto.isEmpty()) {
            response.getWriter().println("Error: Los campos 'título' y 'texto' son obligatorios.");
            return;
        }
        String permalink = generarPermalink(titulo);

        String imagePath = cargarImagen(request, response);
        if (imagePath == null) {
            response.getWriter().println("Error: No se pudo cargar la imagen.");
            return;
        }

        String fecha = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        NoticiaModelo newNoticia = new NoticiaModelo(id, permalink, titulo, imagePath, texto, fecha);
        try {
            noticiaDAO.crearNoticia(newNoticia);
            response.sendRedirect("creada.jsp");
        } catch (SQLException e) {
            response.sendRedirect("nocreada.jsp");
        }

    }

    private String generarPermalink(String titulo) {
        String basePermalink = titulo.toLowerCase()
                .replaceAll("[^a-z0-9\\\\s]", "")
                .replaceAll("\\s+", "-");

        String idUnico = String.valueOf(System.currentTimeMillis());
        return basePermalink + "_" + idUnico;
    }

    private String cargarImagen(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Part filePart = request.getPart("imagen");
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }

        String fileName = filePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        return UPLOAD_DIRECTORY + "/" + fileName;
    }

    private void eliminarNoticia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String permalink = request.getParameter("permalink");
        if (permalink != null && !permalink.isEmpty())
     try {
            boolean eliminado = noticiaDAO.eliminarNoticia(permalink);
            response.sendRedirect("eliminada.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("noeliminada.jsp");
        }
    }

}
