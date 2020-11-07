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
        <title>ComerBook - ${com.comercio.nombre}</title>
        
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
                        <input type="hidden" name="txtId" value="${com.comercio.idComercio}">
                        <div class="card bg-success">
                            <div class="container">
                                <div class="wrapper row">
                                    <div class="preview col-md-6">
                                        <div class="preview-pic tab-content p-3">
                                        <div class="tab-pane active" id="pic-1">
                                            <img src="/Parcial2/imagen/Comercios/${com.comercio.imgComercio}" alt=""/>
                                        </div>
                                        </div>	
                                    </div>
                                    <div class="details col-md-6">
                                        <h3 class="product-title">${com.comercio.nombre}</h3>
                                        <p class="product-description sizes text-white">${com.comercio.descripcion}</p>
                                        <h5 class="sizes">Direccion: <p class="text-white">${com.comercio.direccion}</p>
                                        </h5>
                                        <h5 class="sizes">Rubro:
                                            <p class="text-white">${com.comercio.rubro.rubro}</p>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <%--Ofertassss--%>
                        <div class="row">
                            <c:forEach var="of" items="${com.oferta}">
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
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                        <%--Seccion comentarios--%>
                        <div class="pt-5">
                             <a class="btn btn-success btn-block" href="#comentar">Comentar</a>
                        </div>
                        <div id="comentar" class="modalmask">
                            <div class="modalbox movedown">
                                <a href="#close" title="Close" class="close">X</a>
                                <form method="POST" action="/Parcial2/InsertarComentario">
                                    <div class="form-group">
                                        <input type="hidden" name="txtIdComercio" value="${com.comercio.idComercio}">
                                        <label for="txtNombreComentario">Nombre</label>
                                        <input type="text" class="form-control" name="txtNombreComentario" id="txtNombreComentario" maxlength="100">
                                    </div>
                                    <div class="form-group">
                                        <label for="txtComentario">Comentario</label>
                                        <textarea class="form-control" name="txtComentario" id="txtComentarioE" rows="3" maxlength="500"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="CboValoracion">Valoracion</label>
                                        <select class="form-control" name="cboValoracion" id="cboValoracion" >
                                            <c:forEach var="v" items="${gestorComercios.valoraciones}">
                                                <option value="${v.idValoracion}">${v.descripcion}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-success btn-block" onclick="return validarComentario();">Cargar</button>
                                </form>
                            </div>
                        </div>
                        <%-----------------------------------------------%>
                        <%-------------------Caja de Comentarios-------------------%>
                        <div class="card my-4">
                            <h5 class="card-header bg-dark text-white">Comentarios</h5>
                            <div class="card-body">
                                <c:forEach var="coment" items="${com.comentario}">
                                    <div class="card bg-dark ">
                                        <div class="row">
                                            <div class="col-3 pl-5 pt-3">
                                                <p class="text-success">Nombre:</p>
                                            </div>
                                            <div class="col-9 pt-3">
                                                <p class="text-white">${coment.nombre}</p>
                                            </div>
                                            <div class="col-3 pl-5">
                                                <p class="text-success">Mensaje:</p>
                                            </div>
                                            <div class="col-9">
                                                <p class="text-white">${coment.mensaje}</p>
                                            </div>
                                            <c:choose>
                                                <c:when test="${coment.valoracion.valor != null}">
                                                    <div class="col-3 pl-5">
                                                        <p class="text-success">Valoracion:</p>
                                                    </div>
                                                    <c:choose>
                                                        <c:when test="${coment.valoracion.valor == 1}">
                                                            <div class="col-9">
                                                                <p>⭐</p>
                                                            </div>
                                                        </c:when>
                                                        <c:when test="${coment.valoracion.valor == 2}">
                                                            <div class="col-9">
                                                                <p>⭐⭐</p>
                                                            </div>
                                                        </c:when>
                                                        <c:when test="${coment.valoracion.valor == 3}">
                                                            <div class="col-9">
                                                                <p>⭐⭐⭐</p>
                                                            </div>
                                                        </c:when>
                                                        <c:when test="${coment.valoracion.valor == 4}">
                                                            <div class="col-9">
                                                                <p>⭐⭐⭐⭐</p>
                                                            </div>
                                                        </c:when>
                                                        <c:when test="${coment.valoracion.valor == 5}">
                                                            <div class="col-9">
                                                                <p>⭐⭐⭐⭐⭐</p>
                                                            </div>
                                                        </c:when>
                                                    </c:choose>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <div class="pl-5 pb-3">
                                            <a href="#responder${coment.idComentario}"class="btn btn-success">Responder</a>
                                            <div id="responder${coment.idComentario}" class="modalmask">
                                                <div class="modalbox movedown">
                                                    <a href="#close" title="Close" class="close">X</a>
                                                    <form method="POST" action="/Parcial2/CargarRespuesta">
                                                        <input type="hidden" name="txtIdComentario" value="${coment.idComentario}">
                                                        <p>Responder a: ${coment.nombre}</p>
                                                        <div class="form-group">
                                                            <label for="txtRespuesta">Comentario</label>
                                                            <textarea class="form-control" name="txtRespuesta" id="txtRespuesta" rows="3" maxlength="500"></textarea>
                                                        </div>
                                                        <button type="submit" class="btn btn-success btn-block" onclick="return validarRespuesta();">Cargar</button>
                                                    </form>
                                                </div>
                                            </div>
                                            <c:if test="${!empty Usuario}">
                                                <a href="/Parcial2/EliminarComentario?id=${coment.idComercio}&idCom=${coment.idComentario}" class="btn btn-danger" >Eliminar</a>
                                            </c:if>                                           
                                        </div>
                                    </div>
                                    <c:forEach var="resp" items="${com.respuestas}">
                                        <c:if test="${resp.idComentario == coment.idComentario}">
                                            <div class="card">
                                                <div class="card pt-2 bg-success">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="col-3">
                                                                <h5>Respuesta:</h5>
                                                            </div>
                                                            <div class="col-9">
                                                                <p>${resp.mensaje}</p>
                                                            </div>
                                                                <c:if test="${!empty Usuario}">
                                                                     <a href="/Parcial2/EliminarRespuesta?id=${coment.idComercio}&idResp=${resp.idRespuesta}" class="btn btn-danger">Eliminar</a>
                                                                </c:if>                                                           
                                                        </div>                                                           
                                                    </div>
                                                </div>
                                            </div>  
                                        </c:if>         
                                    </c:forEach>
                                    <br>
                                </c:forEach>
                            </div>
                        </div>
                        <%-----------------Fin caja de comentarios -------------%>
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