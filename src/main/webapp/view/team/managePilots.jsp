<%-- 
    Document   : manageNews
    Created on : 11 dic 2024, 23:28:32
    Author     : micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Zona de Responsables</title>
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
                    <div class="flex-fill"  style="display: flex; align-items: center;">
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
                                        Mant. Respo.
                                    </button>
                                    <ul class="dropdown-menu p-0" aria-labelledby="dropdownMenuButton1">
                                        <li>
                                            <form class="m-0 p-0" action="TeamController" method="POST">
                                                <button href="#" class="dropdown-item m-0 p-2">Mant. Pilotos</button><br>
                                                <input type="hidden" name="pagina" value="pilotos">
                                                <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                            </form>
                                        </li>
                                        <li>
                                            <form class="m-0 p-0" action="TeamController" method="POST">
                                                <button href="#" class="dropdown-item m-0 p-2">Mant. Coches</button><br>
                                                <input type="hidden" name="pagina" value="coches">
                                                <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                            </form>
                                        </li>
                                        <li>
                                            <form class="m-0 p-0" action="TeamController" method="POST">
                                                <button href="#" class="dropdown-item m-0 p-2">Mant. Equipos</button><br>
                                                <input type="hidden" name="pagina" value="equipos">
                                                <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                            </form>
                                        </li>
                                        <li>
                                            <form class="m-0 p-0" action="TeamController" method="POST">
                                                <button href="#" class="dropdown-item m-0 p-2">Herram. Simulación</button><br>
                                                <input type="hidden" name="pagina" value="simulacion">
                                                <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <div>
                                <form action="TeamController" method="POST">
                                    <button href="#" class="btn btn-primary mb-3">Add Pilot ${nombre}</button><br>
                                    <input type="hidden" name="pagina" value="pilotos"><!-- comment -->
                                    <input type="hidden" name="accion" value="create">
                                    <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                </form>
                            </div>
                            <div>
                                <c:if test="${!isCreated}">
                                    <form action="TeamController" method="POST">
                                        <button href="#" class="btn btn-primary mb-3">Añadir Responsable</button><br>
                                        <input type="hidden" name="pagina" value="respon">
                                        <input type="hidden" name="action" value="create">
                                        <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                    </form> 
                                </c:if>

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
        <h1 class="text-center mb-4">Listado de Pilotos de ${nombre}</h1>

        <!-- Listado de productos -->
        <div class="row">
            <c:forEach var="piloto" items="${listaPilotos}">
                <div class="col-md-3 mb-3">
                    <div class="card product-card">
                        <img src="${piloto.imagen}" alt="${piloto.nombre}" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title  text-center">${piloto.nombre}</h5>
                            <p class="card-text text-muted">
                                <strong>Nombre:</strong> ${piloto.nombre}<br>
                                <strong>Apellidos:</strong> ${piloto.apellidos}<br>
                                <strong>Siglas:</strong> ${piloto.siglas}<br>
                                <strong>Dorsal:</strong> ${piloto.dorsal}<br>
                                <strong>País:</strong> ${piloto.pais}<br>
                                <strong>Twitter:</strong> ${piloto.twitter}
                            </p>
                            <a href="TeamController?pagina=pilotos&nidPiloto=${piloto.nid}&accion=delete&idusuarioconectado=${usuarioConectado.nid}" class="btn btn-danger">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <section class="bg-light">
            <div class="container py-12">
                <div class="row text-center py-3">
                    <div class="col-lg-6 m-auto">
                        <h4 class="h4">Listado de Responsables de ${nombre}</h4>
                    </div>
                </div>
                <div class="row">


                    <table class="table table-sm table-striped">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>email</th>
                                <th>¿Responsable Añadido?</th>
                                <th>¿Validado?</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${listaUsuarios}" varStatus="status">
                                <tr>
                                    <td>${user.userName}</td>
                                    <td>${user.email}</td>
                                    <c:choose>
                                        <c:when test="${user.respon}">
                                            <td>SI</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>NO</td>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${user.valid}">
                                            <td>SI</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>NO</td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </section>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
