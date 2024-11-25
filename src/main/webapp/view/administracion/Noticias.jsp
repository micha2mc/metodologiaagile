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
        <title>Interfaz Noticias</title>
        <style>

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
            }

            .container {
                display: flex;
                height: 100vh;

            }


            .sidebar {
                background-color: #d32f2f;
                color: white;
                width: 10%;
                padding: 20px;
                display: flex;
                flex-direction: column;
                justify-content: space-between;

            }

            .sidebar h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .sidebar a {
                color: white;
                text-decoration: none;
                display: block;
                padding: 30px;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .sidebar a:hover {
                background-color: #b71c1c;
            }


            .main {
                background-color: #f8f9fa;
                width: 100%;
                padding: 0px;
                display: flex;
                flex-direction: column;

            }

            .main1 {
                padding: 20px;
            }



            .header {
                background-color: #d32f2f;
                color: white;
                padding: 10px;
                text-align: center;

                margin-bottom: 20px;
                border-bottom-right-radius: 100px;
                flex-direction: column;
                height: 130px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            .form-group input,
            .form-group textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .buttons {
                display: flex;
                justify-content: flex-end;
                gap: 10px;
            }

            .buttons button {
                background-color: black;
                color: rgb(0, 0, 0);
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .buttons button:hover {
                background-color: #333;
            }

            .sidebar img {
                width: 130px;

                margin-top: 10px;
                margin-bottom: 50px;
            }
        </style>
    </head>

</head>
<body>
    <div class="container">

        <div class="sidebar">
            <div>
                <img src="https://media.formula1.com/image/upload/f_auto,c_limit,w_195,q_auto/etc/designs/fom-website/images/f1_logo"
                     alt="F1 Logo">
                <a href="#">Noticias</a>
                <a href="#">Votación</a>
                <a href="#">Usuarios</a>
            </div>
        </div>



        <div class="main">



            <div class="header">
                <h1>NOTICIAS</h1>
            </div>


            <div class="main1">
                <div class="form-group">
                    <label for="id">ID</label>
                    <input type="text" id="id" placeholder="Buscar por ID">
                </div>
                <div class="form-group">
                    <label for="titulo">Título</label>
                    <input type="text" id="titulo" placeholder="Ingrese el título">
                </div>

                <div class="form-group">
                    <label for="texto">Texto</label>
                    <textarea id="texto" rows="5" placeholder="Ingrese el texto"></textarea>
                </div>

                <div class="form-group">
                    <label for="foto">Foto</label>
                    <input type="file" id="foto">
                </div>




                <div class="buttons">
                    <button style="background-color: yellowgreen;">Create</button>
                    <button style="background-color:yellow; color:black ;">Update</button>
                    <button style="background-color:red;">Delete</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
