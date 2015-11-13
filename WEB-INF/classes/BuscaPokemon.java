import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class BuscaPokemon extends HttpServlet{
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        try{
            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/explore.jsp");

            if(disp!=null){
                    disp.forward(request,response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        try{
            String usuarioB = getServletContext().getInitParameter("usuario");
            String passB = getServletContext().getInitParameter("pass");

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/pokemons";
            Connection con = DriverManager.getConnection(url,usuarioB,passB);
            
            double latitud = Double.parseDouble(request.getParameter("latitud"));
            double longitu = Double.parseDouble(request.getParameter("longitud"));

            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery("SELECT * FROM pokemones WHERE latitud < " + (latitud + 0.5) + ""
                    + "AND latitud > " + (latitud - 0.5) + ""
                    + "AND longitud < " + (longitu + 2) + ""
                    + "AND longitud > " + (longitu - 2) + ";");

            List<Pokemon> pokemons = new ArrayList<>();
            
            while(rs.next()){
                int id = rs.getInt("idpokemon");
                String nombre = rs.getString("nombre");
                String descripcion = rs.getString("descripcion");
                int nivel = (int) ((Math.random() * 100) + 1);
                
                pokemons.add(new Pokemon(id, nombre, descripcion, nivel));
            }
            
            PrintWriter respuesta = response.getWriter();

            if(pokemons.isEmpty()){
                respuesta.print("No se encontro nada.");
            }else{
                respuesta.print("{\"pokemons\": " + pokemons + "}");
            }
            
            stat.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}