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
                                        Mant. Respo.
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
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
                                    <button href="#" class="btn btn-primary mb-3">Añadir Corresponsales</button><br>
                                    <input type="hidden" name="pagina" value="equipos"><!-- comment -->
                                    <input type="hidden" name="action" value="corresponsales">
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

    <div class="container">
        <h1 class="text-center my-1">Zona de Mantenimiento del Equipo ${team.nombre}</h1>
        <div class="row team-section">
            <div class="col-md-12 col-lg-4">
                <div class="team-card p-3">
                    <div class="d-flex align-items-center">
                        <img src="${team.logoImage}" alt="${team.nombre}" class="team-logo me-3">
                        <h3 class="mb-0">${team.nombre}</h3>
                    </div>
                    <hr>
                    <div class="drivers">
                        <c:forEach var="driver" items="${team.pilot}">
                            <div class="d-flex align-items-center my-2">
                                <img src="${driver.imagen}" alt="${driver.nombre}" class="driver-img me-3">
                                <div>
                                    <p class="driver-name mb-0">${driver.nombre}</p>
                                    <p class="text-muted mb-0">${driver.pais}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 team-card">
                <div class="card-header bg-danger text-white">
                    <h5 class="mb-0"><img style=" width: 270px; height: 50px;" src="${team.logoImage}" alt="${team.nombre}" class="team-logo img-fluid me-3"> Corresponsales de ${team.nombre}</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-8">
                            <h6 class="text-muted">Datos de los corresponsales</h6>
                            <table class="table table-sm table-striped">
                                <thead>
                                    <tr>
                                        <th>Corresponsal</th>
                                        <th>Email</th>
                                        <th>Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <c:forEach var="corresponsal" items="${listaCorresponsallles}">
                                            
                                        </c:forEach>
                                        <td>${corresponsal.userName}</td>
                                        <td>${corresponsal.email}</td>
                                        <td class="text-center">${car.ers_curvas_lentas}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

