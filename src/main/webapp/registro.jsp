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
        <div class="container">
            <div class="sidebar">
                <img src="https://media.formula1.com/image/upload/f_auto,c_limit,w_195,q_auto/etc/designs/fom-website/images/f1_logo"
                     alt="F1 Logo">
            </div>

            <div class="main">
                <div class="header">
                    <!-- Header -->
                    <nav class="navbar navbar-expand-lg">
                        <div class="collpse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a style="margin-left: 10px; border: none" class="btn btn-outline-ligth" href="index.jsp">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a style="margin-left: 10px; border: none" class="btn btn-outline-ligth" href="PublicController">Noticias</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <!-- Close Header -->
                </div>
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
    <% if (mensaje != null) { %>
        <div class="modal fade" id="mensajeModal" tabindex="-1" aria-labelledby="mensajeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="mensajeModalLabel">Mensaje</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <%= mensaje %>
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
        <% } %>
    </script>
    </body>
</html>

