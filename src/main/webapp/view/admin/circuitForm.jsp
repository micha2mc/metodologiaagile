<%-- 
    Document   : circuitForm
    Created on : 22 dic 2024, 11:52:48
    Author     : micha
--%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Nuevo Circuito</title>
        <link rel="stylesheet" type="text/css" href="../../assets/css/cabecera.css">

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
                                <a class="nav-link" href="Controller">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="PublicController">Noticias</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Mantenimiento Admin.
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="btn btn-outline-ligth text-center" href="../../AdminController?pagina=noticia">Mant. Noticias</a></li>
                                    <li><a class="btn btn-outline-ligth text-center" href="#">Mant. Votación</a></li>
                                    <li><a class="btn btn-outline-ligth text-center" href="../../AdminController?pagina=usuario">Mant. Usuarios</a></li>
                                    <li><a class="btn btn-outline-ligth text-center" href="../../AdminController?pagina=circuito">Mant. Circuitos</a></li>
                                    <li><a class="btn btn-outline-ligth text-center" href="#">Detalles Equipos</a></li>
                                    <li><a class="btn btn-outline-ligth text-center" href="#">Mant. Portal</a></li>
                                </ul>
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
                    <h3>Creando Circuito</h3>
                </div>
                <div class="card-body">
                    <form action="../../AdminController" method="POST" accept-charset="UTF-8" enctype="multipart/form-data"> 
                        <input type="hidden" name="pagina" value="circuito">
                        <div class="form-group mb-3">
                            <label for="nombre">Nombre</label>
                            <input class="form-control" type="text" id="nombre" name="nombre" placeholder="Ingrese el título de la noticia">
                        </div>

                        <div class="form-group mb-3">
                            <label for="ciudad">Ciudad</label>
                            <input class="form-control" type="text" id="ciudad" name="ciudad" placeholder="Ingrese el título de la noticia">
                        </div>
                        <div class="form-group mb-3">
                            <label for="pais">País</label>
                            <input class="form-control" type="text" id="pais" name="pais" placeholder="Ingrese el título de la noticia">
                        </div>

                        <div class="form-group mb-3">
                            <label for="trazado">Trazado</label>
                            <input class="form-control" type="file" id="trazado" name="trazado">
                        </div>
                        <div class="form-group mb-3">
                            <label for="longitud">Longitud</label>
                            <input class="form-control" type="number" id="longitud" name="longitud" placeholder="Ingrese el título de la noticia">
                        </div>
                        <div class="form-group mb-3">
                            <label for="curvaslentas">Curvas Lentas</label>
                            <input class="form-control" type="number" id="curvaslentas" name="curvaslentas" placeholder="Ingrese el título de la noticia">
                        </div>
                        <div class="form-group mb-3">
                            <label for="curvasmedias">Curvas Medias</label>
                            <input class="form-control" type="number" id="curvasmedias" name="curvasmedias" placeholder="Ingrese el título de la noticia">
                        </div>
                        <div class="form-group mb-3">
                            <label for="curvasrapidas">Curvas Rápidas</label>
                            <input class="form-control" type="number" id="curvasrapidas" name="curvasrapidas" placeholder="Ingrese el título de la noticia">
                        </div>
                        <div class="buttons mb-3">
                            <button type = "submit" name="action" value="create" class="btn btn-success">Create</button> 
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>

