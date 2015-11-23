import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Battlers extends HttpServlet{
    
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
            ResultSet rs = stat.executeQuery("SELECT * FROM amigos WHERE idinvitador=\"" + idUsuario + "\";");
            int idAmigo=0;
            String name="";
            String user="";
            int status=0;
            String statStr;
            List<Amigo> listaAmigos = new ArrayList<>();
            
            while(rs.next()){
                status = rs.getInt("status");
                idAmigo=rs.getInt("idinvitado");
                Statement stattemp1 = con.createStatement();
                ResultSet rstemp1 = stattemp1.executeQuery("SELECT * FROM perfil WHERE idperfil=\"" + idAmigo + "\";");
                while (rstemp1.next()){ 
                    name = rstemp1.getString("nombre");
                    user = rstemp1.getString("username");
                }
                if(status == 1){
                    statStr="Accepted";
                    listaAmigos.add(new Amigo(name, user, idAmigo, statStr));
                }
                stattemp1.close();
            }
                
            Statement stat1 = con.createStatement();
            ResultSet rs1 = stat1.executeQuery("SELECT * FROM amigos WHERE idinvitado=\"" + idUsuario + "\";");
            
            while(rs1.next()){
                status = rs1.getInt("status");
                idAmigo=rs1.getInt("idinvitador");
                Statement stattemp2 = con.createStatement();
                ResultSet rstemp2 = stattemp2.executeQuery("SELECT * FROM perfil WHERE idperfil=\"" + idAmigo + "\";");
                while (rstemp2.next()){ 
                    name = rstemp2.getString("nombre");
                    user = rstemp2.getString("username");
                }
                 if(status == 1){
                    statStr="Accepted";
                    listaAmigos.add(new Amigo(name, user, idAmigo, statStr));
                }
                stattemp2.close();
            }
            
            List<Usuario> listaUsuarios = new ArrayList<>();

            Statement stat2 = con.createStatement();
            ResultSet rs2 = stat2.executeQuery("SELECT * FROM oponentes AS o, perfil AS p WHERE p.idPerfil = o.idprincipal AND idoponente  = " + idUsuario + ";");
            
            while(rs2.next()){
                int idFind = rs2.getInt("idperfil");
                String findName = rs2.getString("nombre");
                String findUser = rs2.getString("username");
                String findSprite = rs2.getString("sprite");
                String findMail = rs2.getString("correo");
                Statement stat3 = con.createStatement();
                ResultSet rs3 = stat3.executeQuery("SELECT DATEDIFF(NOW(), cumple) FROM pokemons.perfil WHERE idperfil = '" + idFind + "'");
                rs3.next();
                int findEdad=rs3.getInt("DATEDIFF(NOW(), cumple)");
                findEdad/=365;
                stat3.close();
                listaUsuarios.add(new Usuario(findUser, findName, idFind, findSprite, findMail, findEdad));
            }
            
            request.setAttribute("found", listaUsuarios);
            request.setAttribute("display", 1);
            request.setAttribute("amigos", listaAmigos);
            
            stat.close();
            stat1.close();
            stat2.close();
            con.close();

            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/battleMe.jsp");

            if(disp!=null){
                    disp.forward(request,response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}