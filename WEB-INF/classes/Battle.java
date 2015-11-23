import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicInteger;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.juli.logging.Log;
import org.apache.juli.logging.LogFactory;

@ServerEndpoint(value = "/battling", 
                configurator = GetHttpSessionConfigurator.class)
public class Battle {

    private static final Log log = LogFactory.getLog(Battle.class);

    private static final String GUEST_PREFIX = "Guest";
    private static final AtomicInteger connectionIds = new AtomicInteger(0);
    private static final Set<Battle> connections =
            new CopyOnWriteArraySet<>();
    private static final ConcurrentHashMap<String, Battle> opponentSession =
            new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String, Boolean> responsesWaiting =
            new ConcurrentHashMap<>();

    private String nickname;
    private Session session;
    private HttpSession httpSession;

    public Battle() {
        nickname = GUEST_PREFIX + connectionIds.getAndIncrement();
    }


    @OnOpen
    public void open(Session session, EndpointConfig config) {
        this.session = session;
        connections.add(this);
        
        this.httpSession = (HttpSession) config.getUserProperties()
                                           .get(HttpSession.class.getName());
        try{
            String usuarioB = "root";
            String passB = "ldmpt24*";

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/pokemons";
            Connection con = DriverManager.getConnection(url,usuarioB,passB);
            
            String idUsuario = (String) httpSession.getAttribute("user");
            
            Statement stat1 = con.createStatement();
            ResultSet rs1 = stat1.executeQuery("SELECT * FROM perfil WHERE idperfil = " + idUsuario + ";");
            
            while(rs1.next()){
                nickname = rs1.getString("username");
            }
            
            opponentSession.put(idUsuario, this);
            responsesWaiting.put(idUsuario, Boolean.FALSE);
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        String message = String.format("* %s %s", nickname, "is ready to battle.");
        sendMsg(message);
    }


    @OnClose
    public void end() {
        try{
            String usuarioB = "root";
            String passB = "ldmpt24*";

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/pokemons";
            Connection con = DriverManager.getConnection(url,usuarioB,passB);
            
            String idUsuario = (String) httpSession.getAttribute("user");
            String idOponent = idUsuario;
            
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery("SELECT * FROM oponentes WHERE idprincipal = " + idUsuario + ";");

            List<TeamPokemon> mainTeam = new ArrayList<>();
            List<TeamPokemon> oponTeam = new ArrayList<>();
            
            while(rs.next()){
                idOponent = rs.getString("idoponente");
            }
                
            Statement stat1 = con.createStatement();
            ResultSet rs1 = stat1.executeQuery("SELECT principal, nivel, apodo, health, ataque1, ataque2, ataque3, ataque4, c.identrenador, c.idpokemon, sprite FROM pokemon_equipo AS pe, capturados AS c, pokemones AS p WHERE c.idpokemon = pe.idpokemon AND health > 0 AND pe.identrenador = " + idUsuario + " AND c.identrenador = " + idUsuario + " AND c.idpokemon = p.idpokemon;");
            
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
                }
            }
                
            Statement stat2 = con.createStatement();
            ResultSet rs2 = stat2.executeQuery("SELECT principal, nivel, apodo, health, c.identrenador, c.idpokemon, sprite FROM pokemon_equipo AS pe, capturados AS c, pokemones AS p WHERE c.idpokemon = pe.idpokemon AND health > 0 AND pe.identrenador = " + idOponent + " AND c.identrenador = " + idOponent + " AND c.idpokemon = p.idpokemon;");
            
            while(rs2.next()){
                int idPoke = rs2.getInt("idpokemon");
                int idTrai = rs2.getInt("identrenador");
                int nivel = rs2.getInt("nivel");
                int health = rs2.getInt("health");
                String nickname = rs2.getString("apodo");
                String imagen = rs2.getString("sprite");
                int principal = rs2.getInt("principal");
                
                if(principal == 1){
                    
                    oponTeam.add(new TeamPokemon(idPoke, idTrai, nivel, health, nickname, imagen));
                }
            }
            
            String idActualizar = "";
            int incremento = 0;
            
            if(oponTeam.isEmpty()){
                idActualizar = idUsuario;
            }else{
                idActualizar = idOponent;
            }
            
            if(oponTeam.isEmpty() || mainTeam.isEmpty()){
                incremento = 1000;
                
                Statement stat5 = con.createStatement();
                ResultSet rs5 = stat5.executeQuery("SELECT principal, nivel, c.idpokemon FROM pokemon_equipo AS pe, capturados AS c, pokemones AS p WHERE c.idpokemon = pe.idpokemon AND pe.identrenador = " + idActualizar + " AND c.identrenador = " + idActualizar + " AND c.idpokemon = p.idpokemon;");

                while(rs5.next()){
                    int idPoke = rs5.getInt("idpokemon");
                    int nivel = rs5.getInt("nivel");
                    int principal = rs5.getInt("principal");

                    if(principal == 1){
                        nivel++;
                        Statement stat6 = con.createStatement();
                        stat6.executeUpdate("UPDATE capturados SET nivel = " + nivel + " WHERE idpokemon = " + idPoke + " AND identrenador = " + idActualizar + ";");
                        stat6.close();
                    }
                }
                
                Statement stat7 = con.createStatement();
                stat7.executeUpdate("UPDATE oponentes SET idoponente = 0 WHERE idprincipal = " + idUsuario + ";");
                
                Statement stat8 = con.createStatement();
                stat8.executeUpdate("UPDATE oponentes SET idoponente = 0 WHERE idprincipal = " + idOponent + ";");
                
                stat5.close();
                stat7.close();
                stat8.close();
            }
            
            Statement stat3 = con.createStatement();
            ResultSet rs3 = stat3.executeQuery("SELECT * FROM perfil WHERE idperfil = " + idActualizar + ";");
            
            int money = 0;
            while(rs3.next()){
                money = rs3.getInt("dinero");
            }
            
            Statement stat4 = con.createStatement();
            money += incremento;
            stat4.executeUpdate("UPDATE perfil SET dinero = " + money + " WHERE idperfil = " + idActualizar + ";");
            
            stat.close();
            stat1.close();
            stat2.close();
            stat3.close();
            stat4.close();
            con.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        connections.remove(this);
        String message = String.format("Battle ended.");
        sendMsg(message);
    }


    @OnMessage
    public void echo(String message) {
        
        try{
            String usuarioB = "root";
            String passB = "ldmpt24*";

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/pokemons";
            Connection con = DriverManager.getConnection(url,usuarioB,passB);
            
            String idUsuario = (String) httpSession.getAttribute("user");
            
            Statement stat1 = con.createStatement();
            ResultSet rs1 = stat1.executeQuery("SELECT * FROM oponentes WHERE idprincipal = " + idUsuario + ";");
            
            String idOponente = "1";
            
            while(rs1.next()){
                idOponente = rs1.getString("idoponente");
            }
            
            responsesWaiting.replace(idUsuario, Boolean.TRUE);
            
            while(!responsesWaiting.get(idOponente)){
                
            }
            
            String[] stuff = message.split(",");
            
            Statement s1 = con.createStatement();
            ResultSet r1 = s1.executeQuery("SELECT * FROM ataques WHERE idataque = " + stuff[0] + ";");
            
            String att = "";
            int poder = 0;
            while(r1.next()){
                att = r1.getString("nombre");
                poder = r1.getInt("poder");
            }
            
            int hp = Integer.parseInt(stuff[1]);
            int nv = Integer.parseInt(stuff[2]);
            int newHp = (int) ((double) hp - ((double) nv / 100.0) * (double) poder);
            
            if(newHp < 0)
                newHp = 0;
            
            Statement s2 = con.createStatement();
            s2.executeUpdate("UPDATE capturados SET health = " + newHp + " WHERE idpokemon = " + stuff[3] + " AND"
                    + " identrenador = " + idOponente + ";");
            
            stat1.close();
            s1.close();
            s2.close();
            con.close();
            
            responsesWaiting.replace(idUsuario, Boolean.FALSE);
        
            String filteredMessage = String.format("%s: Used %s",
                    nickname, att);
            sendMsg(filteredMessage, stuff[3], stuff[4]);
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @OnError
    public void onError(Throwable t) throws Throwable {
        log.error("Chat Error: " + t.toString(), t);
    }

    private void sendMsg(String msg) {
        
        try{
            String usuarioB = "root";
            String passB = "ldmpt24*";

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/pokemons";
            Connection con = DriverManager.getConnection(url,usuarioB,passB);
            
            String idUsuario = (String) httpSession.getAttribute("user");
            
            Statement stat1 = con.createStatement();
            ResultSet rs1 = stat1.executeQuery("SELECT * FROM oponentes WHERE idprincipal = " + idUsuario + ";");
            
            String idOponente = "1";
            
            while(rs1.next()){
                idOponente = rs1.getString("idoponente");
            }
            
            stat1.close();
            
            con.close();
            
            Battle ses = opponentSession.get(idOponente);
            
            if(ses != null){
                try {
                    synchronized (ses) {
                        String simple = "{\"respuesta\":\"" + msg + "\"}";
                        this.session.getBasicRemote().sendText(simple);
                        ses.session.getBasicRemote().sendText(simple);
                    }
                } catch (IOException e) {
                    log.debug("Chat Error: Failed to send message to client", e);
                    connections.remove(ses);
                    try {
                        ses.session.close();
                    } catch (IOException e1) {
                        // Ignore
                    }
                    String message = String.format("* %s %s",
                            ses.nickname, "has been disconnected.");
                    sendMsg(message);
                }
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    private void sendMsg(String msg, String id1, String id2) {
        
        try{
            String usuarioB = "root";
            String passB = "ldmpt24*";

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/pokemons";
            Connection con = DriverManager.getConnection(url,usuarioB,passB);
            
            String idUsuario = (String) httpSession.getAttribute("user");
            
            Statement stat1 = con.createStatement();
            ResultSet rs1 = stat1.executeQuery("SELECT * FROM oponentes WHERE idprincipal = " + idUsuario + ";");
            
            String idOponente = "1";
            
            while(rs1.next()){
                idOponente = rs1.getString("idoponente");
            }
            
            stat1.close();
            
            Battle ses = opponentSession.get(idOponente);
            int hisH = 0, myH = 0;
            
            Statement s1 = con.createStatement();
            ResultSet r1 = s1.executeQuery("SELECT health FROM capturados WHERE idpokemon = " + id1 + " AND"
                    + " identrenador = " + idOponente + ";");
            
            while(r1.next()){
                hisH = r1.getInt("health");
            }
            
            s1.close();
            
            Statement s2 = con.createStatement();
            ResultSet r2 = s2.executeQuery("SELECT health FROM capturados WHERE idpokemon = " + id2 + " AND"
                    + " identrenador = " + idUsuario + ";");
            
            while(r2.next()){
                myH = r2.getInt("health");
            }
            
            s2.close();
            con.close();
            
            try {
                synchronized (ses) {
                    String resp = "{\"myHealth\":" + myH + ","
                            + "\"hisHealth\":" + hisH + ","
                            + "\"respuesta\":\"" + msg + "\"}";
                    String simple = "{\"respuesta\":\"" + msg + "\"}";
                    this.session.getBasicRemote().sendText(resp);
                    ses.session.getBasicRemote().sendText(simple);
                }
            } catch (IOException e) {
                log.debug("Chat Error: Failed to send message to client", e);
                connections.remove(ses);
                try {
                    ses.session.close();
                } catch (IOException e1) {
                    // Ignore
                }
                String message = String.format("* %s %s",
                        ses.nickname, "has been disconnected.");
                sendMsg(message);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    private static void broadcast(String msg) {
        for (Battle client : connections) {
            try {
                synchronized (client) {
                    client.session.getBasicRemote().sendText(msg);
                }
            } catch (IOException e) {
                log.debug("Chat Error: Failed to send message to client", e);
                connections.remove(client);
                try {
                    client.session.close();
                } catch (IOException e1) {
                    // Ignore
                }
                String message = String.format("* %s %s",
                        client.nickname, "has been disconnected.");
                broadcast(message);
            }
        }
    }
}
