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


public class Deleteservlets extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String value = request.getParameter("optionID");
		
		PrintWriter out = response.getWriter();
		
		DBconnection con = new DBconnection();
		
		try {
			String query = "delete from trainlist where id="+value;
			
			PreparedStatement stm = con.getConnection().prepareStatement(query);
			
			boolean res = stm.execute();
			
			if(!res) {
				request.getRequestDispatcher("admin.jsp").include(request, response);
				out.println("<center><h3 style='color:green'>Record Deleted</h3></center>");
			}else {
				request.getRequestDispatcher("admin.jsp").include(request, response);
				out.println("<center><h3 style='color:red'>Record not Deleted</h3></center>");
			}
			
			
		}catch(SQLException e) {
			System.out.println("Error fail to connect");
		}
	}

}
