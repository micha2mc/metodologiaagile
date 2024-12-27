<%-- 
    Document   : manageNews
    Created on : 11 dic 2024, 23:28:32
    Author     : micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calendario Fórmula 1</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
    <!-- Encabezado -->
    <div class="container mt-4">
        <h1 class="text-center">Calendario Fórmula 1</h1>
        <p class="text-center text-muted">Consulta el calendario de la temporada actual</p>
    </div>

    <!-- Listado de carreras -->
    <div class="container">
        <c:forEach var="carrera" items="${listaCarreras}">
            <div class="row race-card ${carrera.estado}">
                <div class="col-md-2 text-center">
                    <strong>${carrera.fecha}</strong>
                </div>
                <div class="col-md-4">
                    <h5>${carrera.nombre}</h5>
                    <p class="text-muted">${carrera.ubicacion}</p>
                </div>
                <div class="col-md-3">
                    <span class="badge bg-primary">${carrera.estado == 'past' ? 'Finalizado' : (carrera.estado == 'current' ? 'En curso' : 'Próxima carrera')}</span>
                </div>
                <div class="col-md-3 text-end">
                    <a href="detalleCarrera.jsp?id=${carrera.id}" class="btn btn-sm btn-outline-secondary">Ver detalles</a>
                </div>
            </div>
        </c:forEach>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
