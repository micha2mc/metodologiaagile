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
        <title>Listado de Circuitos</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" type="text/css" href="assets/css/cabecera.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
                                <a class="nav-link" href="Controller">Inicio</a>
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
                                        <li><a class="dropdown-item" href="AdminController?pagina=calendario">Calendario</a></li>
                                        <li><a class="dropdown-item" href="AdminController?pagina=equipo">Detalles Equipos</a></li>
                                    </ul>
                                </div>
                            </li>

                            <div>
                                <a href="view/admin/circuitForm.jsp" class="btn btn-primary mb-3">Crear Circuito</a><br>
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

    <div class="container mt-1">
        <h1 class="text-center mb-4">Listado de Circuitos</h1>

        <!-- Listado de productos -->
        <div class="row">
            <c:forEach var="circuito" items="${listaCircuitos}" varStatus="status">
                <div class="col-md-3 mb-3">
                    <div class="card product-card">
                        <img src="${circuito.trazadoImagen}" alt="${circuito.nombre}" class="card-img-top product-image">
                        <div class="card-body">
                            <h5 class="card-title  text-center">${circuito.nombre}</h5>
                            <p class="card-text text-muted">
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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
