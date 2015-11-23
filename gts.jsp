<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Global Trading Station</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="shortcut icon" href="img/icon.png">
        
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/jquery.scrollbar.css" rel="stylesheet">
        <link href="css/templateGeneral.css" rel="stylesheet">
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
                <a href="gts.jsp"><div class="col-md-1 gts selected5">
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
            <li class="drop"><a href="#">Friend list</a></li>
            <li class="drop"><a href="#">Find user</a></li>
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
                    	<div class="containme" style="height:500px; margin-bottom:30px;">
                            <h3>Global Trading Station</h3>
                            <br>
							<div id="gts">
                                <table id="ftable">
                                	<tr>
                                    	<th></th>
                                        <th></th>
                                        <th style="text-align:center;">Name</th>
                                        <th style="text-align:center;">Offers</th>
                                        <th style="text-align:center;">Wants</th>
                                        <th></th>
                                    </tr>
                                	<tr>
                                    	<td width="5%"><img src="img/train/m5.png" height="40px" width="24px"></td>
                                        <td width="10%">cantucky</td>
                                        <td width="35%">Daniel Garc&iacute;a</td>
                                        <td width="20%"><img src="img/sprite/381.gif" width="52" height="40"></td>
                                        <td width="20%"><img src="img/sprite/150.gif" width="52" height="40"></td>
                                        <td width="10%"><a href=""><img src="img/trade.png"></a></td>
                                    </tr>
                                </table>
                                <hr style="
                                height:3px; 
                                margin-left:10px; 
                                margin-right:10px; 
                                color:#0CF;
                                background-color:#0CF;
                                -webkit-border-radius: 3px;
    							-moz-border-radius: 3px;
    							border-radius: 3px;
                                ">
                                <table id="ftable">
                                	<tr>
                                    	<th></th>
                                        <th></th>
                                        <th style="text-align:center;">Name</th>
                                        <th style="text-align:center;">Offers</th>
                                        <th style="text-align:center;">Wants</th>
                                        <th></th>
                                    </tr>
                                	<tr>
                                    	<td width="5%"><img src="img/train/f6.png" height="40px" width="24px"></td>
                                        <td width="10%">infiernanda</td>
                                        <td width="35%">Fernanda Montiel</td>
                                        <td width="20%"><img src="img/sprite/025.gif" width="40" height="40"></td>
                                        <td width="20%"><img src="img/sprite/235.gif" width="45" height="40"></td>
                                        <td width="10%"><a href=""><img src="img/trade.png"></a></td>
                                    </tr>
                                </table>
                                <hr style="
                                height:3px; 
                                margin-left:10px; 
                                margin-right:10px; 
                                color:#0CF;
                                background-color:#0CF;
                                -webkit-border-radius: 3px;
    							-moz-border-radius: 3px;
    							border-radius: 3px;
                                ">
                                <table id="ftable">
                                	<tr>
                                    	<th></th>
                                        <th></th>
                                        <th style="text-align:center;">Name</th>
                                        <th style="text-align:center;">Offers</th>
                                        <th style="text-align:center;">Wants</th>
                                        <th></th>
                                    </tr>
                                	<tr>
                                    	<td width="5%"><img src="img/train/m3.png" height="40px" width="24px"></td>
                                        <td width="10%">chiquitas</td>
                                        <td width="35%">Zdenek Tronis</td>
                                        <td width="20%"><img src="img/sprite/267.gif" height="40px" width="50px"></td>
                                        <td width="20%"><img src="img/sprite/350.gif" height="40px" width="45px"></td>
                                        <td width="10%"><a href=""><img src="img/trade.png"></a></td>
                                    </tr>
                                </table>
                                <hr style="
                                height:3px; 
                                margin-left:10px; 
                                margin-right:10px; 
                                color:#0CF;
                                background-color:#0CF;
                                -webkit-border-radius: 3px;
    							-moz-border-radius: 3px;
    							border-radius: 3px;
                                ">
                                <table id="ftable">
                                	<tr>
                                    	<th></th>
                                        <th></th>
                                        <th style="text-align:center;">Name</th>
                                        <th style="text-align:center;">Offers</th>
                                        <th style="text-align:center;">Wants</th>
                                        <th></th>
                                    </tr>
                                	<tr>
                                    	<td width="5%"><img src="img/train/f2.png" height="40px" width="24px"></td>
                                        <td width="10%">pugtle</td>
                                        <td width="35%">Sebasti&aacute;n Chimal</td>
                                        <td width="20%"><img src="img/sprite/547.gif" height="40px" width="38px"></td>
                                        <td width="20%"><img src="img/sprite/302.gif" height="40px" width="35px"></td>
                                        <td width="10%"><a href=""><img src="img/trade.png"></a></td>
                                    </tr>
                                </table>
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
                	Contact us | About us | Privacy Policy | Site Map
                	</font>
                    </div>
                	<div class="col-md-1"></div>
				</div>
    </body>
</html>
