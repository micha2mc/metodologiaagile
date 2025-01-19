<%-- 
    Document   : manageTeam
    Created on : 30 dic 2024, 11:49:55
    Author     : micha
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Equipos y Pilotos F1 2024</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .team-section {
                margin: 20px auto;
            }
            .team-card {
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            .team-logo {
                width: 100px;
                height: auto;
            }
            .driver-img {
                width: 80px;
                height: auto;
                border-radius: 50%;
            }
            .driver-name {
                font-weight: bold;
                margin-top: 10px;
            }
        </style>
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
                                        <li>
                                            <form class="m-0 p-0" action="AdminController" method="POST">
                                                <button href="#" class="dropdown-item m-0 p-2">Mant. Noticias</button><br>
                                                <input type="hidden" name="pagina" value="noticia">
                                                <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                            </form>
                                        </li>
                                        <li>
                                            <form class="m-0 p-0" action="AdminController" method="POST">
                                                <button href="#" class="dropdown-item m-0 p-2">Mant. Votación</button><br>
                                                <input type="hidden" name="pagina" value="votacion">
                                                <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                            </form>
                                        </li>
                                        <li>
                                            <form class="m-0 p-0" action="AdminController" method="POST">
                                                <button href="#" class="dropdown-item m-0 p-2">Mant. Usuarios</button><br>
                                                <input type="hidden" name="pagina" value="usuario">
                                                <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                            </form>
                                        </li>
                                        <li>
                                            <form class="m-0 p-0" action="AdminController" method="POST">
                                                <button href="#" class="dropdown-item m-0 p-2">Mant. Circuitos</button><br>
                                                <input type="hidden" name="pagina" value="circuito">
                                                <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item me-3">
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                        Mant. Portal
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                        <li>
                                            <form class="m-0 p-0" action="AdminController" method="POST">
                                                <button href="#" class="dropdown-item m-0 p-2">Calendario</button><br>
                                                <input type="hidden" name="pagina" value="calendario">
                                                <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                            </form>
                                        </li>
                                        <li>
                                            <form class="m-0 p-0" action="AdminController" method="POST">
                                                <button href="#" class="dropdown-item m-0 p-2">Detalles Equipos</button><br>
                                                <input type="hidden" name="pagina" value="equipo">
                                                <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <div>
                                <form action="TeamController" method="POST">
                                    <button href="#" class="btn btn-primary mb-3">Añadir Equipo</button><br>
                                    <input type="hidden" name="pagina" value="equipo"><!-- comment -->
                                    <input type="hidden" name="action" value="create">
                                    <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
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
        <h1 class="text-center mb-4">Información de equipos</h1>
        <div class="row">
            <c:forEach var="car" items="${listCars}">
                <div class="col-md-12 team-card">
                    <div class="card-header bg-danger text-white">
                        <h5 class="mb-0"><img style=" width: 270px; height: 50px;" src="${car.team.logoImage}" alt="${car.team.nombre}" class="team-logo img-fluid me-3"> ${car.team.nombre}</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <img src="${car.imagen}" class="img-fluid rounded" alt="${team.nombre}">
                            </div>
                            <div class="col-md-8">
                                <h6 class="text-muted">Datos del coche</h6>
                                <table class="table table-sm table-striped">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Código</th>
                                            <th>ERS-CurvaLenta</th>
                                            <th>ERS-CurvaMedia</th>
                                            <th>ERS-CurvaRápida</th>
                                            <th>Consumo</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>${car.nombre}</td>
                                            <td>${car.codigo}</td>
                                            <td class="text-center">${car.ers_curvas_lentas}</td>
                                            <td class="text-center">${car.ers_curvas_medias}</td>
                                            <td class="text-center">${car.ers_curvas_rapidas}</td>
                                            <td class="text-center">${car.consumo}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <c:forEach var="pilot" items="${car.team.pilot}">
                        <div class="d-flex align-items-center my-2">
                            <img src="${pilot.imagen}" alt="${pilot.nombre}" class="driver-img me-3">
                            <div>
                                <p class="driver-name mb-0">${pilot.nombre}</p>
                                <p class="text-muted mb-0">${pilot.pais}</p>
                            </div>
                            <div class="col-md-8 mt-4">
                                <h6 class="text-muted">Datos del piloto</h6>
                                <table class="table table-sm table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-muted">Nombre Completo</th>
                                            <th class="text-muted">Sigla</th>
                                            <th class="text-muted">Dorsal</th>
                                            <th class="text-muted">twitter</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>${pilot.nombre} ${pilot.nombre}</td>
                                            <td>${pilot.siglas}</td>
                                            <td>${pilot.dorsal}</td>
                                            <td>${pilot.twitter}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <hr>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>
    </div>                
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

