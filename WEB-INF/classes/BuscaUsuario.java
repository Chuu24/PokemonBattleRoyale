import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class BuscaUsuario extends HttpServlet{
	public void Amigos(HttpServletRequest request, HttpServletResponse response){
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
                    }else{
                        statStr="Pending";
                    }
                    listaAmigos.add(new Amigo(name, user, idAmigo, statStr));
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
                    }else{
                        statStr="Pending";
                    }
                    listaAmigos.add(new Amigo(name, user, idAmigo, statStr));
                    stattemp2.close();
                }

                request.setAttribute("amigos", listaAmigos);

                stat.close();
                stat1.close();
                con.close();
            }catch(Exception e){
                e.printStackTrace();
            }
	}

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        try{
            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/friends");

            if(disp!=null){
                    disp.forward(request,response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response){
		int idFind=0;
		String findName;
		String findUser;
		String findSprite;
		String findMail;
		int findEdad;

        try{
            String usuarioB = getServletContext().getInitParameter("usuario");
            String passB = getServletContext().getInitParameter("pass");

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/pokemons";
            Connection con = DriverManager.getConnection(url,usuarioB,passB);

            String find = request.getParameter("find");

            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery("SELECT * FROM perfil WHERE username LIKE '%" + find + "%';");

           	List<Usuario> listaUsuarios = new ArrayList<>();

		   	while(rs.next()){
		        idFind=rs.getInt("idperfil");
				findName=rs.getString("nombre");
				findUser=rs.getString("username");
				findSprite=rs.getString("sprite");
				findMail=rs.getString("correo");
				Statement stat1 = con.createStatement();
				ResultSet rs1 = stat1.executeQuery("SELECT DATEDIFF(NOW(), cumple) FROM pokemons.perfil WHERE idperfil = '" + idFind + "'");
				rs1.next();
				findEdad=rs1.getInt("DATEDIFF(NOW(), cumple)");
				findEdad/=365;
				stat1.close();
				listaUsuarios.add(new Usuario(findUser, findName, idFind, findSprite, findMail, findEdad));
            }
            request.setAttribute("found", listaUsuarios);
            request.setAttribute("display", 1);

            stat.close();
            con.close();

			Amigos(request, response);

            RequestDispatcher disp =  getServletContext().getRequestDispatcher("/friends.jsp");

			if(disp!=null){
				disp.forward(request,response);
            }

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}