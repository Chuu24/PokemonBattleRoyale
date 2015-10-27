import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Adquiririnformacion extends HttpServlet{
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
    public void goPost(HttpServletRequest request, HttpServletResponse response){
	try{
	    String pokemon = request.getParameter("nombrePokemon");
	    String region = request.getParameter("regionPokemon");
	    String generacion = getServletContext().getInitParameter("generacionPokemon");
	    
	    
	    String usuarioB = getServletContext().getInitParameter("usuario");
	    String passB = getServletContext().getInitParameter("pass");
	    Class.forName("com.mysql.jdbc.Driver");
	    String url = "jdbc:mysql://localhost/pokemons";
	    Connection con = DriverManager.getConnection(url,usuarioB,passB);
	   
	    List<String> datos = new ArrayList<String>();
	    
	    Statement stat = con.createStatement();
	    
	    if(!pokemon.equals(null) && region.equals(null) && generacion.equals(null)){ //Buscar por Nombre de Pokemon 
		String comando = "SELECT nombre from pokemons.pokemones  AS a WHERE a.nombre == '"+pokemon+"';";
		ResultSet rs = stat.executeQuery(comando);
		while(rs.next()){
		    String nombrePok = rs.getString("nombre");
		    datos.add(nombrePok);
		}
		stat.close();
		con.close();
	    }else{
		if(!region.equals(null) && region.equals(null) && generacion.equals(null)){ //Buscar por region 
		    String comando = "SELECT nombre from pokemons.pokemones AS b WHERE b.generacion == '"+region+"';";
		    ResultSet rs = stat.executeQuery(comando);
		    while(rs.next()){
			String nombrePok = rs.getString("nombre");
			datos.add(nombrePok);
		    }
		    stat.close();
		    con.close();
		}else{ //Buscar por generacion 
		    String comando = "SELECT nombre from pokemons.pokemones AS c WHERE c.region == '"+generacion+"';";
		    ResultSet rs = stat.executeQuery(comando);
		    while(rs.next()){
			String nombrePok = rs.getString("nombre");
			datos.add(nombrePok);
		    }
		    stat.close();
		    con.close();
		}
	    }
	    request.setAttribute("datos",datos);
	    RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
	    rd.forward(request, response);
	}catch(Exception e){
	    System.out.println(e);
	}
    }
}