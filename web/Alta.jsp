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
        <title>ComerBook - Altas</title>
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
                        <%--Form carga de rubros--%>
                        <div class="card my-4">
                            <h1 class="card-header bg-dark text-white">Cargar Rubro:</h5>
                            <div class="card-body">
                                <form method="POST" action="/Parcial2/InsertarRubro" >
                                    <div class="form-group">
                                        <label for="txtRubro">Rubro</label>
                                        <input type="text" name="txtRubro" class="form-control" id="txtRubro"  aria-describedby="ayudaRubro" maxlength="100">
                                        <small id="ayudaRubro" class="form-text text-muted">por ejemplo: gastronomía, almacén, cuidado personal, etc.</small>
                                    </div>
                                    <button type="submit" class="btn btn-success btn-block" value="Grabar" onclick="return validarRubro();">Cargar</button>
                                </form>
                            </div>
                        </div>
                        <%--Form carga de comercios--%>
                        <div class="card my-4">                            
                            <h1 class="card-header bg-dark text-white">Cargar Comercio:</h5>
                            <div class="card-body">
                                <form method="POST" enctype="multipart/form-data" action="/Parcial2/InsertarComercio">
                                    <div class="form-group">
                                        <label for="txtNombre">Nombre</label>
                                        <input type="text" class="form-control" name="txtNombreComercio" id="txtNombreComercio" aria-describedby="ayudaNombre" maxlength="100">
                                        <small id="ayudaNombre" class="form-text text-muted">Nombre del comercio.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtDescripcion">Descripción</label>
                                        <textarea class="form-control" name="txtDescripcionComercio" id="txtDescripcionComercio" rows="3" aria-describedby="ayudaDescripcion" maxlength="500"></textarea>
                                        <small id="ayudaDescrpcion" class="form-text text-muted">Descripción del comercio.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtDireccion">Dirección</label>
                                        <input type="text" class="form-control" name="txtDireccionComercio" id="txtDireccionComercio" aria-describedby="ayudaDireccion" maxlength="100">
                                        <small id="ayudaDireccion" class="form-text text-muted">Dirección del comercio.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtRubros">Rubro</label>
                                        <select class="form-control" name="cboRubros" id="cboRubros" aria-describedby="ayudaRubro">
                                            <c:forEach var="r" items="${gestor.rubros}">
                                                <option value="${r.idRubro}">${r.rubro}</option>
                                            </c:forEach>
                                        </select>
                                        <small id="ayudaRubro" class="form-text text-muted">Rubro del comercio (De no haber rubro cargue uno).</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="imgComercio">Imagen</label>
                                        <input type="file" class="form-control-file" id="imgComercio" name="upload" aria-describedby="ayudaImg">
                                        <small id="ayudaImg" class="form-text text-muted">(Opcional) Puede ingresar una foto del comercio.</small>
                                    </div>
                                    <button type="submit" class="btn btn-success btn-block" onclick="return validarComercio();">Cargar</button>
                                </form>
                            </div>
                        </div>
                        <%--Form carga de ofertas--%>
                        <div class="card my-4">
                            <h1 class="card-header bg-dark text-white">Cargar Oferta:</h5>
                            <div class="card-body">
                                <form method="POST" action="/Parcial2/InsertarOferta" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="txtProducto">Producto</label>
                                        <input type="text" name="txtProducto" class="form-control" id="txtProducto" aria-describedby="ayudaProducto" maxlength="100">
                                        <small id="ayudaProducto" class="form-text text-muted">Producto en oferta.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="idPrecio">Precio</label>
                                        <input type="text" class="form-control" name="txtPrecio" id="txtPrecio" aria-describedby="ayudaPrecio" maxlength="53">
                                        <small id="ayudaPrecio" class="form-text text-muted">Precio de la oferta.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="idComercios">Comercio</label>
                                        <select class="form-control" name="cboComercios" id="cboComercios" aria-describedby="ayudaComercios">
                                            <c:forEach var="c" items="${gestor.comercios}">
                                                <option value="${c.idComercio}">${c.nombre}</option>
                                            </c:forEach>
                                        </select>
                                        <small id="ayudaComercios" class="form-text text-muted">Comercio que tiene la oferta (De no aparecer el comercio cargue uno).</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="imgProducto">Imagen</label>
                                        <input type="file" class="form-control-file" id="imgProducto" name="upload" aria-describedby="ayudaImgProducto">
                                        <small id="ayudaImgProducto" class="form-text text-muted">(Opcional) Puede ingresar una foto del producto.</small>
                                    </div>
                                    <button type="submit" class="btn btn-success btn-block" onclick="return validarOferta();">Cargar</button>
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
