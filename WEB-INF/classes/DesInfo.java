import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class DesInfo extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response){
	try{

	    RequestDispatcher dips = getServletContext().getRequestDispatcher("/index.jsp");
	    if(dips != null){
		dips.forward(request,response);
	    }
	}catch(Exception e){
	    e.printStackTrace();
	}
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response){
	try{
	    String pokemon = request.getParameter("nombrePokemonSel");        
	    System.out.println("Aqui ando :"+pokemon);
	    String usuarioB = getServletContext().getInitParameter("usuario");
	    String passB = getServletContext().getInitParameter("pass");
	    Class.forName("com.mysql.jdbc.Driver");
	    String url = "jdbc:mysql://localhost/pokemons";
	    Connection con = DriverManager.getConnection(url,usuarioB,passB);

	    String busqueda1 = "false";
   
	    List<String> datosHabilidades = new ArrayList<String>();
	    List<String> datosAtaques = new ArrayList<String>();    
	    List<String> datosTipos = new ArrayList<String>();
	    String datosDescr  = "";
	    int hp = 0;
	    int ataque = 0;
	    int defensa = 0;
	    int ataqueEs = 0;
	    int defensaEs = 0;
	    int velocidad = 0;
	    String sprite = "";
	    String altura = "";
	    String peso = "";
	    String radiogeneroM = "";
	    String radioGeneroH = "";
	    String pesoEn = "";
	    String alturaEn = "";
	    String pokemonEvolucion = "";
	    String pokemonEvolucionEvol = "";
            String nombrePokemon = "";
            String idPokemon = "";

	    Statement stat = con.createStatement();
	    String comando = "SELECT habilidades.nombre FROM pokemones,pokemon_habilidad,habilidades WHERE pokemons.pokemones.nombre = '"+pokemon+"' AND pokemones.idpokemon = pokemon_habilidad.idpokemon AND pokemons.pokemon_habilidad.idhabilidad = pokemons.habilidades.idhabilidad;";
	    ResultSet rs = stat.executeQuery(comando);
	    while(rs.next()){
		String habilidadesPok = rs.getString("habilidades.nombre");
		System.out.println(habilidadesPok);
		datosHabilidades.add(habilidadesPok);
	    }
	    System.out.println(datosHabilidades);
	    Statement stat1 = con.createStatement();
	    String comando2 = "SELECT ataques.nombre FROM pokemones,pokemon_ataque,ataques WHERE pokemons.pokemones.nombre = '"+pokemon+"' AND pokemones.idpokemon = pokemon_ataque.idpokemon AND pokemons.pokemon_ataque.idataque = pokemons.ataques.idataque;";
	    ResultSet rs1 = stat1.executeQuery(comando2);
	    while(rs1.next()){
		String ataquesPok = rs1.getString("ataques.nombre");
		datosAtaques.add(ataquesPok);
	    }
	    Statement stat2 = con.createStatement();
	    String comando3 = "SELECT tipos.path FROM pokemones,pokemon_tipo,tipos WHERE pokemons.pokemones.nombre = '"+pokemon+"' AND pokemones.idpokemon = pokemon_tipo.idpokemon AND pokemons.pokemon_tipo.idtipo = pokemons.tipos.idtipo;";
	    ResultSet rs2 = stat2.executeQuery(comando3);
	    while(rs2.next()){
		String tiposPok = rs2.getString("tipos.path");
		datosTipos.add(tiposPok);
	    }
	    Statement stat3 = con.createStatement();
	    String comando4 = "SELECT descripcion FROM pokemones WHERE pokemones.nombre = '"+pokemon+"';";
	    ResultSet rs3 = stat3.executeQuery(comando4);
	    while(rs3.next()){
		 datosDescr = rs3.getString("descripcion");
	    }
	    Statement stat4 = con.createStatement();
	    String comando5 = "SELECT sprite from pokemones WHERE pokemones.nombre  = '"+pokemon+"';";
	    ResultSet rs4 = stat4.executeQuery(comando5);
	    while(rs4.next()){
		sprite = rs4.getString("sprite");
	    }
	    System.out.println("sprite: "+sprite);
	    Statement stat5 = con.createStatement();
	    String comando6 = "SELECT hp,ataque,defensa,ataqueEs,defensaEs,velocidad from pokemones WHERE nombre = '"+pokemon+"';";
	    ResultSet rs5 = stat5.executeQuery(comando6);
	    while(rs5.next()){
		hp = rs5.getInt("hp");
		ataque = rs5.getInt("ataque");
		defensa = rs5.getInt("defensa");
		ataqueEs = rs5.getInt("ataqueEs");
		defensaEs = rs5.getInt("defensaEs");
		velocidad = rs5.getInt("velocidad");
	    }
	    System.out.println("Stats :"+hp+ataque+defensa+ataqueEs+defensaEs+velocidad);
	    Statement stat6 = con.createStatement();
	    String comando7 = "SELECT altura,peso,radiogeneroM,pesoEn,alturaEn,radioGeneroH, nombre, idpokemon FROM pokemons.pokemones WHERE nombre= '"+pokemon+"';";
	    ResultSet rs6 = stat6.executeQuery(comando7);
	    while(rs6.next()){
		altura = rs6.getString("altura");
		peso = rs6.getString("peso");
		radiogeneroM = rs6.getString("radiogeneroM");
		pesoEn = rs6.getString("pesoEn");
		alturaEn = rs6.getString("alturaEn");
		radioGeneroH = rs6.getString("radioGeneroH");
                nombrePokemon = rs6.getString("nombre");
                idPokemon = rs6.getString("idpokemon");
	    }
	    System.out.println("Char :"+altura+" "+peso+" "+radiogeneroM+" "+pesoEn+" "+alturaEn+" "+radioGeneroH);
	    
	    //Primera Evolucion 
	    Statement stat7 = con.createStatement();
	    String comando8 = "SELECT pokemones.sprite FROM pokemones,(SELECT pokemon_evolucion.idevolucion FROM pokemones,pokemon_evolucion WHERE pokemones.nombre = '"+pokemon+"' AND pokemones.idpokemon = pokemon_evolucion.idpokemonpre)AS PokemonEv WHERE pokemones.idpokemon = PokemonEv.idevolucion;";
	    ResultSet rs7 = stat7.executeQuery(comando8);
	    while(rs7.next()){
		pokemonEvolucion = rs7.getString("pokemones.sprite");
	    }
	    //Segunda Evolucion
	    Statement stat8 = con.createStatement();
	    String comando9 = "SELECT pokemones.sprite FROM pokemones,(SELECT pokemon_evolucion.idevolucion FROM pokemon_evolucion,(SELECT pokemones.nombre,pokemones.sprite,PokemonEv.idevolucion FROM pokemones,(SELECT pokemon_evolucion.idevolucion FROM pokemones,pokemon_evolucion WHERE pokemones.nombre = '"+pokemon+"' AND pokemones.idpokemon = pokemon_evolucion.idpokemonpre)AS PokemonEv WHERE pokemones.idpokemon = PokemonEv.idevolucion)AS PokemonPrimeraEV WHERE PokemonPrimeraEv.idevolucion = pokemon_evolucion.idpokemonpre)AS YAMERO WHERE pokemones.idpokemon = YAMERO.idevolucion;";
	    ResultSet rs8 = stat8.executeQuery(comando9);
	    while(rs8.next()){
		pokemonEvolucionEvol = rs8.getString("pokemones.sprite");
	    }
	    System.out.println("Segunda Evolucion: "+pokemonEvolucionEvol);
	    busqueda1 = "true";
	    stat.close();
	    con.close();
	    request.setAttribute("busqueda1",busqueda1);
	    request.setAttribute("primerEvol",pokemonEvolucion);
	    request.setAttribute("segundaEvol",pokemonEvolucionEvol);
	    request.setAttribute("pokemonEvolucion",pokemonEvolucion);
	    request.setAttribute("sprite",sprite);
	    request.setAttribute("hp",hp);
	    request.setAttribute("ataque",ataque);
	    request.setAttribute("defensa",defensa);
	    request.setAttribute("ataqueEs",ataqueEs);
	    request.setAttribute("defensaEs",defensaEs);
	    request.setAttribute("velocidad",velocidad);
	    request.setAttribute("altura",altura);
	    request.setAttribute("peso",peso);
	    request.setAttribute("radiogeneroM",radiogeneroM);
	    request.setAttribute("pesoEn",pesoEn);
	    request.setAttribute("alturaEn",alturaEn);
	    request.setAttribute("radioGeneroH",radioGeneroH);
	    request.setAttribute("datosHabilidades",datosHabilidades);
	    request.setAttribute("datosAtaques",datosAtaques);
	    request.setAttribute("datosTipos",datosTipos);
	    request.setAttribute("datosDescr",datosDescr);
	    request.setAttribute("nombrePokemon",nombrePokemon);
	    request.setAttribute("idPokemon",idPokemon);
	    RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
	    rd.forward(request, response);
	}catch(Exception e){
	    System.out.println(e);
	}
    }
}