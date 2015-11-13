import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class NicknameIt extends HttpServlet{
    
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
            String nombre = request.getParameter("nombre");
            String nivel = request.getParameter("nivel");
            String hp = request.getParameter("hp");
            String nick = request.getParameter("nick");
            
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery("SELECT * FROM pokemon_ataque WHERE idpokemon = " + idPok + ";");
            
            int ataques = 0;
            int habilidades = 0;
            
            while(rs.next()){
                ataques++;
            }
            
            Statement stat1 = con.createStatement();
            ResultSet rs1 = stat1.executeQuery("SELECT * FROM pokemon_habilidad WHERE idpokemon = " + idPok + ";");
            
            while(rs1.next()){
                habilidades++;
            }
            
            int at1 = (int) (Math.random() * ataques +  1);
            int at2 = (int) (Math.random() * ataques +  1);
            int at3 = (int) (Math.random() * ataques +  1);
            int at4 = (int) (Math.random() * ataques +  1);
            int hab = (int) (Math.random() * habilidades +  1);
            double niv = Double.parseDouble(nivel);
            int hpMax = Integer.parseInt(hp);
            int hpAct = (int)((niv / 100) * hpMax);
            
            if(nick == null || nick.equals("")){
                stat.executeUpdate("INSERT INTO capturados VALUES (" + idPok + "," + idUsuario + ",\"" + nombre + "\",\"" + nivel + "\",\"" + hab + "\",\"" + at1 + "\",\"" + at2 + "\",\"" + at3 + "\",\"" + at4 + "\"," + hpAct + ");");
            }else{
                stat.executeUpdate("INSERT INTO capturados VALUES (" + idPok + "," + idUsuario + ",\"" + nick + "\",\"" + nivel + "\",\"" + hab + "\",\"" + at1 + "\",\"" + at2 + "\",\"" + at3 + "\",\"" + at4 + "\"," + hpAct + ");");
            }
            
            stat.close();
            stat1.close();
            con.close();

            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/explore.jsp");

            if(disp!=null){
                    disp.forward(request,response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}