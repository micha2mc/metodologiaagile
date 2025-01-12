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
        <title>Nuevo Piloto</title>
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
                                        Mant. Respo.
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                        <li><a class="dropdown-item" href="TeamController?pagina=pilotos">Mant. Pilotos</a></li>
                                        <li><a class="dropdown-item" href="TeamController?pagina=coches">Mant. Coches</a></li>
                                        <li><a class="dropdown-item" href="TeamController?pagina=equipos">Mant. Equipos</a></li>
                                        <li><a class="dropdown-item" href="TeamController?pagina=simulacion">Herram. Simulación</a></li>
                                    </ul>
                                </div>
                            </li>
                            <!--<li class="nav-item me-3">
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                        Mant. Portal
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                        <li><a class="dropdown-item" href="AdminController?pagina=calendario">Calendario</a></li>
                                        <li><a class="dropdown-item" href="#">Detalles Equipos</a></li>
                                    </ul>
                                </div>
                            </li>

                            <div>
                                <a href="view/team/pilotForm.jsp" class="btn btn-primary mb-3">Añadir Piloto</a><br>
                            </div>-->
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
                    <h3>Añadiendo Piloto</h3>
                </div>
                <div class="card-body">

                    <form action="TeamController" method="POST" accept-charset="UTF-8" enctype="multipart/form-data">
                        <input type="hidden" name="pagina" value="pilotos">
                        <input type="hidden" name="teamOption" value="${equipo.nid}">
                        <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>

                        <input type="hidden" name="estado" value="create">
                        <div class="form-group mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input class="form-control" type="text" id="nombre" name="nombre" value="" placeholder="Ingrese el nombre">
                        </div>

                        <div class="form-group mb-3">
                            <label class="form-label" for="apellidos">Apellidos</label>
                            <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="Ingrese el apellidos">
                        </div>

                        <div class="form-group mb-3">
                            <label class="form-label" for="dorsal">Dorsal</label>
                            <input type="number" class="form-control" id="dorsal" name="dorsal" placeholder="Ingrese el dorsal">
                        </div>

                        <div class="form-group mb-3">
                            <label class="form-label" for="foto">Imagen</label>
                            <input class="form-control" type="file" id="foto" name="foto">
                        </div>

                        <div class="form-group mb-3">
                            <label class="form-label" for="pais">País</label>
                            <input type="text" class="form-control" id="pais" name="pais" placeholder="Ingrese el país del piloto">
                        </div>

                        <div class="form-group mb-3">
                            <label for="equipo">Equipo:</label>
                            <input type="text" class="form-control" id="equipo" name="equipo" value="${equipo.nombre}" readonly="true">
                        </div>

                        <div class="form-group mb-3">
                            <label class="form-label" for="twitter">Twitter</label>
                            <input type="text" class="form-control" id="twitter" name="twitter" placeholder="Ingrese el twiter del piloto">
                        </div>

                        <div class="buttons">
                            <button type = "submit" name="accion" value="create" class="btn btn-success">Create</button> 
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
