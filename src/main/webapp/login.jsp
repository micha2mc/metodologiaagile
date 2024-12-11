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
                <div class="d-flex justify-content-center align-items-center v-100">
                    <div class="mt-4 col-lg-4">
                        <div class="card col-sm-12">
                            <div class="card-body">
                                <form class="form-sign" action="Validation" method="POST">
                                    <div class="form-group  text-center" >
                                        <h3>Login</h3>
                                        <label>Bienvenidos</label>
                                    </div>
                                    <div class="form-group">
                                        <label>Usuario</label>
                                        <input type="text" name="txtuser" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>email</label>
                                        <input type="text" name="txtemail" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" name="txtpass" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" name="accion" value="Conectar" class="btn btn-primary btn-block">
                                    </div>
                                </form>  
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
