<%-- 
    Document   : index
    Created on : 13 nov 2024, 22:36:38
    Author     : micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Pagina principal</title>
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
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-ligth" href="view/noticias.jsp">Noticias</a>
                        </li>
                    </ul>
                </div>
                <div class="dropdown">
                    <a class="btn btn-outline-ligth" href="view/Registro.jsp">LogIn</a>
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
                            <div class="row p-5">
                                <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                                    
                                    <img class="img-fluid" src="https://www.infobae.com/resizer/v2/WUF57RGJUQY6N73TYBHDV3EJY4.jpg?auth=be09878b0b4d5881080b2eb130b489190035b11b162b4e490967938e619503ad&smart=true&width=992&height=661&quality=85" alt="500" width="500"/>
                                </div>
                                <div class="col-lg-6 mb-0 d-flex align-items-center">
                                    <div class="text-align-left align-self-center">
                                        <h1 class="h1 text-success"><b>La decisión de Mercedes con Lewis Hamilton que golpea a Ferrari en la Fórmula 1</b></h1>
                                        <h3 class="h2">En Inglaterra remarcan que son bajas las posibilidades de que el piloto de 39 años pueda decir presente en los test de postemporada con la escudería italiana.</h3>
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
                            <div class="row p-5">
                                <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                                    <img class="img-fluid" src="https://padelmagazine.fr/wp-content/uploads/2023/02/Carlos-Sainz-JR-Ferrari.jpg" alt="500" width="500">
                                </div>
                                <div class="col-lg-6 mb-0 d-flex align-items-center">
                                    <div class="text-align-left">
                                        <h1 class="h1">Carlos Sainz ya tiene fecha para su estreno con Williams: será antes de la pretemporada del año 2025</h1>
                                        <h3 class="h2">Carlos Sainz abandona Ferrari para convertirse en nuevo piloto de Williams a partir del año 2025.</h3>
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
                            <div class="row p-5">
                                <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                                    <img class="img-fluid" src="https://hips.hearstapps.com/hmg-prod/images/franco-colapinto-of-argentina-and-williams-walks-through-news-photo-1731668832.jpg?crop=0.645xw:0.643xh;0.172xw,0.00923xh&resize=1200:*" alt="500">
                                </div>
                                <div class="col-lg-6 mb-0 d-flex align-items-center">
                                    <div class="text-align-left">
                                        <h1 class="h1">Franco Colapinto sobre su futuro en la F1: "No me importa si es Verstappen o Zhou, quiero vencerlos"</h1>
                                        <h3 class="h2">Colapinto sigue ganando protagonismo en la F1 mientras evalúa opciones para 2025.</h3>
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


            <!-- Start Categories of The Month -->
            <section class="container py-5">
                <div class="row text-center pt-3">
                    <div class="col-lg-6 m-auto">
                        <h1 class="h1">Zona de Votaciones</h1>
                        <p class="text-center"><a class="btn btn-success">Votar</a></p>
                    </div>
                </div>
                
            </section>
            <!-- End Categories of The Month -->
            <!-- Start Footer -->
            <footer class="bg-dark" id="tempaltemo_footer">
                <div class="container">
                    <div class="row text-center">
                        <h2 class="h2 text-success pb-3 border-light logo">Circuit Management</h2>
                    </div>
                </div>

            </footer>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
