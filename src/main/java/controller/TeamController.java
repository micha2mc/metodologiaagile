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

import java.io.IOException;

/**
 * @author micha
 * Responsable/s de equipo.
 * Requiere registro. Deberá ser validado manualmente por parte de un administrador.
 * Podrá dar de alta un equipo y agregar usuarios como corresponsables del equipo.
 * No puede ver los detalles de otro equipo.
 * Podrá dar de alta pilotos.
 * Podrá crear coches.
 * Podrá hacer uso de la herramienta de calculadora con un determinado coche sobre un determinado circuito.
 */
@WebServlet(name = "TeamController", urlPatterns = {"/TeamController"})
public class TeamController extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
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
