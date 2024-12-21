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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Zona de Administración</title>
        <link rel="stylesheet" type="text/css" href="assets/css/cabecera.css">
    </head>
    <body>
        <div class="container">
            <div class="sidebar">
                <div class="d-flex flex-column justify-content-center align-items-center" >
                    <img src="https://media.formula1.com/image/upload/f_auto,c_limit,w_195,q_auto/etc/designs/fom-website/images/f1_logo"
                         alt="F1 Logo">
                    <a class="btn btn-outline-ligth text-center" href="AdminController?pagina=noticia">Mant. Noticias</a>
                    <a class="btn btn-outline-ligth text-center" href="#">Mant. Votación</a>
                    <a class="btn btn-outline-ligth text-center" href="AdminController?pagina=usuario">Mant. Usuarios</a>
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
                    <div>
                        <a href="view/admin/newsForm.jsp" class="btn btn-primary mb-3">Añadir Noticia</a><br>
                    </div>
                    <table class="table table-hover">
                        <tbody>
                            <c:forEach var="temporalesNoticias" items="${listaNoticias}">
                                <tr>
                                    <td style="width:150px;">
                                        <a th:href="@{'/images/uploads/'+ ${actor.image}}" data-fancybox>
                                            <img th:src="@{'/images/uploads/'+ ${actor.image}}" alt="" class="img-thumbnail w-100">
                                        </a>
                                    </td>
                                    <td>
                                        <table class="table table-borderless">
                                            <thead>
                                                <tr>
                                                    <th scope="col"></th>
                                                    <th scope="col"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th class="text-start" th:text="*{name}">${temporalesNoticias.titulo}</th>
                                                </tr>
                                                <tr>
                                                    <td class="text-start" th:text="*{genre}">${temporalesNoticias.texto}</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-start">
                                                        <a  class="btn btn-success">Editar</a>
                                                        <a href="AdminController?pagina=noticia&noticia=${temporalesNoticias.nid}&action=delete" class="text-light ms-3 btn btn-danger">Eliminar</a>
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
