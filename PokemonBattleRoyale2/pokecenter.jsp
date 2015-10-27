<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Pok&eacute;mon BR</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/templateGeneral.css" rel="stylesheet">
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.js"></script>
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
                <a href="./pokemart"><div class="col-md-1 center">
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
<!----- AQUÍ SE ACABA EL HEADER. REPITO. AQUÍ SE ACABA EL HEADER. EL CONTENIDO EMPIEZA AQUÍ. ----->
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-2 contenido">
                    <table class="test">
                        <tr>
                            <td class="rounded">
                                Search
                            </td>
                        </tr>
                        <tr>
                            <td>
                               #001 Bulbasour  
                            </td>
                        </tr>
                        <tr>
                            <td>
                               #002 Ivysour 
                            </td>
                        </tr>
                    </table>
                  
                </div>
                <div class="col-md-8 contenido">
                    <div class="row user">
                        <c:if test='${sessionScope.user eq null}'>
                            <a href="login.jsp">Login</a>
                        </c:if>
                        <c:if test='${sessionScope.user ne null}'>
                            <img src="img/train/01.jpg"  /> ${sessionScope.username} | <a href="./logout">Logout</a>
                        </c:if>
                    </div>
                    <div class="imagenCentro">
                        <img src="img/Vaporeon.png" alt="Vaporeon">
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10 contenido">
                <div class="BotonesPke">
                    <div class="Botones" id="BotonArriba">
                        <img src="img/UpArrow.png" alt="Up" width="80" height="80">
                    </div>
                    <div class="Botones" id ="BotonAbajo">
                        <img src="img/DownArrow.png" alt="Down" width="80" height="80">
                    </div>
                </div>
                <div class="TablaEquipo">  
                    <table class="TablaEquipo1 ">
                        <tr>
                            <td>
                                <img src="img/Absol.png" >
                            </td>
                            <td>
                                <img src="img/Chespin.png">
                            </td>
                            <td>
                                <img src="img/Chikorita.png">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="img/Hunter.png">
                            </td>
                            <td>
                                <img src="img/Koffing.png">
                            </td>
                            <td>
                                <img src="img/Lugia.png">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
               <a href="#" class="button"/>Heal</a> 
            </div>
            <div class="col-md-1"></div>
        </div>
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
