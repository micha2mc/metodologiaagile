/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CalendarDAO;
import dao.NewsDAO;
import dao.TeamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Calendar;
import model.News;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.util.List;

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


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagina = request.getParameter("pagina");
        if ("calendario".equalsIgnoreCase(pagina)) {
            List<Calendar> listaCarreras = calendarDAO.getAllCalendarItem();
            request.setAttribute("listaCarreras", listaCarreras);
            request.getRequestDispatcher("/view/public/calendar.jsp").forward(request, response);
        } else if ("equipos".equalsIgnoreCase(pagina)) {
            request.setAttribute("listaEquipos", teamDAO.getAllTeam());
            request.getRequestDispatcher("/view/public/team.jsp").forward(request, response);
        } else {
            presentarNoticias(request, response);
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
