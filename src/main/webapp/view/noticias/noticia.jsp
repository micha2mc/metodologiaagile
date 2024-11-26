<%-- 
    Document   : noticia
    Created on : 22 nov 2024, 20:42:50
    Author     : micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${noticia.titulo}</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
                        <!-- Header -->
        <nav class="navbar navbar-expand-lg navbar-light shadow bg-info">
            <div class="collpse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none" class="btn btn-outline-ligth" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none" class="btn btn-outline-ligth" href="NoticiaController">Noticias</a>
                    </li>
                </ul>
            </div>
        </nav>
            <!-- Close Header -->

        <div layout:fragment="content">
            
            <div class="row d-flex align-items-center justify-content-center">
                <div class="col-md-9 my-1">
                    
                    <a class="card shadow-lg" style="text-decoration:none;">
                        
                        <div class="card-body">
                            <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                                <img  src="https://www.infobae.com/resizer/v2/WUF57RGJUQY6N73TYBHDV3EJY4.jpg?auth=be09878b0b4d5881080b2eb130b489190035b11b162b4e490967938e619503ad&smart=true&width=992&height=661&quality=85" alt="500" width="500"/>
                            </div>
                            <h1 class="h1 text-success"><b>${noticia.titulo}</b></h1>
                            <p class="text-muted small">${noticia.texto}</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
