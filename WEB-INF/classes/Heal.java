import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class Heal extends HttpServlet{
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        try{
            String usuarioB = getServletContext().getInitParameter("usuario");
            String passB = getServletContext().getInitParameter("pass");

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/pokemons";
            Connection con = DriverManager.getConnection(url,usuarioB,passB);
            
            String idUsuario = (String) request.getSession().getAttribute("user");
                
            Statement stat1 = con.createStatement();
            Statement stat2 = con.createStatement();
            ResultSet rs1 = stat1.executeQuery("SELECT principal, nivel, apodo, health, c.identrenador, c.idpokemon, sprite, hp FROM pokemon_equipo AS pe, capturados AS c, pokemones AS p WHERE c.idpokemon = pe.idpokemon AND pe.identrenador = " + idUsuario + " AND c.identrenador = " + idUsuario + " AND c.idpokemon = p.idpokemon;");
            
            while(rs1.next()){
                int idPoke = rs1.getInt("idpokemon");
                int idTrai = rs1.getInt("identrenador");
                int nivel = rs1.getInt("nivel");
                int health = rs1.getInt("health");
                String nickname = rs1.getString("apodo");
                String imagen = rs1.getString("sprite");
                int principal = rs1.getInt("principal");
                
                if(principal == 1){
                    int hp = rs1.getInt("hp");
                    int newHp = (int) Math.ceil(((double) hp * 2.0) * ((double) nivel / 100.0) + 5.0);
                    stat2.executeUpdate("UPDATE capturados SET health = " + newHp + " WHERE idpokemon = "  + idPoke + " AND identrenador = " + idTrai + ";");
                }
            }
            
            stat2.close();
            stat1.close();
            con.close();

            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/pokecenter");

            if(disp!=null){
                    disp.forward(request,response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        doGet(request, response);
    }
}