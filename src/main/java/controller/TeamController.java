package controller;

import dao.PilotDAO;
import dao.TeamDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Pilot;
import model.Team;
import model.User;
import org.apache.commons.lang3.StringUtils;
import utils.FileSearcher;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


/**
 * @author micha Responsable/s de equipo. Requiere registro. Deberá ser validado
 * manualmente por parte de un administrador. Podrá dar de alta un equipo y
 * agregar usuarios como corresponsables del equipo. No puede ver los detalles
 * de otro equipo. Podrá dar de alta pilotos. Podrá crear coches. Podrá hacer
 * uso de la herramienta de calculadora con un determinado coche sobre un
 * determinado circuito.
 */
@WebServlet(name = "TeamController", urlPatterns = {"/TeamController"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class TeamController extends HttpServlet {


    private static final String UPLOAD_DIR_PILOT = "img/pilotos/";
    private static final String UPLOAD_DIR_TEAM = "img/equipo/";
    private final PilotDAO pilotDAO = new PilotDAO();
    private final TeamDAO teamDAO = new TeamDAO();
    private final UserDAO userDAO = new UserDAO();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagina = request.getParameter("pagina");
        User usuarioconectado = userDAO.findById(Integer.valueOf(request.getParameter("idusuarioconectado")));
        request.setAttribute("usuarioConectado", usuarioconectado);
        switch (pagina) {
            case "pilotos" -> gestionPilotos(request, response, usuarioconectado);
            case "coches" -> gestionCoches(request, response);
            case "equipos" -> gestionEquipos(request, response, usuarioconectado);
        }

    }

    private void gestionCoches(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String accion = request.getParameter("accion");
        if (StringUtils.isNotBlank(accion)) {
            switch (accion) {
                case "create" -> crearCoche(request, response);
                case "delete" -> eliminarCoche(request, response);
            }
        }
        //request.setAttribute("listaPilotos", pilotDAO.getAllPilot());
        request.getRequestDispatcher("view/team/manageCars.jsp").forward(request, response);
    }

    private void eliminarCoche(HttpServletRequest request, HttpServletResponse response) {
    }

    private void crearCoche(HttpServletRequest request, HttpServletResponse response) {
    }

    private void gestionPilotos(HttpServletRequest request, HttpServletResponse response, User usuarioconectado) throws ServletException, SQLException, IOException {
        String accion = request.getParameter("accion");
        if (StringUtils.isNotBlank(accion)) {
            switch (accion) {
                case "create" -> crearPiloto(request, response, usuarioconectado);
                case "delete" -> eliminarPiloto(request, response);
            }
        }
        List<Pilot> allPilotForTeam = pilotDAO.getAllPilotForTeam(usuarioconectado.getTeam().getNid());
        request.setAttribute("listaPilotos", allPilotForTeam);
        request.getRequestDispatcher("view/team/managePilots.jsp").forward(request, response);
    }

    private void eliminarPiloto(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        pilotDAO.deletePilot(Integer.parseInt(request.getParameter("nidPiloto")));
    }

    private void crearPiloto(HttpServletRequest request, HttpServletResponse response, final User usuarioconectado) throws SQLException, ServletException, IOException {
        if (StringUtils.isNotBlank(request.getParameter("estado"))) {
            String apellidos = request.getParameter("apellidos");
            Pilot pilot = Pilot.builder()
                    .nombre(request.getParameter("nombre"))
                    .apellidos(apellidos)
                    .siglas(apellidos.trim().substring(0, 3).toUpperCase())
                    .dorsal(Integer.parseInt(request.getParameter("dorsal")))
                    .imagen(FileSearcher.obtainFileName(request, UPLOAD_DIR_PILOT))
                    .pais(request.getParameter("pais"))
                    .twitter(request.getParameter("twitter"))
                    .build();
            int nidEquipo = Integer.parseInt(request.getParameter("teamOption"));
            pilotDAO.createPilot(pilot, nidEquipo);
        } else {
            request.setAttribute("equipo", teamDAO.findById(usuarioconectado.getTeam().getNid()));
            request.getRequestDispatcher("view/team/pilotForm.jsp").forward(request, response);
        }

    }


    private void gestionEquipos(HttpServletRequest request, HttpServletResponse response, User usuarioconectado) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (StringUtils.isNotBlank(action)) {
            switch (action) {
                case "create" -> crearEquipo(request, response);
                //case "update" -> actualizarCircuito(request, response);
                //case "delete" -> eliminarCircuito(request);
                default -> throw new RuntimeException("Error");
            }
        }
        request.setAttribute("team", teamDAO.getTeam(usuarioconectado.getTeam().getNid()));
        request.getRequestDispatcher("/view/team/manageTeam.jsp").forward(request, response);
    }

    private void crearEquipo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (StringUtils.isNotBlank(request.getParameter("estado"))) {
            Team team = Team.builder()
                    .nombre(request.getParameter("nombre"))
                    .logoImage(FileSearcher.obtainFileName(request, UPLOAD_DIR_TEAM))
                    .twitter(request.getParameter("twitter"))
                    .build();
            teamDAO.createTeam(team);
        } else {
            request.getRequestDispatcher("/view/team/teamForm.jsp").forward(request, response);

        }

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
