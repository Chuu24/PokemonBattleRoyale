import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AdInfo extends HttpServlet{
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
	    String pokemon = request.getParameter("nombrePokemon");
	   	        
	    String usuarioB = getServletContext().getInitParameter("usuario");
	    String passB = getServletContext().getInitParameter("pass");
	    Class.forName("com.mysql.jdbc.Driver");
	    String url = "jdbc:mysql://localhost/pokemons";
	    Connection con = DriverManager.getConnection(url,usuarioB,passB);
	    String busqueda = "false";
   
	    List<String> datos = new ArrayList<String>();
	        
	    Statement stat = con.createStatement();
	    String comando = "SELECT nombre from pokemons.pokemones  WHERE nombre LIKE '%"+pokemon+"%';";
	    System.out.println(comando);
	    ResultSet rs = stat.executeQuery(comando);
	    while(rs.next()){
		String nombrePok = rs.getString("nombre");
		System.out.println(nombrePok);
		datos.add(nombrePok);
	    }
	    busqueda = "true";
	    stat.close();
	    con.close();
	    request.setAttribute("busqueda",busqueda);
	    request.setAttribute("datos",datos);
	    RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
	    rd.forward(request, response);
	}catch(Exception e){
	    System.out.println(e);
	}
    }
}