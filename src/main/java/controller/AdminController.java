/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AuthoritiesDAO;
import dao.CircuitDAO;
import dao.NewsDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Authorities;
import model.Circuit;
import model.News;
import model.User;
import org.apache.commons.lang3.StringUtils;
import utils.FileSearcher;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

/**
 * @author micha
 * Administrador/es
 * Requiere registro y validación manual por parte de un administrador.
 * Podrá crear circuitos.
 * Podrá crear noticias.
 * Podrá crear votaciones.
 * Puede ver los detalles de cada equipo, con el fin de obtener datos de grafismo para el equipo de producción que retransmite la carrera.
 */
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class AdminController extends HttpServlet {
    
    private static final String UPLOAD_DIR_CIRCUIT = "img/circuitos/";
    private static final String UPLOAD_DIR_NEWS = "img/noticias/";

    private final NewsDAO noticiaDAO = new NewsDAO();
    private final UserDAO userDAO = new UserDAO();
    private final AuthoritiesDAO authoritiesDAO = new AuthoritiesDAO();
    private final CircuitDAO circuitDAO = new CircuitDAO();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String pagina = request.getParameter("pagina");

        if ("noticia".equalsIgnoreCase(pagina)) {
            gestionNoticias(request, response);
        } else if ("votacion".equalsIgnoreCase(pagina)) {
            gestionVotaciones(request, response);
        }else if("circuito".equalsIgnoreCase(pagina)) {
            gestionCircuitos(request, response);


        }else {
            gestionUsuarios(request, response);
        }
    }

    private void gestionCircuitos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {String action = request.getParameter("action");
        if (StringUtils.isNotBlank(action)) {
            switch (action) {
                case "create" -> crearCircuito(request, response);
                case "update" -> actualizarCircuito(request, response);
                case "delete" -> eliminarCircuito(request);
                default -> throw new RuntimeException("Error");
            }
        }
        List<Circuit> allCircuits = circuitDAO.getAllCircuits();
        request.setAttribute("listaCircuitos", allCircuits);
        request.getRequestDispatcher("/view/admin/manageCircuits.jsp").forward(request, response);
    }

    private void eliminarCircuito(HttpServletRequest request) {
        circuitDAO.deleteCircuit(Integer.parseInt(request.getParameter("circuito")));
    }

    private void actualizarCircuito(HttpServletRequest request, HttpServletResponse response) {
        String circuitoId = request.getParameter("circuito");
        String tipo = request.getParameter("tipo");
        Circuit circuit = circuitDAO.getCircuitById(Integer.parseInt(circuitoId));
        if("add".equalsIgnoreCase(tipo)){
            circuit.setCalendar(Boolean.TRUE);
        }else{
            circuit.setCalendar(Boolean.FALSE);
        }
        circuitDAO.updateCalendarStatus(circuit);
    }

    private void gestionUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (StringUtils.isNotBlank(action)) {
            switch (action) {
                case "validar" -> validarUsuario(request, response);
                case "delete" -> eliminarUsuarios(request);
                default -> throw new RuntimeException("Error");
            }
        }
        request.setAttribute("listaUsuarios", userDAO.getAllUsers());
        request.getRequestDispatcher("/view/admin/manageUsers.jsp").forward(request, response);

    }

    private void eliminarUsuarios(final HttpServletRequest request) {
        userDAO.deleteUser(Integer.parseInt(request.getParameter("usuario")));
    }

    private void validarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (StringUtils.isNotBlank(request.getParameter("estado"))) {
            String usuarioNid = request.getParameter("usuario");
            User user = userDAO.findById(Integer.parseInt(usuarioNid));
            List<Authorities> allRoles = authoritiesDAO.getAllRoles();
            request.setAttribute("usuarioDB", user);
            request.setAttribute("roles", allRoles);
            request.getRequestDispatcher("/view/admin/usersForm.jsp").forward(request, response);
        } else {
            userDAO.validateUserForAdmin(Integer.parseInt(request.getParameter("nid")),
                    Integer.parseInt(request.getParameter("roleOption")));
        }
    }

    private void gestionVotaciones(HttpServletRequest request, HttpServletResponse response) {
    }

    private void gestionNoticias(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (StringUtils.isNotBlank(action)) {
            switch (action) {
                case "create" -> crearNoticia(request, response);
                case "update" -> actualizarNoticia(request, response);
                case "delete" -> eliminarNoticia(request);
                default -> throw new RuntimeException("Error");
            }
        }
        request.setAttribute("listaNoticias", noticiaDAO.getTodasNoticias());
        request.getRequestDispatcher("/view/admin/manageNews.jsp").forward(request, response);
    }

    private void actualizarNoticia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String noticiaNid = request.getParameter("noticia");
        News noticiaBBDD = noticiaDAO.getNoticiaById(Integer.parseInt(noticiaNid));
        if (StringUtils.isNotBlank(request.getParameter("estado"))) {

            request.setAttribute("noticiaObtenida", noticiaBBDD);
            request.setAttribute("actualizar", Boolean.TRUE);
            request.getRequestDispatcher("/view/admin/newsForm.jsp").forward(request, response);
        } else {
            noticiaBBDD.setTitulo(request.getParameter("titulo"));
            noticiaBBDD.setTexto(request.getParameter("texto"));
            noticiaBBDD.setImagen(request.getParameter("foto"));
            noticiaBBDD.setFecha(LocalDate.now());
            noticiaDAO.updateNews(noticiaBBDD);
        }

    }

    private void eliminarNoticia(HttpServletRequest request) {
        String noticiaNid = request.getParameter("noticia");
        noticiaDAO.deleteNew(Integer.parseInt(noticiaNid));
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

    private void crearNoticia(final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException {

        String titulo = request.getParameter("titulo");
        String texto = request.getParameter("texto");
        if (titulo == null || titulo.isEmpty() || texto == null || texto.isEmpty()) {
            response.getWriter().println("Error: Los campos 'título' y 'texto' son obligatorios.");
            return;
        }
        String imagePath= FileSearcher.obtainFileName(request, UPLOAD_DIR_NEWS);
        LocalDate fecha = LocalDate.now();
        News newNoticia = News.builder()
                .titulo(titulo)
                .texto(texto)
                .fecha(fecha)
                .imagen(imagePath)
                .build();
        try {
            noticiaDAO.crearNoticia(newNoticia);
        } catch (SQLException e) {
            response.sendRedirect("view/common/nocreada.jsp");
        }

    }

    private void crearCircuito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fileName= FileSearcher.obtainFileName(request, UPLOAD_DIR_CIRCUIT);
        Circuit circuit = Circuit.builder()
                .nombre(request.getParameter("nombre"))
                .ciudad(request.getParameter("ciudad"))
                .pais(request.getParameter("pais"))
                .trazadoImagen(fileName)
                .longitud(Integer.parseInt(request.getParameter("longitud")))
                .curvasLentas(Integer.parseInt(request.getParameter("curvaslentas")))
                .curvasMedias(Integer.parseInt(request.getParameter("curvasmedias")))
                .curvasRapidas(Integer.parseInt(request.getParameter("curvasrapidas")))
                .build();
        circuitDAO.createCircuit(circuit);
    }

}
