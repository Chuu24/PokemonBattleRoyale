import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Logout extends HttpServlet{
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        try{
            HttpSession sesion = request.getSession(true);
            sesion.setAttribute("user", null);
            
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");

            if(disp != null){
                disp.forward(request,response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}