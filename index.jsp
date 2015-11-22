<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Pokemon BR</title>
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
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/3.2.0/imagesloaded.pkgd.js"></script>
        <script src="js/masonry.js"></script>
        <script src="js/image-picker.js"></script>
        <script src="js/register.js"></script>
        
    </head>
    <body>
            <div class="row" id="header">
            	<div class="col-md-1"></div>
                <a href="index.jsp"><div class="col-md-2 pokedex selected1">
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
                <div class="col-md-1 profile">
                	&nbsp;<p>
                    <img src="img/profile.png"><br/>
                    <ul class="menu list-unstyled">
                        <li style="margin-top:-8px; margin-bottom:8px;">
                            <a href="./profile">Profile</a>
                            <ul>
                                <li class="drop"><a href="#">Messages</a></li>
                                <li class="drop"><a href="./friends">Friend list</a></li>
                                <li class="drop"><a href="#">Find user</a></li>
                                <li class="drop"><a href="#">Settings</a></li>
                                <li class="drop"><a href="#">Help</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="col-md-1"></div>
            </div>
<!----- AQU? SE ACABA EL HEADER. REPITO. AQU? SE ACABA EL HEADER. EL CONTENIDO EMPIEZA AQU?. ----->
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                <div class="row contenido">
                    <div class="col-md-2">
		      <form action="./AdInfo" method="POST">
                        <input type="text" class="search-bar" name="nombrePokemon"  maxlength="25" placeholder="Search" />
			<input type="submit" value="Submit"/>
		      </form>
		      <form action="./DesInfo" method="POST" id="myform" style="visibility:hidden;">
                        <input type="text" class="search-bar" name="nombrePokemonSel" id="nombrePokemonSel"  maxlength="25" placeholder="Search" />
                        <input type="submit" value="Submit"/>
                      </form>
                        <br />
                        <br />
                        <div class="scrollbar-inner dex">
                       <c:choose>
                       <c:when test='${requestScope.busqueda  eq "true"}'>
                       	<table class="table-responsive table-striped pokedexTable" onclick="myFun(event)">
                        <%Iterator itr;%>
						<%List datos = (List)request.getAttribute("datos");
			      			 for(itr = datos.iterator(); itr.hasNext();){%>
						<tr>
						  <td ><%=itr.next()%></td>
					 </tr>
						<%}%>
						</table> 
                       </c:when>
                       <c:otherwise>
                        <table class="table-responsive table-striped pokedexTable" onclick="myFun(event)">
                          <tbody>
                          	<%
                          	Connection con = null;
                          	try{
                          	Class.forName("com.mysql.jdbc.Driver");
           					String url = "jdbc:mysql://localhost/pokemons";
            				con = DriverManager.getConnection(url,"root","ldmpt24*");
							}catch(ClassNotFoundException e){
								e.printStackTrace();	
							}
							try{
							Statement Estamento = con.createStatement();
							ResultSet rs = Estamento.executeQuery("select nombre from pokemons.pokemones");
                          	%>           
                          	<%
                          		while(rs.next()){
                          		%>
                          		<tr>
                          		<td><%=rs.getString("nombre")%></td>	
                          		</tr>
								<%
                          		}
                          		%>
                          		<%
                       			}catch (Exception e){
                       				e.printStackTrace();
                       			}
                       		%>                        		
                          </tbody>
                        </table>
                       </c:otherwise>
                       </c:choose>                   
			</div>
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
                    <c:choose>
                    <c:when test='${requestScope.idPokemon  != null }'>
                    	<h1>#<%=request.getAttribute("idPokemon")%> - <%=request.getAttribute("nombrePokemon")%></h1> 
                    </c:when>
                    <c:otherwise>
                    	<h1>#005 Charmeleon</h1>                    
                    </c:otherwise>
                    </c:choose>
                        <div class="row">
                            <div class="col-md-6 box">
                                    <br/>
                                    <c:choose>
                                    <c:when test='${requestScope.sprite != null}'>
                                    	<img src="<%=request.getAttribute("sprite")%>" class="img-responsive pkmimg">
                                    </c:when>
                                    <c:otherwise>
                                    	<img src="img/pkm/005.png" class="img-responsive pkmimg">
                                    </c:otherwise>
                                    </c:choose>                           
                                    <p>
                                    <br/>
                                    <h4>Type</h4>
                                    <c:choose>
                                    <c:when test='${requestScope.busqueda1 eq "true"}'>
                                    	<%Iterator itr;%>
                                    	<%List datos = (List)request.getAttribute("datosTipos");
					   					for(itr = datos.iterator(); itr.hasNext();){%>
                                   	 	<img src="<%=itr.next()%>">
				     					<%}%>
                                    </c:when>
                                    <c:otherwise>
                                    <img src="img/type/fire.png">
                                    </c:otherwise>
                                    </c:choose>
				  					  <p>
                                    <br/>
                                    <h4>Strengths</h4>
                                    <c:choose>
                                    <c:when test='${requestScope.busqueda1 eq "true"}'>
                                    	<%Iterator itr;%>
                                    	<%List datos = (List)request.getAttribute("datosFortalezas");
                                    		for(itr = datos.iterator(); itr.hasNext();){%>
                                    			<img src="<%=itr.next()%>">
                                    		<%}%>
                                    </c:when>
                                    <c:otherwise>
                                    	<img src="img/type/grass.png"> <img src="img/type/ice.png"> <img src="img/type/bug.png"> <img src="img/type/steel.png">
                                    </c:otherwise>
                                    </c:choose>
                                    <p>
                                    <br/>
                                    <h4>Weaknesses</h4>
                                    <c:choose>
                                    <c:when test='${requestScope.busqueda1 eq "true"}'>
                                    	<%Iterator itr;%>
                                    	<%List datos = (List)request.getAttribute("datosDebilidades");
                                    		for(itr = datos.iterator(); itr.hasNext();){%>
                                    			<img src="<%=itr.next()%>">
                                    		<%}%>
                                    </c:when>
                                    <c:otherwise>
                                    	<img src="img/type/ground.png"> <img src="img/type/rock.png"> <img src="img/type/water.png">
                                    </c:otherwise>
                                    </c:choose>
                            		<p>
                                    <br/>
                                    <h4>Abilities</h4>
                                    <div class="scrollbar-inner noscrollbox">
                                    <c:choose>
                                    <c:when test='${requestScope.busqueda1  eq "true"}'>
                                     <table class="table-responsive table-striped" width="100%">
                                        <tbody>
                                            <%Iterator itr;%>
                                                <%List datos = (List)request.getAttribute("datosHabilidades");
                                                        for(itr = datos.iterator(); itr.hasNext();){%>
                                                <tr>
                                                         <td ><%=itr.next()%></td>
                                                </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                    </c:when>
                                    <c:otherwise>
                                    	<table class="table-responsive table-striped" width="100%">
                            				<tbody>
                                			<tr>
                                    			<td>Blaze</td>
                                			</tr>
                                			<tr>
                                    			<td>Solar Power*</td>
                                			</tr>
                                            <tr>
                                    			<td></td>
                                			</tr>
                                            <tr>
                                    			<td></td>
                                			</tr>
                                            <tr>
                                    			<td></td>
                                			</tr>
                                            <tr>
                                    			<td></td>
                                			</tr>
                                            <tr>
                                    			<td></td>
                                			</tr>
                            				</tbody>
                        				</table>
                                    </c:otherwise>
                                    </c:choose>                                     
				    </div>
                            </div>
                            <div class="col-md-6 box">
                            <div class="row">
                            <br/>
                            <c:choose>
                            <c:when test='${requestScope.busqueda1 eq "true"}'>
                            <%= request.getAttribute("datosDescr") %> <p></p>
                            </c:when>
                            <c:otherwise>
                            Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.
                            <p></p>
                            </c:otherwise>
                            </c:choose>			   
                            </br>
                            	<div id="info">
                                <table class="table-responsive">
                                	<tr class="bigtr">
                                    	<td class="bigtd">Height</td>
                                    	<c:choose>
                                    	<c:when test='${requestScope.busqueda1 eq "true"}'>
                                    		<td class="bigtd"><%= request.getAttribute("alturaEn")%></td>
                                        	<td class="bigtd"><%= request.getAttribute("altura")%></td>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<td class="bigtd">3'07'' </td>
                                        	<td class="bigtd">1.1 m</td>
                                    	</c:otherwise>
                                    	</c:choose>				
					</tr>
                                    <tr class="bigtr">
                                    	<td class="bigtd">Weight</td>
                                    	<c:choose>
                                    	<c:when test='${requestScope.busqueda1 eq "true"}'>
                                    		<td class="bigtd"><%= request.getAttribute("pesoEn")%></td>	
                                       		<td class="bigtd"><%= request.getAttribute("peso")%></td>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<td class="bigtd">41.9 lbs.</td>	
                                        	<td class="bigtd">19.0 kg</td>
                                    	</c:otherwise>
                                    	</c:choose>                                   
				    </tr>
                                    <tr class="bigtr">
                                    	<td class="bigtd">Gender</td>
                                    	<c:choose>
                                    	<c:when test='${requestScope.busqueda1  eq "true"}'>
                                    		<td class="bigtd"><img src="img/male.png"><%= request.getAttribute("radioGeneroH")%></td>
                                        	<td class="bigtd"><img src="img/female.png"><%= request.getAttribute("radiogeneroM")%></td>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<td class="bigtd"><img src="img/male.png"> 87%</td>
                                        	<td class="bigtd"><img src="img/female.png"> 12%</td>
                                    	</c:otherwise>
                                    	</c:choose>                                    
				   					 </tr>
                                </table>
                            	</div>
                                <p>
                                <br/>
                                <div id="stats">
								<table class="table-responsive">
                                	<tr class="medtr">
                                    	<td>HP</td>
                                        <td>
                                        	<c:choose>
                                        	<c:when test='${requestScope.busqueda1  eq "true"}'>
                                        		<%int HP = (Integer)request.getAttribute("hp");%>
												<%int hpIMG = (HP*10)/120;%>
												<%int hpNon = 10-hpIMG;%>
												<%for(int i=0;i<hpIMG;i++){%>
                                       				<img src="img/stat/hp.png">
												<%}%>
												<%for(int j = 0;j<hpNon;j++){%>
                                       			 	<img src="img/stat/none.png">
												<%}%>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<img src="img/stat/hp.png">
                                        		<img src="img/stat/hp.png">
                                       			<img src="img/stat/hp.png">
                                        		<img src="img/stat/none.png">
                                        		<img src="img/stat/none.png">
                                        		<img src="img/stat/none.png">
                                        		<img src="img/stat/none.png">
                                        		<img src="img/stat/none.png">
                                        		<img src="img/stat/none.png">
                                        		<img src="img/stat/none.png">
                                        	</c:otherwise>
                                        	</c:choose>					
										</td>
                                    </tr>
                                    <tr class="medtr">
                                    	<td>Attack</td>
                                        <td>
                                        <c:choose>
                                        <c:when test='${requestScope.busqueda1  eq "true"}'>
                                        	<%int Atq = (Integer)request.getAttribute("ataque");%>
                                        	<%int AtqIMG = (Atq*10)/120;%>
                                        	<%int AtqNon = 10-AtqIMG;%>
                                        	<%for(int i=0;i<AtqIMG;i++){%>
                                        		<img src="img/stat/attack.png">
                                        	<%}%>
                                        	<%for(int j = 0;j<AtqNon;j++){%>
                                       			<img src="img/stat/none.png">
                                        	<%}%>
                                        </c:when>
                                        <c:otherwise>
	                                        <img src="img/stat/attack.png">
	                                        <img src="img/stat/attack.png">
	                                        <img src="img/stat/attack.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
                                        </c:otherwise>
                                        </c:choose>                                       
					</td>
                                    </tr>
                                    <tr class="medtr">
                                    	<td>Defense</td>
                                        <td>
                                        <c:choose>
                                        <c:when test='${requestScope.busqueda1  eq "true"}'>
	                                        <%int Def = (Integer)request.getAttribute("defensa");%>
	                                        <%int DefIMG = (Def*10)/120;%>
	                                        <%int DefNon = 10-DefIMG;%>
	                                        <%for(int i=0;i<DefIMG;i++){%>
	                                        	<img src="img/stat/defense.png">
	                                        <%}%>
	                                        <%for(int j = 0;j<DefNon;j++){%>
	                                        	<img src="img/stat/none.png">
	                                        <%}%>
                                        </c:when>
                                        <c:otherwise>
                                        	<img src="img/stat/defense.png">
	                                        <img src="img/stat/defense.png">
	                                        <img src="img/stat/defense.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
                                        </c:otherwise>
                                        </c:choose>                                        
                                        </td>
                                    </tr>
                                    <tr class="medtr">
                                    	<td>Sp. Attack</td>
                                        <td>
                                        <c:choose>
                                        <c:when test='${requestScope.busqueda1  eq "true"}'>
                                        <%int ataqueEs = (Integer)request.getAttribute("ataqueEs");%>
                                        <%int ataqueIMG = (ataqueEs*10)/120;%>
                                        <%int ataqueNon = 10-ataqueIMG;%>
                                        <%for(int i=0;i<ataqueIMG;i++){%>
                                        	<img src="img/stat/spattack.png">
                                        <%}%>
                                        <%for(int j = 0;j<ataqueNon;j++){%>
                                        	<img src="img/stat/none.png">
                                        <%}%>
                                        </c:when>
                                        <c:otherwise>
	                                        <img src="img/stat/spattack.png">
	                                        <img src="img/stat/spattack.png">
	                                        <img src="img/stat/spattack.png">
	                                        <img src="img/stat/spattack.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
                                        </c:otherwise>
                                        </c:choose>                                        
                                        </td>
                                    </tr>
                                    <tr class="medtr">
                                    	<td>Sp. Defense</td>
                                        <td>
                                        <c:choose>
                                        <c:when test='${requestScope.busqueda1  eq "true"}'>
                                        	<%int defensaEs = (Integer)request.getAttribute("defensaEs");%>
	                                        <%int defensaIMG = (defensaEs*10)/120;%>
	                                        <%int defensaNon = 10-defensaIMG;%>
	                                        <%for(int i=0;i<defensaIMG;i++){%>
	                                        	<img src="img/stat/spdefense.png">
	                                        <%}%>
	                                        <%for(int j = 0;j<defensaNon;j++){%>
	                                        	<img src="img/stat/none.png">
	                                        <%}%>
                                        </c:when>
                                        <c:otherwise>
	                                        <img src="img/stat/spdefense.png">
	                                        <img src="img/stat/spdefense.png">
	                                        <img src="img/stat/spdefense.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png"> 
                                        </c:otherwise>
                                        </c:choose>                                                                             
                                        </td>
                                    </tr>
                                    <tr class="medtr">
                                    	<td class="bigtd">Speed</td>
                                        <td>
                                        <c:choose>
                                        <c:when test='${requestScope.busqueda1  eq "true"}'>
                                        	<%int velocidad = (Integer)request.getAttribute("velocidad");%>
	                                        <%int velocidadIMG = (velocidad*10)/120;%>
	                                        <%int velocidadNon = 10-velocidadIMG;%>
	                                        <%for(int i=0;i<velocidadIMG;i++){%>
	                                        	<img src="img/stat/hp.png">
	                                        <%}%>
	                                        <%for(int j = 0;j<velocidadNon;j++){%>
	                                        	<img src="img/stat/none.png">
	                                        <%}%>
                                        </c:when>
                                        <c:otherwise>
	                                        <img src="img/stat/speed.png">
	                                        <img src="img/stat/speed.png">
	                                        <img src="img/stat/speed.png">
	                                        <img src="img/stat/speed.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
	                                        <img src="img/stat/none.png">
                                        </c:otherwise>
                                        </c:choose>                                       
                                        </td>
                                    </tr>
                                </table>
                                </div>
                                <p>
                                    <br/>
                                    <h4>Attacks</h4>
                                    <div class="scrollbar-inner smallbox">
                                    <c:choose>
                                    <c:when test='${requestScope.busqueda1  eq "true"}'>
                                    	<table class="table-responsive table-striped" width="100%">
                            				<tbody>
                                			  <%Iterator itr;%>
                                                         <%List datos = (List)request.getAttribute("datosAtaques");
                                                                for(itr = datos.iterator(); itr.hasNext();){%>
                                                        <tr>
                                                          <td ><%=itr.next()%></td>
                                                        </tr>
                                                        <%}%>
                            				</tbody>
                        				</table>
                                    </c:when>
                                    <c:otherwise>
                                    	<table class="table-responsive table-striped" width="100%">
                            				<tbody>
                                			<tr>
                                    			<td>Scratch</td>
                                			</tr>
                                			<tr>
                                    			<td>Growl</td>
                                			</tr>
                                            <tr>
                                    			<td>Ember</td>
                                			</tr>
                                            <tr>
                                    			<td>Smokescreen</td>
                                			</tr>
                                            <tr>
                                    			<td>Dragon Rage</td>
                                			</tr>
                                            <tr>
                                    			<td>Scary Face</td>
                                			</tr>
                                            <tr>
                                    			<td>Fire Fang</td>
                                			</tr>
                                            <tr>
                                    			<td>Flame Burst</td>
                                			</tr>
                                            <tr>
                                    			<td>Slash</td>
                                			</tr>
                            				</tbody>
                        				</table>
                                    </c:otherwise>
                                    </c:choose>                                   
				    </div>
                            </div>
                            </div>
                            <!--- --->
                            <div class="col-md-12">
                            <br/>
							<h4>Evolution Chain</h4>
                            	<div id="evol">
                                <table class="table-responsive" align="center">
                                	<tr>
                                    	<c:choose>
                                    	<c:when test='${requestScope.sprite ne null}'>
                                    		<td width="150px"><img src="<%=request.getAttribute("sprite")%>"  class="evolimg"></td>	
                                    	</c:when>
                                    	<c:otherwise>
                                    		<td width="150px"><img src="img/pkm/004.png" class="evolimg"></td>	
                                    	</c:otherwise>
                                    	</c:choose>																		                                        
										<td width="100px"><img src="img/next.png"></td>
										<c:choose>
										<c:when test='${requestScope.primerEvol ne null}'>
											<td width="150px"><img src="<%=request.getAttribute("primerEvol")%>"  class="evolimg"></td>		
										</c:when>
										<c:otherwise>
											 <td width="150px"><img src="img/pkm/005.png" class="evolimg"></td>	
										</c:otherwise>
										</c:choose>                      									
                                        <td width="100px"><img src="img/next.png"></td>
                                        <c:choose>
                                        <c:when test='${requestScope.segundaEvol ne null}'>
                                        	<td width="150px"><img src="<%=request.getAttribute("segundaEvol")%>" class="evolimg"></td>
                                        </c:when>
                                        <c:otherwise>
                                        	<td width="150px"><img src="img/pkm/006.png" class="evolimg"></td>
                                        </c:otherwise>
                                        </c:choose>
                                        
                                    </tr>
                                    <tr>
								    <c:choose>
								    <c:when test='${requestScope.nombrePokemon ne null}'>
				                    	<td width="150px">#<%=request.getAttribute("idPokemon")%>  <%=request.getAttribute("nombrePokemon")%></td>
								    </c:when>
								    <c:otherwise>
								    	<td width="150px">#Primera Evolucion</td>
								    </c:otherwise>
								    </c:choose>
				                    <td width="100px"></td>
                                    <c:choose>
                                    <c:when test='${requestScope.nombrePrimeraEvol ne null}'>
                                    	<td width="150px">#<%=request.getAttribute("primeraEvolucionID")%> <%=request.getAttribute("nombrePrimeraEvol")%></td>
                                    </c:when>
                                    <c:otherwise>
                                    	<td width="150px">#Segunda Evolucion</td>
                                    </c:otherwise>
                                    </c:choose>
                                    <td width="100px"></td>
                                    <c:choose>
                                    <c:when test='${requestScope.nombrePrimeraEvol ne null}'>
                                    	<td width="150px">#<%=request.getAttribute("segundaEvolucionID")%> <%=request.getAttribute("nombreSegundaEvol")%></td>
                                    </c:when>
                                    <c:otherwise>
                                    	<td width="150px">#Tercera Evolucion </td>
                                    </c:otherwise>
                                    </c:choose>
                                    </tr>
                                </table>
                                </div>
                            </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                
                </div>
                &nbsp;<br>
                <p align="right"><font face="Segoe UI">
                Contacto | Aviso de Privacidad | Mapa del Sitio
                </font>
                </div>
                <div class="col-md-1"></div>
            </div>
    </body>
</html>
