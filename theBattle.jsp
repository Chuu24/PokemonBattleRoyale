<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Pok&eacute;mon BattleRoyale</title>
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
                    	<div class="containme">
                        	<p>
                            <br/>
                                <div class="row">
                                    <div class="col-lg-3 currentPoke">
                                        <img src="img/Bulbasaur.png" class="img-responsive"/><br />
                                        Bob - Level: 12
                                    </div>
                                    <div class="col-lg-6 log">
                                        <textarea id="battle-log" >
                                            A battle has started.
                                        </textarea>
                                    </div>
                                    <div class="col-lg-3 currentPoke">
                                        <img src="img/Squirtle.png" class="img-responsive"/>
                                        Jimmy - Level: 10
                                    </div>
                                </div>
                                <div class="row">
                                    &nbsp;
                                </div>
                                <div class="row">
                                    <table class="table-responsive attacks">
                                        <tr>
                                            <td><input type="submit" value="Growl" id="attack1"/></td>
                                            <td><input type="submit" value="Tackle" id="attack2"/></td>
                                            <td><input type="submit" value="Vine Whip" id="attack3"/></td>
                                            <td><input type="submit" value="Poison Powder" id="attack4"/></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="row">
                                    &nbsp;
                                </div>
                                <div class="row">
                                    <div class="col-lg-6" style="text-align: center;">
                                        <h4><small>My team: </small></h1>
                                        <img class="img-responsive team-thumbnail" src="img/Bulbasaur.png" alt="" />
                                        <img class="img-responsive team-thumbnail" src="img/Bulbasaur.png" alt="" />
                                        <img class="img-responsive team-thumbnail" src="img/Bulbasaur.png" alt="" />
                                        <img class="img-responsive team-thumbnail" src="img/Bulbasaur.png" alt="" />
                                        <img class="img-responsive team-thumbnail" src="img/Bulbasaur.png" alt="" />
                                        <img class="img-responsive team-thumbnail" src="img/Bulbasaur.png" alt="" />
                                    </div>
                                    <div class="col-lg-6" style="text-align: center;">
                                        <h4><small>Opponent team: </small></h1>
                                        <img class="img-responsive team-thumbnail" src="img/Squirtle.png" alt="" />
                                        <img class="img-responsive team-thumbnail" src="img/Squirtle.png" alt="" />
                                        <img class="img-responsive team-thumbnail" src="img/Squirtle.png" alt="" />
                                        <img class="img-responsive team-thumbnail" src="img/Squirtle.png" alt="" />
                                        <img class="img-responsive team-thumbnail" src="img/Squirtle.png" alt="" />
                                        <img class="img-responsive team-thumbnail" src="img/Squirtle.png" alt="" />
                                    </div>
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
