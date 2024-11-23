/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Noticia;
import model.NoticiaDAO;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author micha
 */
@WebServlet(name = "NoticiasController", urlPatterns = {"/NoticiasController"})
public class NoticiasController extends HttpServlet {

    private NoticiaDAO noticiaDAO = new NoticiaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String noticiaNid = request.getParameter("noticia");

        if (StringUtils.isNotBlank(noticiaNid)) {
            request.setAttribute("noticia", noticiaDAO.getNoticiaById(Integer.valueOf(noticiaNid)));
            request.getRequestDispatcher("/view/noticias/noticia.jsp").forward(request, response);
        } else {
            //Las noticias actuales en primer lugar
            List<Noticia> listNews = noticiaDAO.getTodasNoticias();
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
