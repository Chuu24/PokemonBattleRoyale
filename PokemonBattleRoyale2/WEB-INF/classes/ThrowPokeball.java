import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class ThrowPokeball extends HttpServlet{
    
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
            String idPok = request.getParameter("idPokemon");
            String idObj = request.getParameter("idProducto");
            String nivel = request.getParameter("nivel");
            double canti = Double.parseDouble(request.getParameter("cantidad"));
            double effect = Double.parseDouble(request.getParameter("efecto"));

            Statement stat = con.createStatement();
            
            stat.executeUpdate("UPDATE inventario SET cantidad=" + (int) (canti - 1) + " WHERE idPerfil = " + idUsuario + " AND idObjeto = " + idObj +";");

            double cRate = Math.random() * effect;
            
            stat.close();

            if(cRate <= 0.5){
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
                
                String res = "Shoot! It was so close too!";

                request.setAttribute("imagen", request.getParameter("imagen"));
                request.setAttribute("nombre", request.getParameter("nombre"));
                request.setAttribute("nivel", nivel);
                request.setAttribute("balls", productos);
                request.setAttribute("idpokemon", idPok);
                
                stat1.close();
                con.close();
                
                RequestDispatcher disp =  getServletContext().getRequestDispatcher("/catchem.jsp");

                if(disp!=null){
                        disp.forward(request,response);
                }
            }else{
                con.close();
                
                request.setAttribute("idpokemon", idPok);
                request.setAttribute("imagen", request.getParameter("imagen"));
                request.setAttribute("nombre", request.getParameter("nombre"));
                request.setAttribute("nivel", nivel);
                
                RequestDispatcher disp =  getServletContext().getRequestDispatcher("/nickname.jsp");

                if(disp!=null){
                        disp.forward(request,response);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}