<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Pokémon BR</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="shortcut icon" href="img/icon.png">
        
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/jquery.scrollbar.css" rel="stylesheet">
        <link href="css/templateGeneral.css" rel="stylesheet">
        <link href="css/image-picker.css" rel="stylesheet">
        <link href="css/dropit.css" rel="stylesheet">
                
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/dropit.js"></script>
        <script src="js/likeitshot.js"></script>
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
                <a href="./battle"><div class="col-md-1 friends">
                    &nbsp;<p>
                    <img src="img/battle.png"><br>
                    Battle
                </div></a>
                <a href="./myteam"><div class="col-md-1 team">
                	&nbsp;<p>
                    <img src="img/team.png"><br/>My Team
                </div></a>
                <div class="col-md-1 profile">
                	&nbsp;<p>
                    <img src="img/profile.png"><br/>
                    <ul class="menu list-unstyled">
                        <li style="margin-top:-8px; margin-bottom:8px;">
                            <a href="./profile">Profile</a>
                            <ul>
                                <li class="drop"><a href="#">Messages</a></li>
                                <li class="drop"><a href="./friends">Friend list</a></li>
                                <li class="drop"><a href="#">Settings</a></li>
                                <li class="drop"><a href="#">Help</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="col-md-1"></div>
            </div>
<!----- AQUÍ SE ACABA EL HEADER. REPITO. AQUÍ SE ACABA EL HEADER. EL CONTENIDO EMPIEZA AQUÍ. ----->
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
                    <div class="col-md-12" style="text-align: center;">
                        <form action="./nicknameit" method="POST">
                            <h1>You catched a <c:out value="${requestScope.nombre}" /></h1>
                            <img src="<c:out value="${requestScope.imagen}" />" /><br />
                            Level: <c:out value="${requestScope.nivel}" /> <br />
                            Nickname: <input type="text" maxlength="20" name="nick" /><br />
                            <input type="hidden" name="idPokemon" value="<c:out value="${requestScope.idpokemon}" />" />
                            <input type="hidden" name="nombre" value="<c:out value="${requestScope.nombre}" />" />
                            <input type="hidden" name="nivel" value="<c:out value="${requestScope.nivel}" />" />
                            <input type="hidden" name="hp" value="<c:out value="${requestScope.hp}" />" />
                            <input type="submit" value="Aceptar" />
                        </form>
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