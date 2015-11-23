import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class SetBattle extends HttpServlet{
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        try{
            String usuarioB = getServletContext().getInitParameter("usuario");
            String passB = getServletContext().getInitParameter("pass");

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/pokemons";
            Connection con = DriverManager.getConnection(url,usuarioB,passB);
            
            String idUsuario = (String) request.getSession().getAttribute("user");
            String idOponent = idUsuario;
            
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery("SELECT * FROM oponentes WHERE idprincipal = " + idUsuario + ";");

            List<TeamPokemon> mainTeam = new ArrayList<>();
            List<TeamPokemon> oponTeam = new ArrayList<>();
            List<Ataque> ataques = new ArrayList<>();
            
            while(rs.next()){
                idOponent = rs.getString("idoponente");
            }
                
            Statement stat1 = con.createStatement();
            ResultSet rs1 = stat1.executeQuery("SELECT principal, nivel, apodo, health, ataque1, ataque2, ataque3, ataque4, c.identrenador, c.idpokemon, sprite FROM pokemon_equipo AS pe, capturados AS c, pokemones AS p WHERE c.idpokemon = pe.idpokemon AND health > 0 AND pe.identrenador = " + idUsuario + " AND c.identrenador = " + idUsuario + " AND c.idpokemon = p.idpokemon;");
            
            int x = 0;
            
            while(rs1.next()){
                int idPoke = rs1.getInt("idpokemon");
                int idTrai = rs1.getInt("identrenador");
                int nivel = rs1.getInt("nivel");
                int health = rs1.getInt("health");
                String nickname = rs1.getString("apodo");
                String imagen = rs1.getString("sprite");
                int principal = rs1.getInt("principal");
                
                if(principal == 1){
                    mainTeam.add(new TeamPokemon(idPoke, idTrai, nivel, health, nickname, imagen));
                    
                
                    if(x == 0){
                        request.setAttribute("mainImg", imagen);
                        request.setAttribute("mainLvl", nivel);
                        request.setAttribute("mainNam", nickname);
                        request.setAttribute("mainHth", health);
                        request.setAttribute("mainId", idPoke);

                        String ataq[] = {rs1.getString("ataque1"), rs1.getString("ataque2"), rs1.getString("ataque3"), rs1.getString("ataque4")};
                        for(int i = 0; i < ataq.length; i++){
                            Statement stat3 = con.createStatement();
                            ResultSet rs3 = stat3.executeQuery("SELECT * FROM ataques WHERE idataque = " + ataq[i] + ";");
                            while(rs3.next()){
                                int idAt = rs3.getInt("idataque");
                                String nom = rs3.getString("nombre");
                                String des = rs3.getString("descripcion");
                                int tipo = rs3.getInt("tipo");
                                int pow = rs3.getInt("poder");

                                ataques.add(new Ataque(idAt, nom, des, tipo, pow));
                            }
                            stat3.close();
                        }
                        x++;
                    }
                }
            }
                
            Statement stat2 = con.createStatement();
            ResultSet rs2 = stat2.executeQuery("SELECT principal, nivel, apodo, health, c.identrenador, c.idpokemon, sprite FROM pokemon_equipo AS pe, capturados AS c, pokemones AS p WHERE c.idpokemon = pe.idpokemon AND health > 0 AND pe.identrenador = " + idOponent + " AND c.identrenador = " + idOponent + " AND c.idpokemon = p.idpokemon;");
            x = 0;
            
            while(rs2.next()){
                int idPoke = rs2.getInt("idpokemon");
                int idTrai = rs2.getInt("identrenador");
                int nivel = rs2.getInt("nivel");
                int health = rs2.getInt("health");
                String nickname = rs2.getString("apodo");
                String imagen = rs2.getString("sprite");
                int principal = rs2.getInt("principal");
                
                if(principal == 1){
                
                    if(x == 0){
                        request.setAttribute("oponImg", imagen);
                        request.setAttribute("oponLvl", nivel);
                        request.setAttribute("oponNam", nickname);
                        request.setAttribute("oponHth", health);
                        request.setAttribute("oponId", idPoke);
                        
                        x++;
                    }
                    
                    oponTeam.add(new TeamPokemon(idPoke, idTrai, nivel, health, nickname, imagen));
                }
            }
            
            request.setAttribute("mainTeam", mainTeam);
            request.setAttribute("oponTeam", oponTeam);
            request.setAttribute("ataques", ataques);
            
            stat.close();
            stat1.close();
            con.close();

            if(mainTeam.size() > 0 && oponTeam.size() > 0){
                RequestDispatcher disp =  getServletContext().getRequestDispatcher("/theBattle.jsp");

                if(disp!=null){
                        disp.forward(request,response);
                }
            } else{
                RequestDispatcher disp =  getServletContext().getRequestDispatcher("/pokecenter");

                if(disp!=null){
                        disp.forward(request,response);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        doGet(request, response);
    }
}