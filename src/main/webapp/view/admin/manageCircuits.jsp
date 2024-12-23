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
        <div class="container">
            <div class="sidebar">
                <div class="d-flex flex-column justify-content-center align-items-center" >
                    <img src="https://media.formula1.com/image/upload/f_auto,c_limit,w_195,q_auto/etc/designs/fom-website/images/f1_logo"
                         alt="F1 Logo">
                    <a class="btn btn-outline-ligth text-center" href="AdminController?pagina=noticia">Mant. Noticias</a>
                    <a class="btn btn-outline-ligth text-center" href="#">Mant. Votación</a>
                    <a class="btn btn-outline-ligth text-center" href="AdminController?pagina=usuario">Mant. Usuarios</a>
                    <a class="btn btn-outline-ligth text-center" href="AdminController?pagina=circuito">Mant. Circuitos</a>
                    <a class="btn btn-outline-ligth text-center" href="#">Mant. Portal</a>
                </div>
            </div>
            <div class="main">
                <div class="header">
                    <nav class="navbar navbar-expand-lg">
                        <div class="collpse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a style="margin-left: 10px; border: none" class="btn btn-outline-ligth" href="index.jsp">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a style="margin-left: 10px; border: none" class="btn btn-outline-ligth" href="PublicController">Noticias</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Portal
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Calendario</a></li>
                                        <li><a class="dropdown-item" href="#">Equipos</a></li>
                                    </ul>
                                </li>
                                <div>
                                    <a href="view/admin/circuitForm.jsp" class="btn btn-primary mb-3">Crear Circuito</a><br>
                                </div>
                            </ul>
                            <div class="dropdown ms-auto">
                                <button style="border: none" class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
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
                    </nav>
                </div>
                <div class="main1" style="overflow-x: hidden;">
                    <div class="row">
                        <c:forEach var="circuito" items="${listaCircuitos}" varStatus="status">
                            <c:if test="${status.index % 3 == 0}">
                            </div>
                            <div class="row">
                            </c:if>
                            <div class="col-md-4 mb-4">
                                <div class="card">
                                    <div class="image-container">
                                        <img src="img/Silesia Ring-Western-Test-Loop-2018.png" class="card-img-top" alt="${circuito.nombre}"/>
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title">${circuito.nombre}</h5>
                                        <p class="card-text">
                                            <strong>Ciudad:</strong> ${circuito.ciudad}<br>
                                            <strong>País:</strong> ${circuito.pais}<br>
                                            <strong>Longitud:</strong> ${circuito.longitud} km<br>
                                            <strong>Curvas Lentas:</strong> ${circuito.curvasLentas}<br>
                                            <strong>Curvas Medias</strong> ${circuito.curvasMedias}<br>
                                            <strong>Curvas Rápidas:</strong> ${circuito.curvasRapidas}
                                        </p>
                                        <a href="AdminController?pagina=circuito&circuito=${circuito.nid}&action=update&tipo=add"class="btn btn-success">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                                            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
                                            </svg>
                                        </a>
                                        <a href="AdminController?pagina=circuito&circuito=${circuito.nid}&action=update" class="btn btn-warning">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                                            <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8"/>
                                            </svg>
                                        </a>
                                        <c:if test="${!circuito.calendar}">
                                            <a href="AdminController?pagina=circuito&circuito=${circuito.nid}&action=delete" class="btn btn-danger">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                                <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                                                </svg>
                                            </a>
                                        </c:if>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
