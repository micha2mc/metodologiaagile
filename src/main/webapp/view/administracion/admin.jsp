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
        <title>Zona de Administración</title>
        <link rel="stylesheet" type="text/css" href="assets/css/cabecera.css">
    </head>

</head>
<body>
    <div class="container">

        <div class="sidebar">
            <div>
                <img src="https://media.formula1.com/image/upload/f_auto,c_limit,w_195,q_auto/etc/designs/fom-website/images/f1_logo"
                     alt="F1 Logo">
                <a href="NoticiaController">Noticias</a>
                <a href="#">Votación</a>
                <a href="#">Usuarios</a>
            </div>
        </div>



        <div class="main">
            <div class="header">
                <h1>NOTICIAS</h1>
            </div>
            <form class="form-sign" action="NoticiaController" method="POST">
                <div class="main1">
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
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
