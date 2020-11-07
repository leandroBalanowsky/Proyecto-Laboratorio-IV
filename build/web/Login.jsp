<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="gestorComercios" scope="request" class="Gestor.GestorDB"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/ValidarForm.js" type="text/javascript"></script>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>ComerBook - Iniciar Sesion</title>
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
                            <form method="POST" action="/Parcial2/LoginServlet">
                                <div class="form-group">
                                    <label for="txtDescripcion">Usuario</label>
                                    <input type="text" class="form-control" name="txtUsername" id="txtUsername" ></input>
                                </div>
                                <div class="form-group">
                                    <label for="txtDireccion">Contraseña</label>
                                    <input type="password" class="form-control" name="txtPassword" id="txtPassword" >                                   
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-success btn-block">Iniciar Sesion</button>
                                </div>
                            </form>
                            <c:if test="${not empty error}">
                                <p class="text-danger">Error: ${error}</p>	
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>
