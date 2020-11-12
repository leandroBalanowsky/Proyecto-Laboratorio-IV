<%-- 
    Document   : header
    Created on : 23 oct. 2020, 14:38:32
    Author     : aelde
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<div class="pb-5">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <a class="navbar-brand" href="/Parcial2/">
      <img src="https://getbootstrap.com/docs/4.1/assets/brand/bootstrap-solid.svg" width="30" height="30" class="d-inline-block align-top" alt="">
      ComerBook
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
          <c:choose>
              <c:when test="${empty Usuario}">
                  <a class="nav-link pr-3" href="/Parcial2/LoginServlet">Iniciar Sesion<span class="sr-only">(current)</span></a>
              </c:when>
              <c:otherwise>
                  <a class="nav-link pr-3" href="/Parcial2/LogoutServlet">Cerrar Sesion<span class="sr-only">(current)</span></a>
              </c:otherwise>
          </c:choose>        
      </li>
    </ul>
  </div>
</nav>
</div>


