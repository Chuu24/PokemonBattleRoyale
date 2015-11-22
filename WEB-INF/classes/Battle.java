import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        String message = String.format("* %s %s", nickname, "is ready to battle.");
        sendMsg(message);
    }


    @OnClose
    public void end() {
        connections.remove(this);
        String message = String.format("You have won.");
        broadcast(message);
    }


    @OnMessage
    public void echo(String message) {
        
        
        String filteredMessage = String.format("%s: %s",
                nickname, message);
        sendMsg(filteredMessage);
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
            
            Battle ses = opponentSession.get(idOponente);
            
            try {
                synchronized (ses) {
                    this.session.getBasicRemote().sendText(msg);
                    ses.session.getBasicRemote().sendText(msg);
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
