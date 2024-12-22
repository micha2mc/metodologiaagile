/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AuthoritiesDAO;
import dao.NewsDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Authorities;
import model.News;
import model.User;
import org.apache.commons.lang3.StringUtils;

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
public class AdminController extends HttpServlet {

    private final NewsDAO noticiaDAO = new NewsDAO();
    private final UserDAO userDAO = new UserDAO();
    private final AuthoritiesDAO authoritiesDAO = new AuthoritiesDAO();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");


        String pagina = request.getParameter("pagina");

        if ("noticia".equalsIgnoreCase(pagina)) {
            gestionNoticias(request, response);
        } else if ("votacion".equalsIgnoreCase(pagina)) {
            gestionVotaciones(request, response);
        } else {
            gestionUsuarios(request, response);
        }


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

    private void crearNoticia(final HttpServletRequest request, final HttpServletResponse response) throws IOException {

        String titulo = request.getParameter("titulo");
        String texto = request.getParameter("texto");
        if (titulo == null || titulo.isEmpty() || texto == null || texto.isEmpty()) {
            response.getWriter().println("Error: Los campos 'título' y 'texto' son obligatorios.");
            return;
        }

        LocalDate fecha = LocalDate.now();
        News newNoticia = News.builder()
                .titulo(titulo)
                .texto(texto)
                .fecha(fecha)
                .imagen("")
                .build();
        try {
            noticiaDAO.crearNoticia(newNoticia);
        } catch (SQLException e) {
            response.sendRedirect("view/common/nocreada.jsp");
        }

    }

}
