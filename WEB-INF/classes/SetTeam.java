import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class SetTeam extends HttpServlet{
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        try{
            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/myteam");

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
            String[] pokemons = request.getParameterValues("thePokes");
            String res = "";
            System.out.println(request.getParameter("main"));
            Statement stat = con.createStatement();
            
            if(pokemons != null){
                if(pokemons.length <= 6){
                    if(request.getParameter("main") != null){
                        stat.executeUpdate("DELETE FROM pokemon_equipo WHERE principal = 1 AND identrenador = " + idUsuario + ";");
                        for(String idPoke : pokemons){
                            stat.executeUpdate("INSERT INTO pokemon_equipo VALUES (\"" + idPoke + "\",\"" + idUsuario + "\",\"1\");");
                        }
                    }else{
                        stat.executeUpdate("DELETE FROM pokemon_equipo WHERE principal = 0 AND identrenador = " + idUsuario + ";");
                        for(String idPoke : pokemons){
                            stat.executeUpdate("INSERT INTO pokemon_equipo VALUES (\"" + idPoke + "\",\"" + idUsuario + "\",\"0\");");
                        }
                    }
                }else{
                    res = "You can only add 6 Pokemons to a team";
                }
            }else{
                res = "You need to select at least one Pokemon";
            }
            
            stat.close();
            con.close();

            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/myteam");

            if(disp!=null){
                    disp.forward(request,response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}