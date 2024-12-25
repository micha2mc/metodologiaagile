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
                                    Mantenimiento Admin.
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <c:choose>
                                            <c:when test="${actualizar}">
                                                <a class="btn btn-outline-ligth text-center" href="AdminController?pagina=noticia">Mant. Noticias</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="btn btn-outline-ligth text-center" href="../../AdminController?pagina=noticia">Mant. Noticias</a>  
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                    <li><a class="btn btn-outline-ligth text-center" href="#">Mant. Votación</a></li>
                                    <li><a class="btn btn-outline-ligth text-center" href="AdminController?pagina=usuario">Mant. Usuarios</a></li>
                                    <li><a class="btn btn-outline-ligth text-center" href="AdminController?pagina=circuito">Mant. Circuitos</a></li>
                                    <li><a class="btn btn-outline-ligth text-center" href="#">Mant. Portal</a></li>
                                </ul>
                            </li>
                            <div>
                                <c:choose>
                                    <c:when test="${actualizar}">
                                        <a href="view/admin/newsForm.jsp" class="btn btn-primary mb-3">Añadir Noticia</a><br>
                                    </c:when>
                                    <c:otherwise>

                                        <a href="newsForm.jsp" class="btn btn-primary mb-3">Añadir Noticia</a><br>
                                    </c:otherwise>
                                </c:choose>

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


    <div class="row justify-content-center">

        <div class="col-md-6">
            <div class="card shadow-lg">
                <div class="card-header text-center bg-danger text-white">

                    <c:choose>
                        <c:when test="${actualizar}">
                            <h3>${tituloAccion}</h3>
                        </c:when>
                        <c:otherwise>

                            <h3>Añadiendo Noticia</h3>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="card-body">

                    <c:choose>
                        <c:when test="${actualizar}">
                            <form action="AdminController" method="POST" accept-charset="UTF-8" enctype="multipart/form-data">
                                <input type="hidden" name="noticia" value="${noticiaObtenida.nid}"">
                            </c:when>
                            <c:otherwise>
                                <form action="../../AdminController" method="POST" accept-charset="UTF-8" enctype="multipart/form-data"> 
                                </c:otherwise>
                            </c:choose>
                            <input type="hidden" name="pagina" value="noticia">
                            <div class="form-group mb-3">
                                <label for="titulo" class="form-label">Título</label>
                                <input class="form-control" type="text" id="titulo" name="titulo" value="${noticiaObtenida.titulo}" placeholder="Ingrese el título de la noticia">
                            </div>

                            <div class="form-group mb-3">
                                <label class="form-label" for="texto">Texto</label>
                                <textarea class="form-control" id="texto" name="texto" rows="5" placeholder="Ingrese el texto de la noticia">${noticiaObtenida.texto}</textarea>
                            </div>

                            <div class="form-group mb-3">
                                <label class="form-label" for="foto">Foto</label>
                                <input class="form-control" type="file" id="foto" name="foto">
                            </div>
                            <div class="buttons">
                                <c:choose>
                                    <c:when test="${actualizar}">
                                        <button type = "submit" name="action" value="update" class="btn btn-warning">Update</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type = "submit" name="action" value="create" class="btn btn-success">Create</button> 
                                    </c:otherwise>
                                </c:choose>
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
