<%--
    Document   : Noticias
    Created on : 17 nov 2024, 09:42:17
    Author     : Home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Zona de Administración</title>
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
                                <form action="AdminController" method="POST">
                                    <button href="#" class="btn btn-primary mb-3">Añadir Noticia</button><br>
                                    <input type="hidden" name="pagina" value="noticia">
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

    <div class="container">
        <p>Noticias</p>
        <div class="main">
            <div class="main1" style="overflow-x: hidden;">

                <table class="table table-hover">
                    <tbody>
                        <c:forEach var="temporalesNoticias" items="${listaNoticias}">
                            <tr>
                                <td style="width:150px;">
                                    <a>
                                        <img src="${temporalesNoticias.imagen}" alt="" class="img-thumbnail w-100 h-1000">
                                    </a>
                                </td>
                                <td>
                                    <table class="table table-borderless">
                                        <thead>
                                            <tr>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th class="text-start">${temporalesNoticias.titulo}</th>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="text-start">${temporalesNoticias.fecha}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="text-start">${temporalesNoticias.texto}</td>
                                            </tr>
                                            <tr>
                                                <td class="text-start">
                                                    <form class="m-0 p-0" action="AdminController" method="POST">
                                                        <button href="#" class="btn btn-success mb-3">Editar</button><br>
                                                        <input type="hidden" name="pagina" value="noticia">
                                                        <input type="hidden" name="noticia" value=${temporalesNoticias.nid}>
                                                        <input type="hidden" name="action" value="update">
                                                        <input type="hidden" name="estado" value="inicial">
                                                        <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                                    </form>
                                                </td>
                                                <td class="text-start">
                                                    <form class="m-0 p-0" action="AdminController" method="POST">
                                                        <button href="#" class="btn btn-danger mb-3">Eliminar</button><br>
                                                        <input type="hidden" name="pagina" value="noticia">
                                                        <input type="hidden" name="noticia" value=${temporalesNoticias.nid}>
                                                        <input type="hidden" name="action" value="delete">
                                                        <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                                    </form>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
