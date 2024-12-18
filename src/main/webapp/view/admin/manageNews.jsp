<%--
    Document   : Noticias
    Created on : 17 nov 2024, 09:42:17
    Author     : Home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Zona de Administración</title>
        <link rel="stylesheet" type="text/css" href="assets/css/cabecera.css">
    </head>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <div class="d-flex flex-column justify-content-center align-items-center" >
                <img src="https://media.formula1.com/image/upload/f_auto,c_limit,w_195,q_auto/etc/designs/fom-website/images/f1_logo"
                     alt="F1 Logo">
                <a class="btn btn-outline-ligth text-center" href="PublicController">Noticias</a>
                <a class="btn btn-outline-ligth text-center" href="#">Votación</a>
                <a class="btn btn-outline-ligth text-center" href="manageUsers.jsp">Usuarios</a>
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
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">First</th>
                            <th scope="col">Last</th>
                            <th scope="col">Handle</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                        </tr>
                        <tr>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                        </tr>
                        <tr>
                            <td colspan="2">Larry the Bird</td>
                            <td>@twitter</td>
                        </tr>
                    </tbody>
                </table>

                <!--<form class="form-sign" action="AdminController" method="POST">

                    <div class="form-group">
                        <label for="titulo">Título</label>
                        <input type="text" id="titulo" name="titulo" placeholder="Ingrese el título de la noticia">
                    </div>

                    <div class="form-group">
                        <label for="texto">Texto</label>
                        <textarea id="texto" name="texto" rows="5" placeholder="Ingrese el texto de la noticia"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="foto">Foto</label>
                        <input type="file" id="foto">
                    </div>
                    <div class="buttons">
                        <button type = "submit" name="action" value="create" style="background-color: yellowgreen;">Create</button>
                        <button type = "submit" name="action" value="update" style="background-color:yellow; color:black ;">Update</button>
                        <button type = "submit" name="action" value="delete" style="background-color:red;">Delete</button>
                    </div>

                </form>-->
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
