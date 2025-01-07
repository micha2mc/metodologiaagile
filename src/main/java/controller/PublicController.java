/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Calendar;
import model.News;
import model.Participante;
import model.Voting;
import org.apache.commons.lang3.StringUtils;
import utils.Utiles;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

/**
 * @author micha
 * Aficionado/s.
 * No requiere registro.
 * Acceso libre a las secciones que no requieren iniciar sesión.
 */
@WebServlet(name = "PublicController", urlPatterns = {"/PublicController"})
public class PublicController extends HttpServlet {

    private final NewsDAO noticiaDAO = new NewsDAO();
    private final CalendarDAO calendarDAO = new CalendarDAO();
    private final TeamDAO teamDAO = new TeamDAO();
    private final ParticipanteDAO participanteDAO = new ParticipanteDAO();
    private final VotingDAO votingDAO = new VotingDAO();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("UTF-8");
        String pagina = request.getParameter("pagina");
        if ("calendario".equalsIgnoreCase(pagina)) {
            List<Calendar> listaCarreras = calendarDAO.getAllCalendarItem();
            request.setAttribute("listaCarreras", listaCarreras);
            request.getRequestDispatcher("/view/public/calendar.jsp").forward(request, response);
        } else if ("equipos".equalsIgnoreCase(pagina)) {
            request.setAttribute("listaEquipos", teamDAO.getAllTeam());
            request.getRequestDispatcher("/view/public/team.jsp").forward(request, response);
        } else if ("votacion".equalsIgnoreCase(pagina)) {
            gestionVotaciones(request, response);
        } else {
            presentarNoticias(request, response);
        }

    }

    private void gestionVotaciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String action = request.getParameter("action");

        if (StringUtils.isNotBlank(action)) {
            //Actualizando la votacion
            switch (action) {
                case "conectar" -> {
                    Participante participante = participanteDAO.getParticipanteByEmail(request.getParameter("txtemail"));
                    if (Objects.nonNull(participante)) {
                        //Le muestro la votacion
                        request.setAttribute("mensaje", String.format("El usuario: %s ya ha votado", participante.getEmail()));
                        request.getRequestDispatcher("/view/public/votingLogin.jsp").forward(request, response);
                    } else {
                        Participante partic = Participante.builder()
                                .userName(request.getParameter("txtname"))
                                .email(request.getParameter("txtemail"))
                                .build();
                        String idVotacion = request.getParameter("idvotacion");
                        participanteDAO.createParticipante(partic);  
                        Voting voting = votingDAO.getVotingById(Integer.parseInt(idVotacion));
                        request.setAttribute("votacion", voting);
                        request.getRequestDispatcher("/view/public/votingForm.jsp").forward(request, response);
                    }
                }
                case "votar" -> {
                    String pilotoSeleccionado = request.getParameter("pilotoSeleccionado");
                    String idVotacion = request.getParameter("idVotacion");
                    votingDAO.updateScore(Integer.valueOf(pilotoSeleccionado), Integer.valueOf(idVotacion));
                    request.setAttribute("listaNoticias", noticiaDAO.getTodasNoticias());
                    request.setAttribute("listaVotacion", Utiles.ordenarPilotosPuntuacion());
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                //case "delete" -> eliminarNoticia(request);
                default -> throw new RuntimeException("Error");
            }
        } else {
            // Llamo al formulario de votacion
            String votacionSeleccinada = request.getParameter("votacionSeleccinada");
            request.setAttribute("votacionSeleccinada", votacionSeleccinada);
            request.getRequestDispatcher("/view/public/votingLogin.jsp").forward(request, response);
        }
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
    }

    private void presentarNoticias(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String noticiaNid = request.getParameter("noticia");
        List<News> listNews;

        if (StringUtils.isNotBlank(noticiaNid)) {
            listNews = List.of(noticiaDAO.getNoticiaById(Integer.valueOf(noticiaNid)));
        } else {
            //Las noticias actuales en primer lugar
            listNews = noticiaDAO.getTodasNoticias();

        }
        request.setAttribute("listaNoticias", listNews);
        request.getRequestDispatcher("/view/public/news.jsp").forward(request, response);
    }

}
