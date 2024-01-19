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


public class AddData extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String landmark=request.getParameter("landmark");
		String time =request.getParameter("time");
		String personcharge=request.getParameter("personcharge");
		String status=request.getParameter("status");
		
		PrintWriter out = response.getWriter();
		
		if(name.equals("") || address.equals("") || landmark .equals("")
				||time.equals("")||personcharge .equals("") || status .equals("")) {
			
			request.getRequestDispatcher("Addtrain.jsp").include(request, response);
			out.println("<br><b style='color:red'>Empty Column Fail To Add</b></center>");
			return;
		}
		DBconnection con = new DBconnection();
		
		String query ="insert into trainlist(name, address, landmark, traintime, persioncharge, status)value(?,?,?,?,?,?)";
		try {
			
			PreparedStatement stm= con.getConnection().prepareStatement(query);
			
			stm.setString(1, name);
			stm.setString(2, address);
			stm.setString(3, landmark);
			stm.setString(4, time);
			stm.setString(5, personcharge);
			stm.setString(6, status);
			
			boolean res = stm.execute();
			
			if(!res) {
				response.sendRedirect("admin.jsp");
			}else {
				request.getRequestDispatcher("Addtrain.jsp").include(request, response);;
				out.print("<center><b style='color:red'>No't Added</b></center>");
			}
			
			
		} catch (SQLException e) {
			System.out.println("Error");
		}finally {
			name="";
			address="";
			landmark="";
			time="";
			personcharge="";
			status="";
			
			try {
				
				con.getConnection().close();
				
			} catch (SQLException e) {
				
				System.out.println("Error");
				
			}
		}
		
		
	}

}










