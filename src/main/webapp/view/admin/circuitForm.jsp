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
        <div class="container">
            <div class="sidebar">
                <div class="d-flex flex-column justify-content-center align-items-center" >
                    <img src="https://media.formula1.com/image/upload/f_auto,c_limit,w_195,q_auto/etc/designs/fom-website/images/f1_logo"
                         alt="F1 Logo">
                    <a class="btn btn-outline-ligth text-center" href="../../AdminController?pagina=noticia">Mant. Noticias</a>  

                    <a class="btn btn-outline-ligth text-center" href="#">Mant. Votación</a>
                    <a class="btn btn-outline-ligth text-center" href="manageUsers.jsp">Mant. Usuarios</a>
                    <a class="btn btn-outline-ligth text-center" href="../../AdminController?pagina=circuito">Mant. Circuitos</a>
                    <a class="btn btn-outline-ligth text-center" href="#">Mant. Portal</a>
                </div>
            </div>
            <div class="main">
                <div class="header">
                    <nav class="navbar navbar-expand-lg">
                        <div class="collpse navbar-collapse" id="navbarNav">
                            <div class="dropdown ms-auto">
                                <button style="border: none" class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                    ${usuario.getUserName()}
                                </button>
                                <div class="dropdown-menu text-center">
                                    <a class="dropdown-item" href="#">
                                        <img src="img/usuario.png" alt="60" width="60"/>
                                    </a>
                                    <a class="dropdown-item" href="#">${usuario.getUserName()}</a>
                                    <a class="dropdown-item" href="#">${usuario.getEmail()}</a>
                                    <div class="dropdown-divider"></div>
                                    <form action="Validation" method="POST">
                                        <button name="accion" value="Salir" class="dropdown-item" href="#">Salir</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="main1" style="overflow-x: hidden;">
                    <div class="scroll-container">
                        <form class="form-sign" action="../../AdminController" method="POST" accept-charset="UTF-8"> 
                            <input type="hidden" name="pagina" value="circuito">
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" id="nombre" name="nombre" placeholder="Ingrese el título de la noticia">
                            </div>

                            <div class="form-group">
                                <label for="ciudad">Ciudad</label>
                                <input type="text" id="ciudad" name="ciudad" placeholder="Ingrese el título de la noticia">
                            </div>
                            <div class="form-group">
                                <label for="pais">País</label>
                                <input type="text" id="pais" name="pais" placeholder="Ingrese el título de la noticia">
                            </div>

                            <div class="form-group">
                                <label for="foto">Trazado</label>
                                <input type="file" id="foto">
                            </div>
                            <div class="form-group">
                                <label for="longitud">Longitud</label>
                                <input type="number" id="longitud" name="longitud" placeholder="Ingrese el título de la noticia">
                            </div>
                            <div class="form-group">
                                <label for="curvaslentas">CUrvas Lentas</label>
                                <input type="number" id="curvaslentas" name="curvaslentas" placeholder="Ingrese el título de la noticia">
                            </div>
                            <div class="form-group">
                                <label for="curvasmedias">Curvas Medias</label>
                                <input type="number" id="curvasmedias" name="curvasmedias" placeholder="Ingrese el título de la noticia">
                            </div>
                            <div class="form-group">
                                <label for="curvasrapidas">Curvas Rápidas</label>
                                <input type="number" id="curvasrapidas" name="curvasrapidas" placeholder="Ingrese el título de la noticia">
                            </div>
                            <div class="buttons">
                                <button type = "submit" name="action" value="create" style="background-color: yellowgreen;">Create</button> 

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

