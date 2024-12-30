/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.PilotDAO;
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
    private final PilotDAO pilotDAO = new PilotDAO();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagina = request.getParameter("pagina");
        switch (pagina) {
            case "pilotos" -> gestionPilotos(request, response);
            case "equipos" -> gestionEquipos(request, response);
        }

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
    private PilotDAO pilotDAO;

    @Override
    public void init() throws ServletException {
        pilotDAO = new PilotDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (action) {
            case "addPilot" -> addPilot(request, response);
            case "deletePilot" -> deletePilot(request, response);
            default -> response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action no valida");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String action = request.getParameter("action");
       
       switch(action){
       
           case "getAllPilots"->getAll(request,response);
           default->response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action no valida");
       }
    
    }
    
    
    
    
    
    
    private void addPilot(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String siglas = request.getParameter("siglas");
            int dorsal = Integer.parseInt(request.getParameter("dorsal"));
            String imagen = request.getParameter("imagen");
            String pais = request.getParameter("pais");
            String twitter = request.getParameter("twitter");
            int id_equipo = Integer.parseInt(request.getParameter("id_equipo"));

            Pilot pilot = Pilot.builder()
                    .nombre(nombre)
                    .apellidos(apellidos)
                    .siglas(siglas)
                    .dorsal(dorsal)
                    .imagen(imagen)
                    .pais(pais)
                    .twitter(twitter)
                    .id_equipo(id_equipo)
                    .build();
            System.out.println(pilot);

            pilotDAO.createPilot(pilot);
            response.getWriter().println("Piloto" + pilot.getNombre() + " añadido con exito");
        } catch (IOException | NumberFormatException | SQLException e) {
            response.getWriter().println("hola" + e.getMessage());
        }

    }

    private void deletePilot(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String param = request.getParameter("id");
        System.out.println(param);
        if (param == null || param.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("ID no proporcionado");
            return;
        }
        try {
            int id = Integer.parseInt(param);
            boolean eliminado = pilotDAO.deletePilot(id);
            if (eliminado) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("Piloto eliminado con éxito.");
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("Piloto no encontrado.");
            }
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("ID inválido. Debe ser un número entero.");
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error al eliminar el piloto: " + e.getMessage());

        }

    }
   private void getAll(HttpServletRequest request, HttpServletResponse response)throws ServletException ,IOException{
       List<Pilot> listaPilot= new ArrayList<>();
       try{
       List<Pilot> listarPilot=pilotDAO.getAllPilot();
       /*guardar lista en el request*/
       request.setAttribute("listarPilot", listarPilot);
       request.getRequestDispatcher("pruebadecrearpilot.jsp").forward(request, response);
       }catch(SQLException e){
       response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
       response.getWriter().write("Error al obtener los pilotos"+ e.getMessage());
       }
        
                    
                }
     
   
   /*
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        gestionEquipos(request, response);

    }

    private void gestionEquipos(HttpServletRequest request, HttpServletResponse response) {
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
     */
}
