<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Pokémon BattleRoyale</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/templateGeneral.css" rel="stylesheet">
        <link rel="shortcut icon" href="img/icon.png">
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/otroperfiljuas.js"></script>
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
                <a href="pokecenter.jsp"><div class="col-md-1 center">
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
                <div class="col-md-10 contenido">
                <h1>Ratings</h1>
                    <div class="row salto">
                        <div> &nbsp;<p> </div>
                        
                    </div>
                    <div class="row contenido">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <div id="tablaCentral">
                                <table class="table-responsive table-striped" id="ftable" >
                                <tbody>
                                <tr>
                                    <td>Position</td>
                                    <td>Name</td>
                                    <td>Captured</td>
                                </tr>
                                <c:forEach items="${requestScope.rankeados}" var="p">
                                    <tr>
                                        <td><c:out value="${p.posicion}" /></td>
                                        <td><a href="javascript:showProfile('${p.iD}');"><c:out value="${p.nombre}" /></A> </td>
                                        <td><c:out value="${p.pkmnsCatched}" /></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                </table>
                                <form action="./OtroPerfil" method="POST" id="myForm" style="visibility:hidden"  >
                                        <input type="text" name="user" maxlength="20" size="10" id="pony" />
                                            <input type="submit" value="Ir" /></td>
                                </form>
                            </div>
                            <div class="col-md-3"></div>
                            
                        </div>
                    </div> 
                </div>
                <div class="col-md-1"></div>
            </div>
    </body>
</html>