<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Register</title>
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
                <a href="./profile"><div class="col-md-1 profile">
                	&nbsp;<p>
                    <img src="img/profile.png"><br/>Profile
                </div>
                <div class="col-md-1"></div></a>
            </div>
<!----- AQUÍ SE ACABA EL HEADER. REPITO. AQUÍ SE ACABA EL HEADER. EL CONTENIDO EMPIEZA AQUÍ. ----->

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="row contenido">
                    	<div class="containmemore">
							<div id="register">
                            	<h3 style="font-family:'Xolo';">Register</h3>
                                <p>
                                <form action="./altaUsuario" method="post">
                                <table class="table-responsive">
                                    <tr>
                                    	<td>
                                        <table class="table-responsive">
                                	<tr>
                                    	<td class="padmemore">Name: </td>
                                        <td class="padmemore"><input name="name" type="text" class="noborder" maxlength="30"></td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">Username: </td>
                                        <td class="padmemore"><input name="user" type="text" class="noborder" maxlength="20"></td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">Birthday: </td>
                                        <td class="padmemore"><input name="bday" type="text" class="noborder" maxlength="10"></td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">Country: </td>
                                        <td class="padmemore"><input name="country" type="text" class="noborder" maxlength="20"></td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">Password: </td>
                                        <td class="padmemore"><input name="pass" type="password" class="noborder" maxlength="20"></td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">Password repeat: </td>
                                        <td class="padmemore"><input name="passConfirm" type="password" class="noborder" maxlength="20"></td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">e-mail:</td>
                                        <td class="padmemore"><input name="mail" type="text" class="noborder" maxlength="30"></td>
                                    </tr>
                                </table>
                                        </td>
                                                                                                        
                                    	<td>
                                        	<table class="table-responsive">
                                            	<tr>
                                                	<td>
                                                    <h4>Trainer sprite:</h4><p>
                                                    <img src="img/train/m1.png" class="padmemore"> 
                                                    <img src="img/train/f1.png" class="padmemore"> 
                                                    <img src="img/train/m2.png" class="padmemore"> 
                                                    <img src="img/train/f2.png" class="padmemore">                                                    </td>
                                                </tr>
                                                <tr>
                                                	<td>
                                                    <h4>Starter pok&eacute;mon:</h4><p>
                                                    <img src="img/sprite/1.png"> 
                                                    <img src="img/sprite/4.png"> 
                                                    <img src="img/sprite/7.png"> 
                                                    <img src="img/sprite/152.png"> 
                                                    <img src="img/sprite/155.png"> 
                                                    <img src="img/sprite/158.png">
                                                    </td>
                                                </tr>
                                            </table>                                            
                                        </td>
                                                                      </tr>
                                </table>
                                <p align="right">
                                <input name="create" type="submit" value="Register" class="btn2" style="margin-right:20px;">
                                </form>
                                <p>
                            </div>                            
                    	</div><!-- Contain me --->
                    </div><!--Row Contenido --->
                </div><!-- Col Md 10 --->
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
