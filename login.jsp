<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Pok&eacute;mon BattleRoyale</title>
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

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                	<div class="row contenido">
                    	<div class="containme">
                        	<p>
                            <br/>
                        	<div id="logo"></div>
                			<div id="login">
                        		<h3>Log in</h3>
                        		<form style="font-family:'Segoe UI';" action="./login" method="post">
                        		<table class="table-responsive">
                            		<tr>
                                		<td>Username: </td>
                                                <td><input name="user" type="text" class="noborder txtfield" maxlength="30"></td>
                                	</tr>
                                	<tr>
                                		<td>Password: </td>
                                                <td><input name="pass" type="password" class="noborder txtfield" maxlength="20"></td>
                                	</tr>
                                    <tr>
                                    	<td style="font-size:12px; color:#0CF;"><a href="register.jsp">Register now!</a></td>
                                        </td>
                                        <td style="text-align:right; padding-top:10px; padding-bottom:15px;">
                                        <input name="log" type="submit" value="Enter" class="btn1">
                                        </td>
                                    </tr>
                            	</table>
                            	</form>
                            </div>
                    	</div><!-- Contain me --->
                    </div>
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
