<%-- 
    Document   : team
    Created on : 2 ene 2025, 11:06:52
    Author     : micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="PublicController">Noticias</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Portal
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="PublicController?pagina=calendario">Calendario</a>
                                    </li>
                                    <li><a class="dropdown-item" href="PublicController?pagina=equipos">Equipos</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
            <div>
                <!-- Example single danger button -->
                <div class="btn-group">
                    <button style="margin-right: 100px;" type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
                        </svg>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="login.jsp">Conéctate</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="registro.jsp">Regístrate</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <h1 class="text-center my-1">Equipos y Pilotos F1 - Temporada 2024</h1>
            <div class="row team-section">
                <c:forEach var="team" items="${listaEquipos}">
                    <div class="col-md-6 col-lg-4">
                        <div class="team-card p-3">
                            <div class="d-flex align-items-center">
                                <img src="${team.logoImage}" alt="${team.nombre}" class="team-logo me-3">
                                <h3 class="mb-0">${team.nombre}</h3>
                            </div>
                            <hr>
                            <div class="drivers">
                                <!--<c:forEach var="driver" items="${team.pilot}">
                                    <div class="d-flex align-items-center my-2">
                                        <img src="${driver.foto}" alt="${driver.nombre}" class="driver-img me-3">
                                        <div>
                                            <p class="driver-name mb-0">${driver.nombre}</p>
                                            <p class="text-muted mb-0">${driver.nacionalidad}</p>
                                        </div>
                                    </div>
                                </c:forEach>-->
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

