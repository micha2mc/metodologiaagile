package controller;

import dao.PilotDAO;
import dao.TeamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Pilot;
import org.apache.commons.lang3.StringUtils;
import utils.FileSearcher;

import java.io.IOException;
import java.sql.SQLException;


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
    private final PilotDAO pilotDAO = new PilotDAO();
    private final TeamDAO teamDAO = new TeamDAO();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagina = request.getParameter("pagina");
        switch (pagina) {
            case "pilotos" -> gestionPilotos(request, response);
            case "coches" -> gestionCoches(request, response);
            case "equipos" -> gestionEquipos(request, response);
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
        //request.getRequestDispatcher("view/team/manageCars.jsp").forward(request, response);
    }

    private void eliminarCoche(HttpServletRequest request, HttpServletResponse response) {
    }

    private void crearCoche(HttpServletRequest request, HttpServletResponse response) {
    }

    private void gestionPilotos(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
        String accion = request.getParameter("accion");
        if (StringUtils.isNotBlank(accion)) {
            switch (accion) {
                case "create" -> crearPiloto(request, response);
                case "delete" -> eliminarPiloto(request, response);
            }
        }
        request.setAttribute("listaPilotos", pilotDAO.getAllPilot());
        request.getRequestDispatcher("view/team/managePilots.jsp").forward(request, response);
    }

    private void eliminarPiloto(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        pilotDAO.deletePilot(Integer.parseInt(request.getParameter("nidPiloto")));
    }

    private void crearPiloto(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        if (StringUtils.isNotBlank(request.getParameter("estado"))) {
            String apellidos = request.getParameter("apellidos");
            Pilot pilot = Pilot.builder()
                    .nombre(request.getParameter("nombre"))
                    .apellidos(apellidos)
                    .siglas(apellidos.substring(0, 3).toUpperCase())
                    .dorsal(Integer.parseInt(request.getParameter("dorsal")))
                    .imagen(FileSearcher.obtainFileName(request, UPLOAD_DIR_PILOT))
                    .pais(request.getParameter("pais"))
                    .twitter(request.getParameter("twitter"))
                    .build();
            pilotDAO.createPilot(pilot);
        } else {
            request.setAttribute("listaEquipos", teamDAO.getAllTeam());
            request.getRequestDispatcher("view/team/pilotForm.jsp").forward(request, response);
        }

    }


    private void gestionEquipos(HttpServletRequest request, HttpServletResponse response) {
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
