<%-- 
    Document   : newsForm
    Created on : 20 dic 2024, 22:45:18
    Author     : micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Validación Usuarios</title>
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
                            <li class="nav-item">
                                <a class="nav-link" href="Controller">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="PublicController">Noticias</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Mantenimiento Admin.
                                </a>
                                <ul class="dropdown-menu">
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
                                </ul>
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
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg">
                <div class="card-header text-center bg-danger text-white">
                    <h3>Validando usuarios</h3>
                </div>
                <div class="card-body">
                    <form action="AdminController" method="POST"> 
                        <input type="hidden" name="pagina" value="usuarios">
                        <input type="hidden" name="nid" value="${usuarioDB.nid}">
                        <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                        <div class="form-group mb-3">
                            <label for="userName">Nombre</label>
                            <input class="form-control" type="text" id="userName" name="userName" value="${usuarioDB.userName}" readonly>
                        </div>
                        <div class="form-group mb-3">
                            <label for="email">Correo Electronico</label>
                            <input class="form-control" type="text" id="email" name="email" value="${usuarioDB.email}" readonly>
                        </div>
                        <div class="form-group mb-3">
                            <label for="category">Seleccione Role:</label>
                            <select id="roleOption" name="roleOption" class="form-control">
                                <c:forEach var="role" items="${roles}">
                                    <option value="${role.nid}">${role.authority}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <!--<div class="form-group mb-3" id="additionalSelectContainer" style="display: none;">
                            <label for="extraOption">Seleccione Equipo del Responsable:</label>
                            <select id="extraOption" name="extraOption" class="form-control">
                                <c:forEach var="equipo" items="${listaequipos}">
                                    <option value="${equipo.nid}">${equipo.nombre}</option>
                                </c:forEach>
                            </select>
                        </div>-->
                        <div class="buttons mb-3">
                            <button type = "submit" name="action" value="validar" class="btn btn-success">Validar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.getElementById('roleOption').addEventListener('change', function () {
            // Obtener el valor seleccionado
            const selectedValue = this.value;

            // Mostrar u ocultar el segundo select basado en la selección
            const additionalSelectContainer = document.getElementById('additionalSelectContainer');
            if (selectedValue === '2') { // Cambia '1' por el valor relevante para tu caso
                additionalSelectContainer.style.display = 'block'; // Mostrar el select
            } else {
                additionalSelectContainer.style.display = 'none'; // Ocultar el select
            }
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
