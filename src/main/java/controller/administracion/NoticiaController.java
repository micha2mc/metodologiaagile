/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.administracion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.administracion.dao.NoticiaDAO;
import model.administracion.NoticiaModel;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

/**
 * @author Home
 */
@WebServlet(name = "NoticiaController", urlPatterns = {"/NoticiaController"})
public class NoticiaController extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "src/main/webapp/img";
    private final NoticiaDAO noticiaDAO = new NoticiaDAO();


    protected void processRequest(final HttpServletRequest request, final HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (StringUtils.isNotBlank(action)) {
            switch (action) {
                case "create" -> crearNoticia(request, response);
                case "update" -> response.getWriter().write("Actuali: ");
                case "delete" -> response.getWriter().write("Elimi: ");
                default -> throw new RuntimeException("Error");
            }
        } else {
            presentarNoticias(request, response);
        }


    }

    private void presentarNoticias(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String noticiaNid = request.getParameter("noticia");

        if (StringUtils.isNotBlank(noticiaNid)) {
            request.setAttribute("noticia", noticiaDAO.getNoticiaById(Integer.valueOf(noticiaNid)));
            request.getRequestDispatcher("/view/noticias/noticia.jsp").forward(request, response);
        } else {
            //Las noticias actuales en primer lugar
            List<NoticiaModel> listNews = noticiaDAO.getTodasNoticias();
            request.setAttribute("listaNoticias", listNews);
            request.getRequestDispatcher("/view/noticias/noticias.jsp").forward(request, response);
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

   /* @Override
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
        } catch (Exception e) {
            throw new ServletException(e);
        }

    }*/

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
        NoticiaModel newNoticia = NoticiaModel.builder()
                .titulo(titulo)
                .texto(texto)
                .fecha(fecha)
                .imagen("")
                .build();
        try {
            noticiaDAO.crearNoticia(newNoticia);
            response.sendRedirect("view/administracion/creada.jsp");
        } catch (SQLException e) {
            response.sendRedirect("view/administracion/nocreada.jsp");
        }

    }

    /*private String generarPermalink(String titulo) {
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
    }*/

}
