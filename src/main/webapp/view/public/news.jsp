<%--
    Document   : noticias
    Created on : 16 nov 2024, 13:38:42
    Author     : micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualidad</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
                <div class="overflow-md-scroll" style="overflow-x: hidden;">
                    <div class="row d-flex align-items-start justify-content-center" style="height: 100vh;">
                        <div class="col-md-6 my-1">
                            <c:forEach var="temporalesNoticias" items="${listaNoticias}">
                                <a href="PublicController?noticia=${temporalesNoticias.nid}" class="card shadow-lg" style="text-decoration:none;">
                                    <img th:src="@{'/images/uploads/'+ ${pelicula.image}}" th:alt="*{title}" class="card-img-top">
                                    <div class="card-body">
                                        <h2 class="card-title fs-6">${temporalesNoticias.titulo}</h2>
                                        <p class="text-muted small">${temporalesNoticias.texto}</p>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
