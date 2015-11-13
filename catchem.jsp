<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Pokemon BR</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/jquery.scrollbar.css" rel="stylesheet">
        <link href="css/templateGeneral.css" rel="stylesheet">
        <link rel="shortcut icon" href="img/icon.png">
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/jquery.scrollbar.js"></script>
    </head>
    <body>
            <div class="row" id="header">
            	<div class="col-md-1"></div>
                <a href="index.jsp"><div class="col-md-2 pokedex">
                	&nbsp;<p>
                    <img src="img/dex.png"><br/>Pok&eacute;dex
                </div></a>
                <a href="explore.jsp"><div class="col-md-1 explore selected2">
                	&nbsp;
                	<p>
                	<img src="img/explore.png"><br/>Explore
                </div></a>
                <a href="./pokecenter"><div class="col-md-1 center">
                	&nbsp;<p>
                    <img src="img/medical.png"><br/>Pok&eacute;Center
                </div></a>
                <a href="./pokemart"><div class="col-md-1 mart">
					&nbsp;<p>
                    <img src="img/mart.png"><br/>Pok&eacute;Mart
                </div></a>
                <a href="gts.jsp"><div class="col-md-1 gts">
                	&nbsp;<p>
                    <img src="img/global.png"><br/>
                    GTS
                </div></a>
                <a href="./ratings"><div class="col-md-1 rate">
                    &nbsp;<p>
                    <img src="img/rate.png"><br/>
                    Ratings
                </div></a>
                <a href="battle.jsp"><div class="col-md-1 friends">
                    &nbsp;<p>
                    <img src="img/battle.png"><br>
                    Battle
                </div></a>
                <a href="./myteam"><div class="col-md-1 team">
                	&nbsp;<p>
                    <img src="img/team.png"><br/>My Team
                </div></a>
                <a href="./profile"><div class="col-md-1 profile">
                	&nbsp;<p>
                    <img src="img/profile.png"><br/>Profile
                </div>
                <div class="col-md-1"></div></a>
            </div>
<!----- AQU� SE ACABA EL HEADER. REPITO. AQU� SE ACABA EL HEADER. EL CONTENIDO EMPIEZA AQU�. ----->
        <div id="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <c:if test='${sessionScope.user ne null}'>
                    <div class="row user">
                        <c:if test='${sessionScope.user eq null}'>
                            <a href="login.jsp">Login</a>
                        </c:if>
                        <c:if test='${sessionScope.user ne null}'>
                            <img src="img/train/01.jpg"  /> ${sessionScope.username} | <a href="./logout">Logout</a>
                        </c:if>
                    </div>
                <div class="row contenido">
                    <div class="col-md-6">
                        <h1><c:out value="${requestScope.nombre}" /></h1>
                        <img src="<c:out value="${requestScope.imagen}" />" /><br />
                        Level: <c:out value="${requestScope.nivel}" />
                    </div>
                    <div class="col-md-6">
                        <c:out value="${requestScope.res}" /><br />
                        <table class="table-responsive tablaTienda" >
                        <tbody>
                        <tr>
                            <td width="18%">Name</td>
                            <td width="19%">Quantity</td>
                            <td width="19%"></td>
                        </tr>
                        <c:forEach items="${requestScope.balls}" var="p">
                            <tr>
                                <form action="./throwPokeball" method="POST">
                                <td><c:out value="${p.name}" /></td>
                                <td><c:out value="${p.price}" /></td>
                                <td><input type="hidden" name="idProducto" value="<c:out value="${p.id}" />" />
                                    <input type="hidden" name="idPokemon" value="<c:out value="${requestScope.idpokemon}" />" />
                                    <input type="hidden" name="nivel" value="<c:out value="${requestScope.nivel}" />" />
                                    <input type="hidden" name="hp" value="<c:out value="${requestScope.hp}" />" />
                                    <input type="hidden" name="nombre" value="<c:out value="${requestScope.nombre}" />" />
                                    <input type="hidden" name="imagen" value="<c:out value="${requestScope.imagen}" />" />
                                    <input type="hidden" name="cantidad" value="<c:out value="${p.price}" />" />
                                    <input type="hidden" name="efecto" value="<c:out value="${p.effect}" />" />
                                    <input type="submit" value="Use" /></td>
                                </form>
                            </tr>
                        </c:forEach>
                        </tbody>
                        </table>
                    </div>
                </div>
                </c:if>
                <c:if test='${sessionScope.user eq null}'>
                    <script>
                        window.location = 'login.jsp';
                    </script>
                </c:if>
            </div> 
            <div class="col-md-1"></div>
        </div>
    </body>
</html>