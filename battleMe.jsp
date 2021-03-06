<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Friend List</title>
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
                <a href="./battle"><div class="col-md-1 friends selected7">
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
                <c:if test='${sessionScope.user ne null}'>
                    <div class="row contenido">
                    	<div class="containme">
                        	<h2 style="text-align:left; margin-left:12%;">Friends</h2>
                            <br>
							<div id="friend">
                                <table class="table-responsive" >
                                <tbody>
                                <c:forEach items="${requestScope.amigos}" var="f">
                                    <tr>
                                    <form action="./setBattle" method="POST">
                                        <table id="ftable">
                                	<tr>
                                    	<th></th>
                                        <th></th>
                                        <th style="text-align:center;">Name</th>
                                        <th style="text-align:center;">Age</th>
                                        <th style="text-align:center;">Sex</th>
                                        <th style="text-align:center;"></th>
                                    </tr>
                                	<tr>
                                    	<td width="10%"><img src="img/train/01.jpg"></td>
                                        <td width="10%"><c:out value="${f.userName}" /></td>
                                        <td width="40%"><c:out value="${f.nombre}" /></td>
                                        <td width="10%">21</td>
                                        <td width="10%">M</td>
                                        <td width="20%"><input type="hidden" value="${f.iD}" name="idOpon" />
                                            <input type="submit" value="Battle" /></td>
                                    </tr>
                                </table>
                                </form>
                                    </tr>
                                    
                                </c:forEach>
                                </tbody>
                                </table>
                                <form action="./OtroPerfil" method="POST" id="myForm" style="visibility:hidden"  >
                                        <input type="text" name="user" maxlength="20" size="10" id="pony" />
                                            <input type="submit" value="Ir" /></td>
                                </form>
                            </div>
                            <div id="searchf">
                            	<table width="100%">
                                	<tr>
                                    	<td width="20%"></td>
                                    	<td>User waiting to battle: </td>
                                        <td style="text-align:center;"></td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                            <div id="sresults">
                            <table class="table-responsive" >
                                <tbody>
                                <c:forEach items="${requestScope.found}" var="f">
                                    <form action="./setBattle" method="POST">
                                    <tr>
                                        <table id="ftable">
                                	<tr>
                                    	<th></th>
                                        <th></th>
                                        <th style="text-align:center;">Name</th>
                                        <th style="text-align:center;">Age</th>
                                        <th style="text-align:center;"></th>
                                    </tr>
                                	<tr>
                                    	<td width="10%"><img height="30px" width="18px" src="<c:out value="${f.sprite}" />"></td>
                                        <td width="20%"><c:out value="${f.username}" /></a></td>
                                        <td width="40%"><c:out value="${f.name}" /></a></td>
                                        <td width="15%"><c:out value="${f.edad}" /></td>
                                        <td width="15%"><input type="hidden" value="${f.idperfil}" name="idOpon" />
                                            <input type="submit" value="Join" /></td>
                                    </tr>
                                    </form>
                                </table>
                                    </tr>
                                    
                                </c:forEach>
                                </tbody>
                                </table>
                            </div>
                    	</div><!-- Contain me --->
                    </div><!--Row Contenido --->
                    </c:if>
                    <c:if test='${sessionScope.user eq null}'>
                        <script>
                            window.location = 'login.jsp';
                        </script>
                    </c:if>
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
