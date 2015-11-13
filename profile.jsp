<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Pok&eacute;mon BR</title>
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
                <a href="./profile"><div class="col-md-1 profile selected9">
                	&nbsp;<p>
                    <img src="img/profile.png"><br/>Profile
                </div>
                <div class="col-md-1"></div></a>
            </div>
<!----- AQUÍ SE ACABA EL HEADER. REPITO. AQUÍ SE ACABA EL HEADER. EL CONTENIDO EMPIEZA AQUÍ. ----->

            <div class="row">
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
                    <div class="row">
                        
                    </div>
                	<div class="row contenido">
                    	<div class="containmemore">
                            <div id="register">
                            	<h3 style="font-family:'Xolo';">Profile</h3>
                                <table class="table-responsive">
                                    <tr>
                                        <td>
                                        <table class="table-responsive">
                                	<tr>
                                    	<td class="padmemore">Name: </td>
                                        <td><c:out value="${name}" /></td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">Username: </td>
                                        <td><c:out value="${user}" /></td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">Birthday: </td>
                                        <td><c:out value="${bday}" /></td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">Country: </td>
                                        <td><c:out value="${country}" /></td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">e-mail:</td>
                                        <td><c:out value="${correo}" /></td>
                                    </tr>
                                </table>
                                        </td>
                                                                                                        
                                    	<td>
                                        	<table class="table-responsive">
                                            	<tr>
                                                	<td>
                                                    <h4>Trainer sprite:</h4><p>
                                                    <img src="<c:out value="${img}" />" class="displayed">                                                    </td>
                                                </tr>
                                                <tr>
                                                	<td>
                                                    <h4>Active team:</h4><p>
                                                    <c:forEach items="${requestScope.mainTeam}" var="p">
                                                        <img class="img-responsive" src="${p.imagen}" alt="" style="width: 25px; display: inline-block" >
                                                    </c:forEach>
                                                    </td>
                                                </tr>
                                            </table>                                            
                                        </td>
                                    </tr>
                                </table>
                        </div>
                    	</div><!-- Contain me --->
                    </div>
                    </c:if>
                    <c:if test='${sessionScope.user eq null}'>
                        <script>
                            window.location = 'login.jsp';
                        </script>
                    </c:if>
                </div>
                <div class="col-md-1"></div>
            </div><!-- Row --->

<!----- AQUÍ SE ACABA EL CONTENIDO Y EMPIEZA EL FOOTER. CONTENIDO ACABA AQUÍ. FOOTER EMPIEZA AQUÍ. --------->

				<div class="row">
                	<div class="col-md-1"></div>
                    <div class="col-md-10">
                    &nbsp;<br>
                	<p align="right"><font face="Segoe UI">
                	Contacto | Aviso de Privacidad | Mapa del Sitio
                	</font>
                    </div>
                	<div class="col-md-1"></div>
				</div>
    </body>
</html>
