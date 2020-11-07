<%-- 
    Document   : MenuCostado
    Created on : 23 oct. 2020, 16:37:18
    Author     : aelde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="g" scope="request" class="Gestor.GestorDB"></jsp:useBean>

<div class="card my-4">
    <h5 class="card-header bg-dark text-white">Buscar</h5>
    <div class="card-body">
        <div class="input-group">
            <form class="container-fluid" method="GET" action="/Parcial2/BuscarOfertas">
                <input type="text" class="form-control" name="txtBuscar" placeholder="Buscar oferta...">
                <button class="btn btn-success btn-block" type="submit">ir!</button>
            </form>
        </div>
    </div>
</div>

                        <!-- Categories Widget -->
<div class="card my-4">
    <h5 class="card-header bg-dark text-white">Rubros</h5>
    <div class="card-body">
        <div class="row">
            <div class="col-lg-12">
                <ul class="list-unstyled mb-0">
                <c:forEach var="r" items="${g.rubros}">
                    <li>
                        <a href="/Parcial2/FiltroRubro?id=${r.idRubro}" class="text-success" style="text-decoration: none">${r.rubro}</a>
                    </li>
                </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
<c:if test="${!empty Usuario}">
    <div class="card my-4">
    <h5 class="card-header bg-dark text-white">Administración</h5>
    <div class="card-body">
        <div class="row">
            <div class="col-lg-12">
                <ul class="list-unstyled mb-0">
                    <li>
                        <a href="/Parcial2/Altas" class="text-success" style="text-decoration: none">Altas</a>
                    </li>
                    <li>
                        <a href="/Parcial2/BajaModificacion" class="text-success" style="text-decoration: none">Bajas/Modificaciones</a>
                    </li>
                    <li>
                        <a href="/Parcial2/Reportes" class="text-success" style="text-decoration: none">Reportes</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</c:if>

