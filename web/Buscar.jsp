<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="gestorComercios" scope="request" class="Gestor.GestorDB"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href="/Parcial2/css/mio.css" rel="stylesheet" type="text/css"/>
        <link href="css/ofertas.css" rel="stylesheet" type="text/css"/>
        <title>ComerBook - Buscar</title>
        
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
                        <div class="row">
                            <c:forEach var="of" items="${oferta}">
                            <div class="col-sm-4">
                                <div class="col-item">
                                    <div class="photo">
                                        <img src="imagen/Ofertas/${of.imgProducto}" class="img-responsive" alt="a" />
                                    </div>
                                    <div class="info">
                                        <div class="row">
                                            <div class="price col-md-12">
                                                <h5>${of.producto}</h5>
                                                <br>
                                                <h5 class="price-text-color">$${of.precio}</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <a href="/Parcial2/ComercioServlet?id=${of.idComercio}" class="btn btn-success btn-block">Ir al comercio</a>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                        <c:if test="${not empty mensaje}">
                            <p class="text-danger">${mensaje}</p>	
                        </c:if>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="js/ValidarForm.js" type="text/javascript"></script>
    </body>
</html>