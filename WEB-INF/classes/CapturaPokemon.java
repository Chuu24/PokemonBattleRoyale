import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class CapturaPokemon extends HttpServlet{
    
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
            
            String idUsuario = (String) request.getSession().getAttribute("user");
            String idPokemon = request.getParameter("idPoke");
            String nivel = request.getParameter("nivel");

            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery("SELECT * FROM pokemones WHERE idpokemon = " + idPokemon + ";");
            
            String urlImg = "";
            String nombre = "";
            String hp = "";
            
            while(rs.next()){
                nombre = rs.getString("nombre");
                urlImg = rs.getString("sprite");
                hp = rs.getString("hp");
            }

            Statement stat1 = con.createStatement();
            ResultSet rs1 = stat1.executeQuery("SELECT * FROM inventario WHERE idPerfil = " + idUsuario + ";");
            
            List<Producto> productos = new ArrayList<>();
            
            while(rs1.next()){
                int idProd = rs1.getInt("idObjeto");
                int cantidad = rs1.getInt("cantidad");

                Statement stat2 = con.createStatement();
                ResultSet rs2 = stat2.executeQuery("SELECT * FROM objetos WHERE idobjeto = \"" + idProd + "\" AND nombre LIKE \"%Ball\";");
                
                while(rs2.next()){
                    System.out.println("POOP");
                    int id = rs2.getInt("idobjeto");
                    String nom = rs2.getString("nombre");
                    String descripcion = rs2.getString("descripcion");
                    double precio = rs2.getDouble("precio");
                    double efecto = rs2.getDouble("valor_efecto");

                    productos.add(new Producto(id, nom, descripcion, cantidad, efecto));
                }
                
                stat2.close();
            }
            
            request.setAttribute("nombre", nombre);
            request.setAttribute("imagen", urlImg);
            request.setAttribute("nivel", nivel);
            request.setAttribute("hp", hp);
            request.setAttribute("idpokemon", idPokemon);
            request.setAttribute("balls", productos);
            
            stat.close();
            stat1.close();
            con.close();

            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/catchem.jsp");

            if(disp!=null){
                    disp.forward(request,response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}