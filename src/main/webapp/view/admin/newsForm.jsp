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
        <title>Nueva Noticia</title>
        <c:choose>
            <c:when test="${actualizar}">
                <link rel="stylesheet" type="text/css" href="assets/css/cabecera.css">
            </c:when>
            <c:otherwise>
                <link rel="stylesheet" type="text/css" href="../../assets/css/cabecera.css">  
            </c:otherwise>
        </c:choose>

    </head>
    <body>
        <div class="container">
            <div class="sidebar">
                <div class="d-flex flex-column justify-content-center align-items-center" >
                    <img src="https://media.formula1.com/image/upload/f_auto,c_limit,w_195,q_auto/etc/designs/fom-website/images/f1_logo"
                         alt="F1 Logo">
                    <c:choose>
                        <c:when test="${actualizar}">
                            <a class="btn btn-outline-ligth text-center" href="AdminController?pagina=noticia">Mant. Noticias</a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-outline-ligth text-center" href="../../AdminController?pagina=noticia">Mant. Noticias</a>  
                        </c:otherwise>
                    </c:choose>

                    <a class="btn btn-outline-ligth text-center" href="#">Mant. Votación</a>
                    <a class="btn btn-outline-ligth text-center" href="manageUsers.jsp">Mant. Usuarios</a>
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
                <div class="main1">

                    <c:choose>
                        <c:when test="${actualizar}">
                            <form class="form-sign" action="AdminController" method="POST" accept-charset="UTF-8" enctype="multipart/form-data">
                                <input type="hidden" name="noticia" value="${noticiaObtenida.nid}"">
                            </c:when>
                            <c:otherwise>
                                <form class="form-sign" action="../../AdminController" method="POST" accept-charset="UTF-8" enctype="multipart/form-data"> 
                                </c:otherwise>
                            </c:choose>


                            <input type="hidden" name="pagina" value="noticia">
                            <div class="form-group">
                                <label for="titulo">Título</label>
                                <input type="text" id="titulo" name="titulo" value="${noticiaObtenida.titulo}" placeholder="Ingrese el título de la noticia">
                            </div>

                            <div class="form-group">
                                <label for="texto">Texto</label>
                                <textarea id="texto" name="texto" rows="5" placeholder="Ingrese el texto de la noticia">${noticiaObtenida.texto}</textarea>
                            </div>

                            <div class="form-group">
                                <label for="foto">Foto</label>
                                <input type="file" id="foto" name="foto">
                            </div>
                            <div class="buttons">
                                <c:choose>
                                    <c:when test="${actualizar}">
                                        <button type = "submit" name="action" value="update" style="background-color:yellow; color:black ;">Update</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type = "submit" name="action" value="create" style="background-color: yellowgreen;">Create</button> 
                                    </c:otherwise>
                                </c:choose>
                            </div>

                        </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
