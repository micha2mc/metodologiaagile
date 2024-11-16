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
import lombok.RequiredArgsConstructor;
import model.User;
import model.UserDAO;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;

/**
 * @author micha
 */
@WebServlet(name = "Validation", urlPatterns = {"/Validation"})
@RequiredArgsConstructor
public class Validation extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    protected void processRequest(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion.equalsIgnoreCase("Introducir")) {
            String userName = request.getParameter("txtuser");
            String email = request.getParameter("txtemail");
            //System.out.println("Yesssssssssssssss");
            User user = userDAO.validar(userName, email);
            if (StringUtils.isNotBlank(user.getUserName())) {
                request.getRequestDispatcher("Controller?accion=Principal").forward(request, response);
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }else{
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
