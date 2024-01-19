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
 * Servlet implementation class Flist
 */
public class Flist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBconnection con = new DBconnection();
		
		 PrintWriter out = response.getWriter();
		String query="insert into flist(username,railwayid)value(?,?)";
		
		String username = request.getParameter("username");
		
		try {
			
			PreparedStatement stm = con.getConnection().prepareStatement(query);
			
			stm.setString(1,username);
			stm.setInt(2, Integer.parseInt(request.getParameter("id")));
			
			boolean res = stm.execute();
			
			if(!res){
				request.getRequestDispatcher("user.jsp").include(request, response);
				out.println("<center><h3 style='color:green'>added</h3></center>");
			}else{
				request.getRequestDispatcher("user.jsp").include(request, response);
				out.println("<center><h3 style='color:green'>not added</h3></center>");
				
			}
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("Error");
		}
		
	}

}
