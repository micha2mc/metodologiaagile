<%-- 
    Document   : Registro
    Created on : 16 nov 2024, 13:20:33
    Author     : micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Login</title>
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
                                <h3>Conéctate</h3>
                                <label>Introduce</label>
                            </div>
                            <div class="card-body">
                                <form action="Validation" method="POST">
                                    <!-- Correo electronico -->
                                    <div class="form-group mb-3">
                                        <input type="text" name="txtemail" placeholder="Correo electrónico" value="" required>
                                    </div>

                                    <!-- Contraseña -->
                                    <div class="form-group mb-3">
                                        <input type="password" name="txtpass" placeholder="Contraseña" class="form-control" required>
                                    </div>
                                    <div class="d-grid">
                                        <button type="submit" name="accion" value="conectar" class="btn btn-danger btn-block">ENTRA</button>
                                        <!--<input type="submit" name="accion" value="ENTRA" class="btn btn-danger">-->
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center">
                                <p class="align-center text-center color-primary margin-bottom-m">Si no tienes todavía, <a href="registro.jsp">crea tu cuenta</a></p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
