import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Profile extends HttpServlet{
    
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
            ResultSet rs = stat.executeQuery("SELECT * FROM perfil WHERE idperfil=\"" + idUsuario + "\";");
            String name="";
            String user="";
            String bday="";
            String country="";
            String correo="";
            String img="";
            List<TeamPokemon> mainTeam = new ArrayList<>();
            
            while(rs.next()){
                name = rs.getString("nombre");
                user = rs.getString("username");
                bday = rs.getString("cumple");
                country = rs.getString("pais");
                correo = rs.getString("correo");
                img = rs.getString("sprite");
            }
                
            Statement stat1 = con.createStatement();
            ResultSet rs1 = stat1.executeQuery("SELECT principal, nivel, apodo, c.identrenador, c.idpokemon, sprite FROM pokemon_equipo AS pe, capturados AS c, pokemones AS p WHERE c.idpokemon = pe.idpokemon AND pe.identrenador = " + idUsuario + " AND c.identrenador = " + idUsuario + " AND c.idpokemon = p.idpokemon;");
            
            while(rs1.next()){
                int idPoke = rs1.getInt("idpokemon");
                int idTrai = rs1.getInt("identrenador");
                int nivel = rs1.getInt("nivel");
                String nickname = rs1.getString("apodo");
                String imagen = rs1.getString("sprite");
                int principal = rs1.getInt("principal");
                
                if(principal == 1){
                    mainTeam.add(new TeamPokemon(idPoke, idTrai, nivel, nickname, imagen));
                }
            }
            
            request.setAttribute("name", name);
            request.setAttribute("user", user);
            request.setAttribute("bday", bday);
            request.setAttribute("country", country);
            request.setAttribute("correo", correo);
            request.setAttribute("img", img);
            request.setAttribute("mainTeam", mainTeam);
            
            stat.close();
            stat1.close();
            con.close();

            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/profile.jsp");

            if(disp!=null){
                    disp.forward(request,response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}