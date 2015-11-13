import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class Pokecenter extends HttpServlet{
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        try{
            String usuarioB = getServletContext().getInitParameter("usuario");
            String passB = getServletContext().getInitParameter("pass");

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/pokemons";
            Connection con = DriverManager.getConnection(url,usuarioB,passB);
            
            String idUsuario = (String) request.getSession().getAttribute("user");
            
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery("SELECT * FROM capturados WHERE identrenador = " + idUsuario + ";");

            List<CatchedPokemon> myPokes = new ArrayList<>();
            List<TeamPokemon> mainTeam = new ArrayList<>();
            
            while(rs.next()){
                int idPoke = rs.getInt("idpokemon");
                int idTrai = rs.getInt("identrenador");
                int nivel = rs.getInt("nivel");
                int health = rs.getInt("health");
                String nickname = rs.getString("apodo");
                
                myPokes.add(new CatchedPokemon(idPoke, idTrai, nivel, nickname, health));
            }
                
            Statement stat1 = con.createStatement();
            ResultSet rs1 = stat1.executeQuery("SELECT principal, nivel, apodo, health, c.identrenador, c.idpokemon, sprite FROM pokemon_equipo AS pe, capturados AS c, pokemones AS p WHERE c.idpokemon = pe.idpokemon AND pe.identrenador = " + idUsuario + " AND c.identrenador = " + idUsuario + " AND c.idpokemon = p.idpokemon;");
            
            while(rs1.next()){
                int idPoke = rs1.getInt("idpokemon");
                int idTrai = rs1.getInt("identrenador");
                int nivel = rs1.getInt("nivel");
                int health = rs1.getInt("health");
                String nickname = rs1.getString("apodo");
                String imagen = rs1.getString("sprite");
                int principal = rs1.getInt("principal");
                
                if(principal == 1){
                    mainTeam.add(new TeamPokemon(idPoke, idTrai, nivel, health, nickname, imagen));
                }
            }
            
            request.setAttribute("myPokes", myPokes);
            request.setAttribute("mainTeam", mainTeam);
            
            stat.close();
            stat1.close();
            con.close();

            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/pokecenter.jsp");

            if(disp!=null){
                    disp.forward(request,response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        doGet(request, response);
    }
}