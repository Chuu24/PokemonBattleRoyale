import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddFriend extends HttpServlet{
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        try{
            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/index.jsp");

            if(disp!=null){
                    disp.forward(request,response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public void doPost(HttpServletRequest request,HttpServletResponse response){
        try{


            String Sidinvitador = request.getParameter("user");
            String Sidinvitado = request.getParameter("amigo");
            int status=0;
            int idinvitador = Integer.parseInt(Sidinvitador);
            int idinvitado = Integer.parseInt(Sidinvitado);
            boolean act = true;

            String usuario = getServletContext().getInitParameter("usuario");
            String password = getServletContext().getInitParameter("pass");

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/pokemons";
            Connection con = DriverManager.getConnection(url,usuario,password);

            Statement stat = con.createStatement();

            Statement stat1 = con.createStatement();
            stat.executeUpdate("INSERT INTO amigos(idinvitador, idinvitado, status) VALUES (\"" + idinvitador + "\",\"" + idinvitado + "\",\"" + status + "\");");
            stat1.close();
            stat.close();
            con.close();
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
            disp.forward(request,response);
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}