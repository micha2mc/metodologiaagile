<%-- 
    Document   : Usuario
    Created on : 17 nov 2024, 09:42:49
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


            .sidebar img {
                width: 130px;

                margin-top: 10px;
                margin-bottom: 50px;
            }
        </style>
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

                </div>
            </div>
        </div>
    </div>
</body>

</html>
</html>
