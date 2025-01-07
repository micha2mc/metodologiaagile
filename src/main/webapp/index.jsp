<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Circuits Management</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <style>
            .img-custom {
                width: 50px;
                height: auto; /* Mantener la proporción */
                object-fit: contain; /* Ajustar el contenido dentro de las dimensiones */
            }
        </style>
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
                                <a class="nav-link" href="index.jsp">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="PublicController">Noticias</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Portal
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="PublicController?pagina=calendario">Calendario</a>
                                    </li>
                                    <li><a class="dropdown-item" href="PublicController?pagina=equipos">Equipos</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div>
                <!-- Example single danger button -->
                <div class="btn-group">
                    <button style="margin-right: 100px;" type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
                        </svg>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="login.jsp">Conéctate</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="registro.jsp">Regístrate</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Close Header -->

        <!-- Modal -->
        <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="w-100 pt-1 mb-5 text-right">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="" method="get" class="modal-content modal-body border-0 p-0">
                    <div class="input-group mb-2">
                        <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                        <button type="submit" class="input-group-text bg-success text-light">
                            <i class="fa fa-fw fa-search text-white"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>



        <!-- Start Banner Hero -->
        <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
            <ol class="carousel-indicators">
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="container">
                        <div class="row p-5 align-items-start">
                            <div class="mx-auto col-md-8 col-lg-6 order-lg-last">

                                <img class="img-fluid" src="https://www.infobae.com/resizer/v2/WUF57RGJUQY6N73TYBHDV3EJY4.jpg?auth=be09878b0b4d5881080b2eb130b489190035b11b162b4e490967938e619503ad&smart=true&width=992&height=661&quality=85" alt="500" width="500"/>
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-start">
                                <div class="text-align-left align-self-start">
                                    <h1 class="h2 text-success"><b>La decisión de Mercedes con Lewis Hamilton que golpea a Ferrari en la Fórmula 1</b></h1>
                                    <h4 class="h4">En Inglaterra remarcan que son bajas las posibilidades de que el piloto de 39 años pueda decir presente en los test de postemporada con la escudería italiana.</h3>
                                        <p>
                                            La Fórmula 1 tendrá fuertes cambios en la conformación de las duplas de pilotos que lucirá cada
                                            escudería a partir de 2025. La incertidumbre por el futuro de Franco Colapinto ocurre en un marco
                                            con varios focos, como la salida de Lewis Hamilton de Mercedes para desembarcar en Ferrari y,
                                            a su vez, la contratación de Carlos Sainz dentro de la estructura de Williams.
                                        </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="container">
                        <div class="row p-5 align-items-start">
                            <div class="mx-auto col-md-8 col-lg-6 order-lg-last align-items-start">
                                <img class="img-fluid" src="https://padelmagazine.fr/wp-content/uploads/2023/02/Carlos-Sainz-JR-Ferrari.jpg" alt="500" width="500">
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-center">
                                <div class="text-align-left align-self-start">
                                    <h1 class="h2 text-success">Carlos Sainz ya tiene fecha para su estreno con Williams: será antes de la pretemporada del año 2025</h1>
                                    <h4>Carlos Sainz abandona Ferrari para convertirse en nuevo piloto de Williams a partir del año 2025.</h4>
                                    <p>
                                        El español Carlos Sainz se unirá al equipo Williams en el test final de temporada en el circuito de Yas Marina de
                                        Abu Dabi (Emiratos Árabes Unidos) en su primer contacto con su nueva escudería con el propósito de empezar a
                                        preparar la próxima temporada.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="container">
                        <div class="row p-5 align-items-start">
                            <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                                <img class="img-fluid" src="https://hips.hearstapps.com/hmg-prod/images/franco-colapinto-of-argentina-and-williams-walks-through-news-photo-1731668832.jpg?crop=0.645xw:0.643xh;0.172xw,0.00923xh&resize=1200:*" alt="500">
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-start">
                                <div class="text-align-left align-self-start">
                                    <h1 class="h2 text-success">Franco Colapinto sobre su futuro en la F1: "No me importa si es Verstappen o Zhou, quiero vencerlos"</h1>
                                    <h4>Colapinto sigue ganando protagonismo en la F1 mientras evalúa opciones para 2025.</h4>
                                    <p>
                                        Franco Colapinto, una de las promesas emergentes de la Fórmula 1, lanzó un comentario que ha generado
                                        revuelo al insinuar que Zhou Guanyu podría ser el peor piloto en la parrilla actual. Las declaraciones
                                        surgieron durante una entrevista con su patrocinador Quilmes, donde el piloto argentino destacó su
                                        ambición de superar a cualquier compañero de equipo, sin importar su nivel.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
                <i class="fas fa-chevron-left"></i>
            </a>
            <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
                <i class="fas fa-chevron-right"></i>
            </a>
        </div>
        <!-- End Banner Hero -->
        <!-- Start Featured Product -->
        <section class="bg-light">
            <div class="container py-12">
                <div class="row text-center py-3">
                    <div class="col-lg-6 m-auto">
                        <h1 class="h1">Últimas noticias</h1>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="noticia" items="${listaNoticias}" varStatus="status">
                        <c:if test="${status.index <= 6}">
                            <div class="col-12 col-md-4 mb-4">
                                <div class="card h-100">
                                    <a href="shop-single.html">
                                        <img src="${noticia.imagen}" class="card-img-top" alt="...">
                                    </a>
                                    <div class="card-body">
                                        <a href="PublicController?noticia=${noticia.nid}" class="h2 text-decoration-none text-dark">${noticia.titulo}"</a>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${status.index % 3 == 2}">
                            </div><div class="row">
                            </c:if>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Start Categories of The Month -->
        <section class="container py-12">
            <div class="container mt-4">
                <!-- Título -->
                <div class="row text-center py-3">
                    <div class="col-lg-6 m-auto">
                        <h1 class="h1">Votaciones en curso</h1>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="card">
                            <!--<img src="img/circuito/${proximoGP.circuitoImg}" class="card-img-top" alt="${proximoGP.nombre}">-->
                            <div class="card-body">
                                <p class="card-text">
                                    Fecha Límite: ${listaVotacion.fechaLimite}<br>
                                    Descripción: ${listaVotacion.descripcion}
                                </p>
                                <h4 class="text-center">${listaVotacion.titulo}</h4>
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Equipo</th>
                                            <th>Puntos</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="piloto" items="${listaVotacion.pilots}" varStatus="status">
                                            <tr>
                                                <td><img src="${piloto.imagen}" class="card-img-top img-custom" alt="${piloto.nombre}" width="200" height="25" >   ${piloto.nombre} ${piloto.apellidos}</td>
                                                <td>${piloto.team.nombre}</td>
                                                <td>${piloto.puntos}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <c:if test="${votar}">
                            <div class="mt-3">
                                <form action="PublicController" method="POST">
                                    <button type = "submit" name="pagina" value="votacion" class="btn btn-success">Votar</button>
                                </form>

                            </div>
                        </c:if>

                    </div>
                </div>
            </div>

        </section>
        <!-- End Categories of The Month -->
        <!-- End Featured Product -->


        <!-- Start Footer -->

        <!-- End Footer -->

        <!-- Start Script -->
        <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/templatemo.js"></script>
        <script src="assets/js/custom.js"></script>
        <!-- End Script -->
    </body>

</html>