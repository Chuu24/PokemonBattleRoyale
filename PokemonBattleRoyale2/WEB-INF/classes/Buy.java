import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class Buy extends HttpServlet{
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        try{
            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/pokemart");

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
            String idObj = request.getParameter("idProducto");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = 0;
            String res = "";
            try{
                quantity = Integer.parseInt(request.getParameter("cantidad"));
            }catch(Exception e){
                res = "Invalid quantity input.";
            }

            if(quantity < 0){
                quantity = 0;
                res = "Invalid quantity input.";
            }
            
            int money = 0;
            
            Statement stat1 = con.createStatement();
            ResultSet rs1 = stat1.executeQuery("SELECT dinero FROM perfil WHERE idperfil = " + idUsuario + ";");
            
            while(rs1.next()){
                money = rs1.getInt("dinero");
            }
            
            stat1.close();
            
            if((price * quantity) > money){
                res = "You don't have enough money.";
            }else{
                Statement stat2 = con.createStatement();
                ResultSet rs2 = stat2.executeQuery("SELECT * FROM inventario WHERE idPerfil = " + idUsuario + " AND idObjeto = " + idObj + ";");
                if(rs2.next()){
                    int cantidad = rs2.getInt("cantidad");
                    cantidad += quantity;
                    stat2.executeUpdate("UPDATE inventario SET cantidad=" + cantidad + " WHERE idPerfil = " + idUsuario +" AND idObjeto = " + idObj +";");
                }else{
                    stat2.executeUpdate("INSERT INTO inventario VALUES (\"" + idUsuario + "\",\"" + idObj + "\",\"" + quantity + "\");");
                }
                money = (int) (money - (price * quantity));
                stat2.executeUpdate("UPDATE perfil SET dinero=" + money + " WHERE idPerfil = " + idUsuario + ";");
                if(quantity != 0){
                    res="Successful purchease.";
                }
                
                stat2.close();
            }
            
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
            request.setAttribute("res", res);
            
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