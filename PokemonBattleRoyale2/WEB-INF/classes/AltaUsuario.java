import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AltaUsuario extends HttpServlet{
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        try{
            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/login.jsp");

            if(disp!=null){
                    disp.forward(request,response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public void doPost(HttpServletRequest request,HttpServletResponse response){
        try{


            String bday = request.getParameter("bday");
            String country = request.getParameter("country");
            String name = request.getParameter("name");
            String user  = request.getParameter("user");
            String mail = request.getParameter("mail");
            String pass1 = request.getParameter("pass");
            String pass2 = request.getParameter("passConfirm");
            String sprite="img/chuu.png";
            boolean act = true;

            String usuario = getServletContext().getInitParameter("usuario");
            String password = getServletContext().getInitParameter("pass");

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/pokemons";
            Connection con = DriverManager.getConnection(url,usuario,password);

            Statement stat = con.createStatement();

            Statement stat1 = con.createStatement();

            if(!(name.equals("")) && !(user.equals("")) && !(mail.equals("")) && !(pass1.equals("")) && !(pass2.equals(""))){
                if(!(pass1.equals(pass2))){
                    act = false;
                }

                if(act){
                    stat.executeUpdate("INSERT INTO perfil(username, contrasena, sprite, correo, dinero, nombre, cumple, pais) VALUES (\"" + user + "\",\"" + pass1 + "\",\"" + sprite + "\",\"" + mail + "\",\" 2000 \",\"" + name + "\",\"" + bday + "\",\"" + country + "\");");
                }
            }else{
                act = false;
            }

            stat1.close();
            stat.close();
            con.close();

            if(act){
                RequestDispatcher disp = getServletContext().getRequestDispatcher("/login.jsp");

                if(disp != null){
                    disp.forward(request,response);
                }
            }else{
                RequestDispatcher disp = getServletContext().getRequestDispatcher("/register.jsp");

                if(disp != null){
                    disp.forward(request,response);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}