package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import model.User;
import utils.RolEnum;

import java.io.IOException;
import java.util.Objects;

/**
 * @author micha
 */
@WebServlet(name = "Validation", urlPatterns = {"/Validation"})
@RequiredArgsConstructor
public class ValidationController extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    protected void processRequest(final HttpServletRequest request, final HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion.equalsIgnoreCase("conectar")) {
            sesionIniciada(request, response);
        } else if (accion.equalsIgnoreCase("registrar")) {
            registrarUsuarios(request, response);
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    private void registrarUsuarios(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        User user = User.builder()
                .userName(request.getParameter("nombre"))
                .email(request.getParameter("email"))
                .password(request.getParameter("password"))
                .build();

        if (userDAO.createUser(user)) {
            request.setAttribute("mensaje", "Usuario registrado correctamente");
        } else {
            request.setAttribute("mensaje", "Error");
        }
        request.getRequestDispatcher("registro.jsp").forward(request, response);

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

    private void sesionIniciada(final HttpServletRequest request, final HttpServletResponse response)
            throws ServletException, IOException {
        String pass = request.getParameter("txtpass");
        String email = request.getParameter("txtemail");
        User user = userDAO.validar(pass, email);
        if (Objects.nonNull(user) && Boolean.TRUE.equals(user.isValid())) {
            if (user.getAuthorities().getAuthority().equalsIgnoreCase(RolEnum.ROLE_ADMIN.getDescr())) {
                request.getRequestDispatcher("view/admin/manageNews.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("view/team/managePilots.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

}
