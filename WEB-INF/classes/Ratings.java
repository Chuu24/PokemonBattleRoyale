import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class Ratings extends HttpServlet{
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        try{
            String usuarioB = getServletContext().getInitParameter("usuario");
            String passB = getServletContext().getInitParameter("pass");

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/pokemons";
            Connection con = DriverManager.getConnection(url,usuarioB,passB);
            
            String idPokemon = request.getParameter("idPoke");
            String nivel = request.getParameter("nivel");

            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery("SELECT identrenador, nombre, count(identrenador) as cantidad FROM pokemons.capturados, pokemons.perfil WHERE identrenador=idperfil GROUP BY identrenador ORDER BY cantidad DESC LIMIT 20;");

            List<PersonaRankeada> rankeados = new ArrayList<>();
            int cont=0;
            while(rs.next()){
                cont++;
                int id = rs.getInt("identrenador");
                String nombre = rs.getString("nombre");
                int cantidad = rs.getInt("cantidad");
                
                rankeados.add(new PersonaRankeada(cont, id,  nombre, cantidad));
            }
            
            request.setAttribute("rankeados", rankeados);
            
            stat.close();
            con.close();

            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/ratings.jsp");

            if(disp!=null){
                    disp.forward(request,response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}