
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="gestorReporte" scope="request" class="Gestor.GestorDB"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>ComerBook - Administración</title>
    </head>
    <body>
        <%--Encabezado --%>
        <%@include file="Header.jsp"%>
        <%--Comienza la pagina principal--%>
        <main class="pt-5">
            <div class="container">
                <div class="row">
                    <%--Menu Lateral--%>
                    <div class="col-lg-3">
                        <%@include file="MenuCostado.jsp"%>
                    </div>
                        <%--Cuerpo--%>
                    <div class="col-lg-9 col-sm-12">
                        <%--Form carga de rubros--%>
                        <div class="card my-4">
                            <h5 class="card-header bg-dark text-white">Comercios ordenado por cantidad de comentarios:</h5>
                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead class="bg-dark text-success">
                                        <tr>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Cantidad de comentarios</th>
                                            <th scope="col">Ir al Comercio</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-success">
                                        <c:forEach var="cc" items="${gestorReporte.comercioComentario}">
                                        <tr>
                                            <td>${cc.nombre}</td>                                        
                                            <td>${cc.cantiComentarios}</td>
                                            <td colspan="2"><a class="btn btn-success btn-sm" href="/Parcial2/ComercioServlet?id=${cc.idComercio}">Ver Comercio</a></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <%--Form carga de comercios--%>
                        <div class="card my-4">                            
                            <h5 class="card-header bg-dark text-white">Comentarios no respondidos:</h5>
                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead class="bg-dark text-success">
                                        <tr>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Mensaje</th>
                                            <th scope="col">Comercio</th>
                                            <th scope="col">Ir al Comercio</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-success">
                                        <c:forEach var="cr" items="${gestorReporte.comentSinResp}">
                                        <tr>
                                            <td>${cr.nombre}</td>                                        
                                            <td>${cr.mensaje}</td>
                                            <td>${cr.comercio}</td>
                                            <td colspan="2"><a class="btn btn-success btn-sm" href="/Parcial2/ComercioServlet?id=${cr.idComercio}">Ver Comercio</a></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <%--Form carga de ofertas--%>
                        <div class="card my-4">
                            <h5 class="card-header bg-dark text-white">Valoración de cada comercio:</h5>
                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead class="bg-dark text-success">
                                        <tr>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Rubro</th>
                                            <th scope="col">Estrellas</th>
                                            <th scope="col">Ir al Comercio</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-success">
                                        <c:forEach var="pv" items="${gestorReporte.promValoracion}">
                                        <tr>
                                            <td>${pv.nombre}</td>                                        
                                            <td>${pv.rubro}</td>
                                            <td>${pv.promEstrella}⭐</td>
                                            <td colspan="2"><a class="btn btn-success btn-sm" href="/Parcial2/ComercioServlet?id=${pv.idComercio}">Ver Comercio</a></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card my-4">
                            <h5 class="card-header bg-dark text-white">Total de valoraciones por cantidad de estrellas:</h5>
                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead class="bg-dark text-success">
                                        <tr>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">Cantidad</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-success">
                                        <c:forEach var="cv" items="${gestorReporte.cantidadPorValoracion}">
                                        <tr>
                                            <td>⭐${cv.descripcion}</td>                                        
                                            <td>${cv.cantidad}</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <script src="/Parcial2/js/ValidarForm.js" type="text/javascript"></script>
        <script src="js/notiflix-aio.js" type="text/javascript"></script>
    </body>
</html>