<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Pok�mon BR</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/templateGeneral.css" rel="stylesheet">
        <link rel="shortcut icon" href="img/icon.png">
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/mart.js"></script>
    </head>
    <body>
            <div class="row" id="header">
            	<div class="col-md-1"></div>
                <a href="index.jsp"><div class="col-md-2 pokedex">
                	&nbsp;<p>
                    <img src="img/dex.png"><br/>Pok&eacute;dex
                </div></a>
                <a href="explore.jsp"><div class="col-md-1 explore">
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
        	<div class="row">
            	<div class="col-md-1"></div>
                <div class="col-md-10 contenido">
                <c:if test='${sessionScope.user ne null}'>
                    <div class="row user">
                        <c:if test='${sessionScope.user eq null}'>
                            <a href="login.jsp">Login</a>
                        </c:if>
                        <c:if test='${sessionScope.user ne null}'>
                            <img src="img/train/01.jpg"  /> ${sessionScope.username} | <a href="./logout">Logout</a>
                        </c:if>
                    </div>
                    <img class="displayed img-responsive" src="img/pkmart.png" alt=""/>
                    <div class="row salto">
                        <div> &nbsp;<p> &nbsp;<p> &nbsp;<p> </div>
                    </div>
                    <div class="row contenido">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
                            <div id="tablaCentral">
                                <c:out value="${requestScope.res}" />
                                <table class="table-responsive tablaTienda" >
                                <tbody>
                                <tr>
                                    <td width="25%">Name</td>
                                    <td width="18%">Price</td>
                                    <td width="19%">Quantity</td>
                                    <td width="19%"></td>
                                </tr>
                                <c:forEach items="${requestScope.productos}" var="p">
                                    <tr>
                                        <form action="./buyStuff" method="POST">
                                        <td><c:out value="${p.name}" /> <img src="img/info.png" onClick="showDescription('${p.description}');"></td>
                                        <td>$ <c:out value="${p.price}" /></td>
                                        <td><input type="text" name="cantidad" maxlength="3" size="3" /></td>
                                        <td><input type="hidden" name="idProducto" value="<c:out value="${p.id}" />" />
                                            <input type="hidden" name="price" value="<c:out value="${p.price}" />" />
                                            <input type="submit" value="Comprar" /></td>
                                        </form>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                </table>
                            </div>
                            
                        </div>
                        <div class="col-md-1"></div>
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
