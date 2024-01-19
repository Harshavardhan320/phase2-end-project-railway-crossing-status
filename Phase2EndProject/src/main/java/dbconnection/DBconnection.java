package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {
	private String url="jdbc:mysql://localhost:3306/phase2endproject";
	private String username ="root";
	private String password ="K.harsha@2000";
	
	public DBconnection() {
		connection();
	}
	
	private Connection connect = null;
	
	
	
	private void connection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			connect = DriverManager.getConnection(url, username, password);
			
			
		}catch(ClassNotFoundException e) {
			
			System.out.println("Class not loaded");
		}catch(SQLException e) {
			
				System.out.println("Connection issue");
		}
	}
	
	public Connection getConnection() {
		return connect;
	}
}
