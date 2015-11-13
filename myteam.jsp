<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Let's battle</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/templateGeneral.css" rel="stylesheet">
        <link rel="shortcut icon" href="img/icon.png">
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
                <c:if test='${sessionScope.user ne null}'>
                    <div class="row contenido">
                        <div class="col-md-2">
                            <form action="./setTeam" method="POST">
                            <input name="main" type="submit" value="Set As Main" class="btn2" style="margin-right:20px; width: 100%;">
                            <input name="secondary" type="submit" value="Set As Secondary" class="btn2" style="margin-right:20px; width: 100%;"><br />
                            <br />
                            <div class="scrollbar-inner dex">
                                <table class="table-responsive table-striped pokedexTable">
                                    <tbody>
                                    <c:forEach items="${requestScope.myPokes}" var="p">
                                        <tr>
                                            <td><input type="checkbox" name="thePokes" value="${p.idPokemon}"> #<fmt:formatNumber value="${p.idPokemon}" minIntegerDigits="3" /> - <c:out value="${p.nickname}" /></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            </form>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-8">
                            <div class="row user">
                                <c:if test='${sessionScope.user eq null}'>
                                    <a href="login.jsp">Login</a>
                                </c:if>
                                <c:if test='${sessionScope.user ne null}'>
                                    <img src="img/train/01.jpg"  /> ${sessionScope.username} | <a href="./logout">Logout</a>
                                </c:if>
                            </div>
                            <h1>Main team:</h1>
                            <div class="row team-def">
                                <c:forEach items="${requestScope.mainTeam}" var="p">
                                <div class="col-md-4 no-overgrow">
                                    <table class="table-responsive team-member">
                                        <tbody>
                                        <tr>
                                            <td width="70%">
                                                <img class="img-responsive thumbnail" src="${p.imagen}" alt=""/>
                                            </td>
                                            <td width="30%">
                                                ${p.nickname} <br> <br> lvl. ${p.level}
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                </c:forEach>
                                <div class="add-team-2">
                                    <img class="img-responsive" src="img/enLlamas.png" />
                                </div>
                            </div>
                            <div class="row">
                                &nbsp;
                            </div>
                            <h1>Secondary team:</h1>
                            <div class="row team-def">
                                <c:forEach items="${requestScope.fakeTeam}" var="p">
                                <div class="col-md-4">
                                    <table class="table-responsive team-member">
                                        <tbody>
                                        <tr>
                                            <td width="70%">
                                                <img class="img-responsive thumbnail" src="${p.imagen}" alt=""/>
                                            </td>
                                            <td width="30%">
                                                ${p.nickname} <br> <br> lvl. ${p.level}
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                </c:forEach>
                                <div class="add-team">
                                    <img class="img-responsive" src="img/enLlamas.png" />
                                </div>
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
