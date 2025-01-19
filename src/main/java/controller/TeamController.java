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
    private static final String UPLOAD_DIR_COCHES = "img/coches/";
    private final PilotDAO pilotDAO = new PilotDAO();
    private final TeamDAO teamDAO = new TeamDAO();
    private final UserDAO userDAO = new UserDAO();
    private final CarDAO carDAO = new CarDAO();
    private final ParticipanteDAO participanteDAO = new ParticipanteDAO();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagina = request.getParameter("pagina");
        User usuarioconectado = userDAO.findById(Integer.valueOf(request.getParameter("idusuarioconectado")));
        request.setAttribute("usuarioConectado", usuarioconectado);
        switch (pagina) {
            case "pilotos" -> gestionPilotos(request, response, usuarioconectado);
            case "coches" -> gestionCoches(request, response, usuarioconectado);
            case "equipos" -> gestionEquipos(request, response, usuarioconectado);
        }

    }

    private void gestionCoches(HttpServletRequest request, HttpServletResponse response, User usuarioconectado) throws SQLException, ServletException, IOException {
        String accion = request.getParameter("accion");
        if (StringUtils.isNotBlank(accion)) {
            switch (accion) {
                case "create" -> crearCoche(request, response, usuarioconectado);
                case "delete" -> eliminarCoche(request, response);
            }
        }
        List<Car> allCarsByTeam = carDAO.getAllCarsByTeam(usuarioconectado.getTeam().getNid(), Boolean.TRUE);
        request.setAttribute("team", usuarioconectado.getTeam().getNombre());
        request.setAttribute("listCars", allCarsByTeam);
        request.getRequestDispatcher("view/team/manageCars.jsp").forward(request, response);
    }

    private void eliminarCoche(HttpServletRequest request, HttpServletResponse response) {
        carDAO.delete(Integer.parseInt(request.getParameter("idcar")));
    }

    private void crearCoche(HttpServletRequest request, HttpServletResponse response, User usuarioconectado) throws SQLException, ServletException, IOException {
        if (StringUtils.isNotBlank(request.getParameter("estado"))) {
            Car car = Car.builder()
                    .nombre(request.getParameter("nombre"))
                    .imagen(FileSearcher.obtainFileName(request, UPLOAD_DIR_COCHES))
                    .codigo(request.getParameter("codigo"))
                    .ers_curvas_lentas(Integer.parseInt(request.getParameter("erscurvalenta")))
                    .ers_curvas_medias(Integer.parseInt(request.getParameter("erscurvamedia")))
                    .ers_curvas_rapidas(Integer.parseInt(request.getParameter("erscurvarapida")))
                    .consumo(Integer.parseInt(request.getParameter("consumo")))
                    .build();
            carDAO.createdCar(car, usuarioconectado.getTeam().getNid());
        } else {
            request.getRequestDispatcher("view/team/carForm.jsp").forward(request, response);
        }
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
                case "corresponsales" -> gestionCorresponsales(request, response, usuarioconectado);
                case "delete" -> eliminarCorresponsal(request);
                default -> throw new RuntimeException("Error");
            }
        }
        request.setAttribute("listaCorresponsallles", participanteDAO.getCorresponsalesByTeam(usuarioconectado.getTeam().getNid()));
        request.setAttribute("team", teamDAO.getTeamByIdAndPilots(usuarioconectado.getTeam().getNid()));
        request.getRequestDispatcher("/view/team/manageTeam.jsp").forward(request, response);
    }

    private void eliminarCorresponsal(final HttpServletRequest request) {
        String idCorresponsal = request.getParameter("idCorresponsal");
        participanteDAO.delete(Integer.valueOf(idCorresponsal));
    }

    private void gestionCorresponsales(HttpServletRequest request, HttpServletResponse response, User usuarioconectado) throws ServletException, IOException {
        if (StringUtils.isNotBlank(request.getParameter("estado"))) {

            Participante participante = Participante.builder()
                    .userName(request.getParameter("txtname"))
                    .email(request.getParameter("txtemail"))
                    .corresponsal(Boolean.TRUE)
                    .id_team(usuarioconectado.getTeam().getNid())
                    .build();
            participanteDAO.createParticipante(participante);
        } else {
            request.setAttribute("corresponsales", Boolean.TRUE);
            request.getRequestDispatcher("/view/public/votingLogin.jsp").forward(request, response);
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
