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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <style>
            .hero-image {
                position: relative;
                text-align: center;
                color: white;
            }
            .hero-image img {
                width: 100%;
                height: auto;
                filter: brightness(70%);
            }
            .hero-text {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                color: white;
                text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
            }
            .team-card {
                margin-bottom: 1.5rem;
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
                                </div>
                                </nav>
                                <div class="container mt-4">
                                    <h1 class="text-center mb-4">Coches de ${team}</h1>

                                    <!-- Listado de productos -->
                                    <div class="row">
                                        <c:forEach var="team" items="${teams}">
                                            <div class="col-md-6 team-card">
                                                <div class="card">
                                                    <div class="card-header bg-primary text-white">
                                                        <h5 class="mb-0">${team.name}</h5>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <img src="${team.logo}" class="img-fluid rounded" alt="${team.name}">
                                                            </div>
                                                            <div class="col-md-8">
                                                                <h6 class="text-muted">Pilotos</h6>
                                                                <table class="table table-sm table-striped">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Nombre</th>
                                                                            <th>Número</th>
                                                                            <th>Nacionalidad</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <!-- Bucle para mostrar pilotos -->
                                                                        <c:forEach var="pilot" items="${team.pilots}">
                                                                            <tr>
                                                                                <td>${pilot.name}</td>
                                                                                <td>${pilot.number}</td>
                                                                                <td>${pilot.nationality}</td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                </div>
                                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
                                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
                                </body>
                                </html>
