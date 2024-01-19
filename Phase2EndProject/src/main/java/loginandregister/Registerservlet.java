package loginandregister;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import dbconnection.DBconnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Registerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		PrintWriter out = response.getWriter();
		
		if(username == null || username.equals("")|| password == null || password.equals("") ) {
			request.getRequestDispatcher("register.jsp").include(request, response);;
			out.print("<center><b style='color:red'>Empty Columns</b></center>");
			return;
		}
		
		DBconnection con = new DBconnection();
		
		try {
			
			String query ="insert into userlogin(username, password)value(?,?)";
			
			PreparedStatement stm = con.getConnection().prepareStatement(query);
			
			stm.setString(1, username);
			stm.setString(2, password);
			
			boolean result =stm.execute();
			
			if(!result) {
				
				response.sendRedirect("Index.jsp?reg=1");
				
			}else {
				
				request.getRequestDispatcher("register.jsp").include(request, response);;
				out.print("<center><b style='color:red'>Registration Fail</b></center>"+result);
			}
			
		}catch(SQLIntegrityConstraintViolationException e) {
			
			request.getRequestDispatcher("register.jsp").include(request, response);
			out.printf("<center><b style='color:red'>%s Already in Use</b></center>",username);
			
		}	catch(SQLException e) {
			
			System.out.println("Fail to connect");
		}finally {
			
			username="";
			password="";
			try {
				con.getConnection().close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
