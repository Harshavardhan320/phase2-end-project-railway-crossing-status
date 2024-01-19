package loginandregister;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconnection.DBconnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Loginservlet
 */
public class Loginservlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String select = request.getParameter("select");
		
		PrintWriter out = response.getWriter();
		
		if(username == null || username.equals("")|| password == null || password.equals("") ) {
			request.getRequestDispatcher("Index.jsp").include(request, response);;
			out.print("<center><b style='color:red'>Empty Columns</b></center>");
			return;
		}
		
		DBconnection conn = new DBconnection();
		
		
		
		switch(select) {
			case "user":
				String query = "select * from userlogin where username=? and password =?";
				
			try {
				
				PreparedStatement stm  = conn.getConnection().prepareStatement(query);
				stm.setString(1, username);
				stm.setString(2, password);
				
				ResultSet res = stm.executeQuery();
				
				if(res.next()) {
					response.sendRedirect("Index.jsp?value="+username+"&page=user.jsp");
					
				}else {
					request.getRequestDispatcher("Index.jsp").include(request, response);
					out.printf("<center><b style='color:red'>%s Login Fail</b></center>",username);
				}

			} catch (SQLException e) {
				
			}finally {
				username ="";
				password="";
				
				try {
					conn.getConnection().close();
				} catch (SQLException e) {
					System.out.println("Login Fail");
				}
			}
				break;
			case "admin":
				
					if(username.equals("admin") && password.equals("admin"))
						response.sendRedirect("Index.jsp?value="+username+"&page=admin.jsp");
					else {
						request.getRequestDispatcher("Index.jsp").include(request, response);;
						out.printf("<center><b style='color:red'>%s Login Fail</b></center>",username);
					}
				break;
			default:
				username="";
				password="";
				select="";
					
		}
	}

}
