import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class Tienda extends HttpServlet{
    
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
            ResultSet rs = stat.executeQuery("SELECT * FROM objetos;");

            List<Producto> productos = new ArrayList<>();
            
            while(rs.next()){
                int id = rs.getInt("idobjeto");
                String nombre = rs.getString("nombre");
                String descripcion = rs.getString("descripcion");
                double precio = rs.getDouble("precio");
                double efecto = rs.getDouble("valor_efecto");
                
                productos.add(new Producto(id, nombre, descripcion, precio, efecto));
            }
            
            request.setAttribute("productos", productos);
            
            stat.close();
            con.close();

            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/pokemart.jsp");

            if(disp!=null){
                    disp.forward(request,response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}