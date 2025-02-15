<%-- 
    Document   : registro
    Created on : 13 dic 2024, 15:44:13
    Author     : micha
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Formulario de Registro</title>
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
                                    <button href="#" class="btn btn-primary mb-3">Añadir Piloto en ${usuarioConectado.team.nombre}</button><br>
                                    <input type="hidden" name="pagina" value="pilotos"><!-- comment -->
                                    <input type="hidden" name="accion" value="create">
                                    <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                </form>
                            </div>
                            <div>
                                <form action="TeamController" method="POST">
                                    <button href="#" class="btn btn-primary mb-3">Añadir Responsable</button><br>
                                    <input type="hidden" name="pagina" value="respon">
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
        <div class="main">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow-lg">
                        <div class="card-header text-center bg-danger text-white">
                            <h3>Regístra Responsable de ${nameteam}</h3>
                        </div>
                        <div class="card-body">
                            <form action="TeamController" method="POST">
                                <input type="hidden" name="pagina" value="respon">
                                <input type="hidden" name="idusuarioconectado" value=${usuarioConectado.nid}>
                                <div class="form-group mb-3">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Ingresa tu nombre" required>
                                </div>
                                <!-- Email -->
                                <div class="form-group mb-3">
                                    <label for="email">Correo Electrónico</label>
                                    <input type="email" id="email" name="email" class="form-control" placeholder="Ingresa tu correo" required>
                                </div>

                                <!-- Contraseña -->
                                <div class="form-group mb-3">
                                    <label for="password">Contraseña</label>
                                    <input type="password" id="password" name="password" class="form-control" placeholder="Crea una contraseña" required>
                                </div>
                                <div class="d-grid">
                                    <button type="submit" name="accion" value="registrar" class="btn btn-danger btn-block">Crear Cuenta</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

