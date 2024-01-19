package dataAdd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dbconnection.DBconnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FServlet
 */
public class FServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		response.setContentType("text/html");
//		
		
		String username = request.getParameter("username");
		int id = Integer.parseInt( request.getParameter("id"));
		
		DBconnection conn = new DBconnection();
		
		try {
			String query = "insert into flist(username, railwayid)value(?,?)";
			
			PreparedStatement stm = conn.getConnection().prepareStatement(query);
			stm.setString(1, username);
			stm.setInt(2, id);
			
			boolean res = stm.execute();
			
			if(!res) {
				request.getRequestDispatcher("user.jsp").include(request, response);
				out.println("<center><h3 style='color:green'>Record Added</h3></center>");
			}else {
				request.getRequestDispatcher("user.jsp").include(request, response);
				out.println("<center><h3 style='color:green'>Not Added</h3></center>");
			}
			
		}catch(SQLException e) {
			
		}
		
	}

}
