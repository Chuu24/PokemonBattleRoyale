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
            String error="";

            String bday = request.getParameter("bday");
            String country = request.getParameter("country");
            String name = request.getParameter("name");
            String user  = request.getParameter("user");
            String mail = request.getParameter("mail");
            String pass1 = request.getParameter("pass");
            String pass2 = request.getParameter("passConfirm");
            String sprite=request.getParameter("sprite");
            String idPok=request.getParameter("starter");
            String nick=request.getParameter("nick");
            String nivel="5";
            String nombrepoke="";

            boolean act = true;

            String usuario = getServletContext().getInitParameter("usuario");
            String password = getServletContext().getInitParameter("pass");

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/pokemons";
            Connection con = DriverManager.getConnection(url,usuario,password);

            Statement stat = con.createStatement();

            Statement stat1 = con.createStatement();
            ResultSet rs = stat1.executeQuery("SELECT * FROM perfil WHERE username = '" + user + "'");

            if(!(name.equals("")) && !(user.equals("")) && !(country.equals("")) && !(bday.equals("")) && !(mail.equals("")) && !(pass1.equals("")) && !(pass2.equals(""))){
                if(!(pass1.equals(pass2))){
                    act = false;
                    error="*Passwords do not match! Please check and submit again.";
                }
              	if(rs.next()){
                    act=false;
                    error="*That username already exists! Please choose another one and try again.";
		}
                if(act){
                    stat.executeUpdate("INSERT INTO perfil(username, contrasena, sprite, correo, dinero, nombre, cumple, pais) VALUES (\"" + user + "\",\"" + pass1 + "\",\"" + sprite + "\",\"" + mail + "\",\" 2000 \",\"" + name + "\",\"" + bday + "\",\"" + country + "\");");

                    String idUsuario="0";
                    Statement s = con.createStatement();
                    ResultSet r=s.executeQuery("SELECT * FROM perfil WHERE username = '" + user + "'");
                    if(r.next()){
                        idUsuario=r.getString("idperfil");
                    }
                    
                    Statement s2 = con.createStatement();
                    s2.executeUpdate("INSERT INTO oponentes VALUES (\"" + idUsuario + "\",\"" + idUsuario + "\");");
                    s2.close();
                    
                    Statement s3 = con.createStatement();
                    s3.executeUpdate("INSERT INTO amigos VALUES (\"" + idUsuario + "\",\"" + idUsuario + "\", 1);");
                    s3.close();
                    s.close();

                    Statement st2 = con.createStatement();
                    ResultSet rs4 = st2.executeQuery("SELECT * FROM pokemones WHERE idpokemon = " + idPok + ";");
                    rs4.next();
                    nombrepoke=rs4.getString("nombre");
                    int hpMax = rs4.getInt("hp");

                    Statement st = con.createStatement();
                    ResultSet rs2 = st.executeQuery("SELECT * FROM pokemon_ataque WHERE idpokemon = " + idPok + ";");

                    int ataques = 0;
                    int habilidades = 0;

                    while(rs2.next()){
                        ataques++;
                    }

                    Statement st1 = con.createStatement();
                    ResultSet rs3 = st1.executeQuery("SELECT * FROM pokemon_habilidad WHERE idpokemon = " + idPok + ";");

                    while(rs3.next()){
                        habilidades++;
                    }

                    int at1 = (int) (Math.random() * ataques +  1);
                    int at2 = (int) (Math.random() * ataques +  1);
                    int at3 = (int) (Math.random() * ataques +  1);
                    int at4 = (int) (Math.random() * ataques +  1);
                    int hab = (int) (Math.random() * habilidades +  1);
                    int hpAct = (int) (0.05 * hpMax);

                    if(nick == null || nick.equals("")){
                        st.executeUpdate("INSERT INTO capturados VALUES (" + idPok + "," + idUsuario + ",\"" + nombrepoke + "\",\"" + nivel + "\",\"" + hab + "\",\"" + at1 + "\",\"" + at2 + "\",\"" + at3 + "\",\"" + at4 + "\"," + hpAct + ");");
                    }else{
                        st.executeUpdate("INSERT INTO capturados VALUES (" + idPok + "," + idUsuario + ",\"" + nick + "\",\"" + nivel + "\",\"" + hab + "\",\"" + at1 + "\",\"" + at2 + "\",\"" + at3 + "\",\"" + at4 + "\"," + hpAct + ");");
                    }

            st.close();
            st1.close();
            st2.close();
        }
            }else{
                act = false;
                error="*You must complete all fields! Please check and submit again.";
            }

            stat1.close();
            stat.close();
            con.close();

            if(act){
				request.setAttribute("error", error);
                RequestDispatcher disp = getServletContext().getRequestDispatcher("/login.jsp");

                if(disp != null){
                    disp.forward(request,response);
                }
            }else{
				request.setAttribute("error", error);
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