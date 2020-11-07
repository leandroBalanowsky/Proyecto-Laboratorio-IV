<%-- 
    Document   : index
    Created on : 23 oct. 2020, 15:09:35
    Author     : aelde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="gestor" scope="request" class="Gestor.GestorDB"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>ComerBook - Modificar Oferta</title>
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
                    <div class="col-lg-6 col-sm-12">
                        <%--Form carga de ofertas--%>
                        <div class="card my-4">
                            <h1 class="card-header bg-dark text-white">Cargar Oferta:</h5>
                            <div class="card-body">
                                <form method="POST" action="/Parcial2/ModificarOferta" enctype="multipart/form-data">
                                    <input type="hidden" name="txtIdOferta" value="${oferta.idOferta}">
                                    <input type="hidden" name="txtImgProducto" value="${oferta.imgProducto}">
                                    <div class="form-group">
                                        <label for="txtProducto">Producto</label>
                                        <input type="text" name="txtProducto" value="${oferta.producto}" class="form-control" id="txtProducto" aria-describedby="ayudaProducto" maxlength="100">
                                        <small id="ayudaProducto" class="form-text text-muted">Producto en oferta.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="idPrecio">Precio</label>
                                        <input type="text" class="form-control" name="txtPrecio" value="${oferta.precio}" id="txtPrecio" aria-describedby="ayudaPrecio" maxlength="53">
                                        <small id="ayudaPrecio" class="form-text text-muted">Precio de la oferta.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="idComercios">Comercio</label>
                                        <select class="form-control" name="cboComercios" id="cboComercios" aria-describedby="ayudaComercios">
                                            <c:forEach var="c" items="${gestor.comercios}">
                                                <option value="${c.idComercio}"<c:if test="${c.idComercio == oferta.idComercio}"> selected</c:if>>${c.nombre}</option>
                                            </c:forEach>
                                        </select>
                                        <small id="ayudaComercios" class="form-text text-muted">Comercio que tiene la oferta (De no aparecer el comercio cargue uno).</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="imgProducto">Imagen</label>
                                        <input type="file" class="form-control-file" id="imgProducto" name="upload" aria-describedby="ayudaImgProducto">
                                        <small id="ayudaImgProducto" class="form-text text-muted">(Opcional) Puede ingresar una foto del producto.</small>
                                    </div>
                                    <button type="submit" class="btn btn-success" onclick="return validarOferta();">Cargar</button>
                                    <a class="btn btn-danger " href="/Parcial2/BajaModificacion">Cancelar</a>
                                </form>
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
