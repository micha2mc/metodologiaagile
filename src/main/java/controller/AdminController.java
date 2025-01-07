package controller;

import dao.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;
import org.apache.commons.lang3.StringUtils;
import utils.FileSearcher;
import utils.Utiles;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

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
    private final CalendarDAO calendarDAO = new CalendarDAO();
    private final TeamDAO teamDAO = new TeamDAO();
    private final PilotDAO pilotDAO = new PilotDAO();
    private final VotingDAO votingDAO = new VotingDAO();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("UTF-8");

        String pagina = request.getParameter("pagina");

        if ("noticia".equalsIgnoreCase(pagina)) {
            gestionNoticias(request, response);
        } else if ("votacion".equalsIgnoreCase(pagina)) {
            gestionVotaciones(request, response);
        } else if ("circuito".equalsIgnoreCase(pagina)) {
            gestionCircuitos(request, response);
        } else if ("calendario".equalsIgnoreCase(pagina)) {
            gestionCalendario(request, response);
        } else if ("equipo".equalsIgnoreCase(pagina)) {
            gestionEquipos(request, response);
        } else {
            gestionUsuarios(request, response);
        }
    }

    private void gestionEquipos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listaEquipos", teamDAO.getAllTeam());
        request.getRequestDispatcher("/view/admin/manageTeamAdmin.jsp").forward(request, response);
    }


    private void gestionCalendario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (StringUtils.isNotBlank(action)) {
            switch (action) {
                case "create" -> crearCalendario(request, response);
                //case "update" -> actualizarCircuito(request, response);
                //case "delete" -> eliminarCircuito(request);
                default -> throw new RuntimeException("Error");
            }
        }
        List<Calendar> listaCarreras = calendarDAO.getAllCalendarItem();
        request.setAttribute("listaCarreras", listaCarreras);
        request.getRequestDispatcher("/view/admin/manageCalendar.jsp").forward(request, response);
    }

    private void crearCalendario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (StringUtils.isNotBlank(request.getParameter("estado"))) {
            String circuito = request.getParameter("circuitOption");
            Circuit circuit = circuitDAO.getCircuitById(Integer.parseInt(circuito));
            LocalDate fechaForm = LocalDate.parse(request.getParameter("fecha"));
            String status = Utiles.getStatusCalendar(fechaForm);
            Calendar calendar = Calendar.builder()
                    .fecha(fechaForm)
                    .nombre(circuit.getNombre())
                    .ubicacion(circuit.getCiudad())
                    .estado(status)
                    .build();
            calendarDAO.createCalendar(calendar);

        } else {
            List<Circuit> listCircuits = circuitDAO.getAllCircuits().stream().filter(Circuit::isCalendar).toList();
            request.setAttribute("listaCircuitos", listCircuits);
            request.getRequestDispatcher("/view/admin/calendarForm.jsp").forward(request, response);

        }
    }

    private void gestionCircuitos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
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
        if ("add".equalsIgnoreCase(tipo)) {
            circuit.setCalendar(Boolean.TRUE);
        } else {
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

    private void gestionVotaciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String action = request.getParameter("action");
        if (StringUtils.isNotBlank(action)) {
            switch (action) {
                case "create" -> {
                    if (StringUtils.isNotBlank(request.getParameter("estado"))) {
                        String[] pilotosSeleccionados = request.getParameterValues("pilotosOption");
                        List<Integer> listIdPilotos = Arrays.stream(pilotosSeleccionados)
                                .map(Integer::parseInt) // Convierte cada elemento a Integer
                                .collect(Collectors.toList());
                        Voting voting = Voting.builder()
                                .titulo(request.getParameter("titulo"))
                                .descripcion(request.getParameter("descripcion"))
                                .fechaLimite(LocalDate.parse(request.getParameter("fecha")))
                                .build();
                        votingDAO.createVoting(voting, listIdPilotos);
                        request.setAttribute("listaPilotos", pilotosSeleccionados);
                    } else {
                        List<Pilot> listPilots = pilotDAO.getAllPilot();
                        request.setAttribute("listaPilotos", listPilots);
                        request.getRequestDispatcher("/view/admin/votacionForm.jsp").forward(request, response);
                    }
                }
                case "eliminar" ->{
                    String idVotacion = request.getParameter("idVotacion");
                    votingDAO.deleteVoting(Integer.parseInt(idVotacion));
                }
            }

        }
        request.setAttribute("votingList", votingDAO.getAllVoting());
        request.getRequestDispatcher("/view/admin/manageVotes.jsp").forward(request, response);
        /**/
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
            request.setAttribute("tituloAccion", "Actualizando la Noticia");
            request.getRequestDispatcher("/view/admin/newsForm.jsp").forward(request, response);
        } else {
            noticiaBBDD.setTitulo(request.getParameter("titulo"));
            noticiaBBDD.setTexto(request.getParameter("texto"));
            String filePath = FileSearcher.obtainFileName(request, UPLOAD_DIR_NEWS);
            if (StringUtils.isNotBlank(filePath)) {
                noticiaBBDD.setImagen(filePath);
            }
            noticiaBBDD.setFecha(LocalDate.now());
            noticiaDAO.updateNews(noticiaBBDD);
        }

    }

    private void eliminarNoticia(HttpServletRequest request) {
        int noticiaNid = Integer.parseInt(request.getParameter("noticia"));
        noticiaDAO.deleteNew(noticiaNid);
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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
        String imagePath = FileSearcher.obtainFileName(request, UPLOAD_DIR_NEWS);
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

        String fileName = FileSearcher.obtainFileName(request, UPLOAD_DIR_CIRCUIT);
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
