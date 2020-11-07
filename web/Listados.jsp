
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="gestorListados" scope="request" class="Gestor.GestorDB"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>ComerBook - Modificaciones</title>
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
                            <h5 class="card-header bg-dark text-white">Rubros</h5>
                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead class="bg-dark text-success">
                                        <tr>
                                            <th scope="col">Rubro</th>
                                            <th scope="col">Modificar</th>
                                            <th scope="col">Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-success">
                                        <c:forEach var="cr" items="${gestorListados.rubros}">
                                        <tr>
                                            <td>${cr.rubro}</td>
                                            <td>
                                                <a class="btn btn-success btn-sm btn-block" href="/Parcial2/ModificarRubro?id=${cr.idRubro}">Modificar</a>
                                            </td>
                                            <td>
                                               <a class="btn btn-danger btn-sm btn-block" href="/Parcial2/EliminarRubro?id=${cr.idRubro}">Eliminar</a>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <c:if test="${not empty errorRubro}">
                                    <p class="text-danger">Error: ${errorRubro}</p>	
                                </c:if>
                            </div>
                        </div>
                        <%--Form carga de comercios--%>
                        <div class="card my-4">                            
                            <h5 class="card-header bg-dark text-white">Comercios</h5>
                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead class="bg-dark text-success">
                                        <tr>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">Rubro</th>
                                            <th scope="col">Modificar/Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-success">
                                        <c:forEach var="cc" items="${gestorListados.comercios}">
                                        <tr>
                                            <td>${cc.nombre}</td>                                        
                                            <td>${cc.descripcion}</td>
                                            <td>${cc.rubro.rubro}</td>
                                            <td>
                                                <a class="btn btn-success btn-sm btn-block" href="/Parcial2/ModificarComercio?id=${cc.idComercio}">Modificar</a>
                                                <a class="btn btn-danger btn-sm btn-block" href="/Parcial2/EliminarComercio?id=${cc.idComercio}">Eliminar</a>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <c:if test="${not empty errorComercio}">
                                    <p class="text-danger">Error: ${errorComercio}</p>	
                                </c:if>
                            </div>
                        </div>
                        <%--Form carga de ofertas--%>
                        <div class="card my-4">
                            <h5 class="card-header bg-dark text-white">Ofertas</h5>
                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead class="bg-dark text-success">
                                        <tr>
                                            <th scope="col">Producto</th>
                                            <th scope="col">Comercio</th>
                                            <th scope="col">Precio</th>
                                            <th scope="col">Modificar/Eliminar</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody class="table-success">
                                        <c:forEach var="co" items="${gestorListados.ofertasCompletas}">
                                        <tr>
                                            <td>${co.producto}</td>                                        
                                            <td>${co.comercio}</td>
                                            <td>$${co.precio}</td>
                                            <td>
                                                <a class="btn btn-success btn-sm" href="/Parcial2/ModificarOferta?id=${co.idOferta}">Modificar</a>
                                                <a class="btn btn-danger btn-sm" href="/Parcial2/EliminarOferta?id=${co.idOferta}">Eliminar</a>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <c:if test="${not empty errorOferta}">
                                    <p class="text-danger">Error: ${errorOferta}</p>	
                                </c:if>
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
