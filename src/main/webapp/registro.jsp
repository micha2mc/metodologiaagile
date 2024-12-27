<%-- 
    Document   : registro
    Created on : 13 dic 2024, 15:44:13
    Author     : micha
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Formulario de Registro</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/cabecera.css">
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
                                    Portal
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Calendario</a></li>
                                    <li><a class="dropdown-item" href="#">Equipos</a></li>
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
            <div class="main">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card shadow-lg">
                            <div class="card-header text-center bg-danger text-white">
                                <h3>Regístrate</h3>
                            </div>
                            <div class="card-body">
                                <form action="Validation" method="POST">
                                    <!-- Nombre -->
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
                            <div class="card-footer text-center">
                                <p>¿Ya tienes una cuenta? <a href="login.jsp" class="text-danger">Inicia sesión aquí</a></p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- Modal -->
        <% String mensaje = (String) request.getAttribute("mensaje"); %>
        <% if (mensaje != null) {%>
        <div class="modal fade" id="mensajeModal" tabindex="-1" aria-labelledby="mensajeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="mensajeModalLabel">Mensaje</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <%= mensaje%>
                    </div>
                    <div class="modal-footer">
                        <a href="registro.jsp" class="btn btn-primary">Volver al formulario</a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Mostrar el modal automáticamente si hay un mensaje
            <% if (mensaje != null) { %>
            var myModal = new bootstrap.Modal(document.getElementById('mensajeModal'));
            myModal.show();
            <% }%>
        </script>
    </body>
</html>

