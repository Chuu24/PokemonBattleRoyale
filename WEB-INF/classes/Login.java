import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Login extends HttpServlet{
    
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
            HttpSession sesion = request.getSession(true);

            String usuario = request.getParameter("user");
            String contra = request.getParameter("pass");

            boolean act;
            String ingreso = "";
            String redireccion = "";

            String usuarioB = getServletContext().getInitParameter("usuario");
            String passB = getServletContext().getInitParameter("pass");

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/pokemons";
            Connection con = DriverManager.getConnection(url,usuarioB,passB);
            Statement stat = con.createStatement();

            if(!(usuario.equals("")) && !(contra.equals(""))){
                ResultSet rs = stat.executeQuery("SELECT idperfil, username, contrasena, sprite, dinero  FROM perfil WHERE username=\"" + usuario + "\";");

                if(rs.next()){
                    String user = rs.getString("username");
                    String pass = rs.getString("contrasena");
                    String idC = rs.getString("idperfil");
                    String sprite = rs.getString("sprite");
                    int money=rs.getInt("dinero");

                    if(user.equals(usuario) && pass.equals(contra)){
                        sesion.setAttribute("user", idC);
                        sesion.setAttribute("username", user);
                        act = true;
                        ingreso = "";
                        redireccion = "/index.jsp";
                    }else{
                        act = false;
                        ingreso = "La combinacion usuario/contrasena es incorrecta.";
                    }
                }else{

                    act = false;
                    ingreso = "Usuario inexistente.";
                }
            }else{
                act = false;
                ingreso = "No ha llenado todos los campos necesarios para ingresar al sistema.";
            }

            stat.close();
            con.close();

            request.setAttribute("ingreso", ingreso);

            if(act){
                RequestDispatcher disp = getServletContext().getRequestDispatcher(redireccion);

                if(disp != null){
                    disp.forward(request,response);
                }
            }else{
                RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");

                if(disp != null){
                    disp.forward(request,response);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}