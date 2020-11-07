<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="gestorComercios" scope="request" class="Gestor.GestorDB"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/ValidarForm.js" type="text/javascript"></script>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>ComerBook - Tu red social de comercios</title>
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
                                <h1 class="card-header bg-dark text-white">Comercios:</h1>
                                <div class="card-body">
                                    <div class="row">
                                        <c:forEach var="com" items="${gestorComercios.comercios}">
                                            <div class="col-md-12">
                                                <div class="card border-success flex-md-row mb-4 shadow-sm h-md-250">
                                                    <div class="card-body d-flex flex-column align-items-start">               
                                                        <strong class="d-inline-block mb-2 text-success">${com.nombre}</strong>
                                                        <h6 class="mb-0">
                                                            <a class="text-dark" href="/Parcial2/FiltroRubro?id=${com.rubro.idRubro}">${com.rubro.rubro}</a>
                                                        </h6>
                                                        <p class="card-text mb-auto">${com.descripcion}</p>
                                                        <a class="btn btn-success btn-sm" href="/Parcial2/ComercioServlet?id=${com.idComercio}">Ver Comercio</a>
                                                    </div>
                                                    <img class="card-img-right flex-auto d-none d-lg-block" src="/Parcial2/imagen/Comercios/${com.imgComercio}" style="width: 375px; height: 255px;">                                
                                                </div>
                                            </div>
                                        </c:forEach>                                              
                                    </div>
                                </div>
                            </div>                                                   
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>
