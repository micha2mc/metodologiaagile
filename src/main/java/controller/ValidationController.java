package controller;

import dao.NewsDAO;
import dao.PilotDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import model.News;
import model.User;
import utils.RolEnum;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

/**
 * @author micha
 */
@WebServlet(name = "Validation", urlPatterns = {"/Validation"})
@RequiredArgsConstructor
public class ValidationController extends HttpServlet {

    private UserDAO userDAO = new UserDAO();
    private final NewsDAO noticiaDAO = new NewsDAO();
    private final PilotDAO pilotDAO = new PilotDAO();

    protected void processRequest(final HttpServletRequest request, final HttpServletResponse response)
            throws IOException, ServletException, SQLException {
        request.setCharacterEncoding("UTF-8");
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


    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        processRequest(request, response);
    }

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void sesionIniciada(final HttpServletRequest request, final HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String pass = request.getParameter("txtpass");
        String email = request.getParameter("txtemail");
        User user = userDAO.validar(pass, email);
        if (Objects.nonNull(user) && Boolean.TRUE.equals(user.isValid())) {
            if (user.getAuthorities().getAuthority().equalsIgnoreCase(RolEnum.ROLE_ADMIN.getDescr())) {
                List<News> listNews = noticiaDAO.getTodasNoticias();
                request.setAttribute("listaNoticias", listNews);
                request.setAttribute("usuarioConectado", user);
                request.getRequestDispatcher("view/admin/manageNews.jsp").forward(request, response);
            } else {
                request.setAttribute("listaPilotos", pilotDAO.getAllPilot());
                request.getRequestDispatcher("view/team/managePilots.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

}
