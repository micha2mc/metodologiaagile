<%-- 
    Document   : manageNews
    Created on : 11 dic 2024, 23:28:32
    Author     : micha
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Listado de Circuitos</title>
        <link href="assets/css/cabecera.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg bg-danger">
            <div class="container d-flex justify-content-between align-items-center">

                <img src="https://media.formula1.com/image/upload/f_auto,c_limit,w_195,q_auto/etc/designs/fom-website/images/f1_logo"
                     alt="F1 Logo">

                <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                    <div class="flex-fill">
                        <ul class="nav navbar-nav">
                            <li class="nav-item me-3">
                                <a class="nav-link" href="Controller">Home</a>
                            </li>
                            <li class="nav-item me-3">
                                <a class="nav-link" href="PublicController">Noticias</a>
                            </li>
                            <li class="nav-item dropdown me-3">
                                <div class="dropdown">

                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                        Mant. Admin.
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                        <li><a class="dropdown-item" href="AdminController?pagina=noticia">Mant. Noticias</a></li>
                                        <li><a class="dropdown-item" href="#">Mant. Votación</a></li>
                                        <li><a class="dropdown-item" href="AdminController?pagina=usuario">Mant. Usuarios</a></li>
                                        <li><a class="dropdown-item" href="AdminController?pagina=circuito">Mant. Circuitos</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item me-3">
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                        Mant. Portal
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                        <li><a class="dropdown-item" href="#">Calendario</a></li>
                                        <li><a class="dropdown-item" href="#">Detalles Equipos</a></li>
                                    </ul>
                                </div>
                            </li>

                            <div>
                                <form action="AdminController" method="POST">
                                    <button name="accion" value="Salir" href="#" class="btn btn-primary mb-3">Nueva Entrada Calend.</button><br>
                                    <input type="hidden" name="pagina" value="calendario"><!-- comment -->
                                    <input type="hidden" name="action" value="create">
                                </form>

                            </div>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-end" style="margin-right: 20px;">
                <div class="dropdown ms-3">
                    <button style="border: none" class="btn btn-outline-light dropdown-toggle" type="button" data-bs-toggle="dropdown">
                        ${usuarioConectado.getUserName()}
                    </button>
                    <div class="dropdown-menu text-center">
                        <a class="dropdown-item" href="#">
                            <img src="img/usuario.png" alt="60" width="60"/>
                        </a>
                        <a class="dropdown-item" href="#">${usuarioConectado.getUserName()}</a>
                        <a class="dropdown-item" href="#">${usuarioConectado.getEmail()}</a>
                        <div class="dropdown-divider"></div>
                        <form action="Validation" method="POST">
                            <button name="accion" value="Salir" class="dropdown-item" href="#">Salir</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <div class="container mt-4">
        <h1 class="text-center">Calendario Fórmula 1</h1>
        <p class="text-center text-muted">Consulta el calendario de la temporada actual</p>
    </div>

    <!-- Listado de carreras -->
    <div class="container">
        <c:forEach var="carrera" items="${listaCarreras}">
            <div class="row race-card ${carrera.estado}">
                <div class="col-md-2 text-center">
                    <strong>${carrera.fecha}</strong>
                </div>
                <div class="col-md-4">
                    <h5>${carrera.nombre}</h5>
                    <p class="text-muted">${carrera.ubicacion}</p>
                </div>
                <div class="col-md-3">
                    <span class="badge bg-primary">${carrera.estado == 'past' ? 'Finalizado' : (carrera.estado == 'current' ? 'En curso' : 'Próxima carrera')}</span>
                </div>
                <div class="col-md-3 text-end">
                    <a href="detalleCarrera.jsp?id=${carrera.nid}" class="btn btn-sm btn-outline-secondary">Ver detalles</a>
                </div>
            </div>
        </c:forEach>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
