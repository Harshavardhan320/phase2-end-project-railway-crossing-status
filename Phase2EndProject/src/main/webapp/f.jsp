<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	if(session.getAttribute("username") == null || session.getAttribute("username").equals("")){
    		response.sendRedirect("Index.jsp");
    	}
    	String username = String.valueOf(session.getAttribute("username"));
    %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
	<%@ page import="dbconnection.DBconnection" %>
	<%@ page import="java.util.*" %>
	<%@ page import="java.sql.*" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>f page</title>
</head>
<body><h1>User Page</h1>
	<a href="user.jsp">All</a>&nbsp;&nbsp;&nbsp;<a href="logout.jsp">logout</a><br><br><br>

	<%
	DBconnection conn = new DBconnection();
	try {
		String query = "SELECT * FROM flist WHERE username=?";
	    
	    PreparedStatement pst = conn.getConnection().prepareStatement(query);
	    pst.setString(1, request.getParameter("user"));
	    
	    ResultSet res = pst.executeQuery();
	    
	    Set<Integer> list = new HashSet<>();
	   
	    
	    while (res.next()) {
	        list.add(res.getInt("railwayid"));
	    }
	    for(Integer ele: list) {
	    	
	    	String query1 = "SELECT * FROM trainlist WHERE id=?";
		    
		    PreparedStatement pst1 = conn.getConnection().prepareStatement(query1);
		    pst1.setInt(1, ele);
		    ResultSet res1 = pst1.executeQuery();
		    while(res1.next()){
		    	String open1 = res1.getString("status");
		
		    	%>
		    		<div style="padding:5px;border:2px solid green;border-radius:10px">
					<h3 style="text-decoration:underline;"><%=res1.getString("name")%></h3>	
					<p><b>Crossing status:</b>
						<% if(open1.equals("close")){%>
							<o style="background-color:red;border-radius:10px;padding:3px"><%=res1.getString("status")%></o>
							<%}%>
						<% if(open1.equals("open")){%>
							<o style="background-color:green;border-radius:10px;padding:3px"><%=res1.getString("status")%></o>
						<%}%></p>
					<p><b>Person In-Charge:</b><%=res1.getString("persioncharge")%></p>
					<p><b>Train Time:</b> <%=res1.getString("traintime")%></p>
					<p><b>Land mark:</b> <%=res1.getString("landmark")%></p>
					<p><b>Address:</b> <%=res1.getString("address")%></p>
					
					<form action="f.jsp?user=${username}" method="post">
						<input type="hidden" name="id" value="<%=res1.getInt("id")%>">
						<input type="hidden" name="username" value="${username}">						
						<button value="addf" style="padding:10px;border-radius:5px">Remove From Favorites</button>
					</form>
				</div><br>
		    	
		    	<%
		    }
		   if(request.getParameter("id") != null){
			   String query2 = "delete from flist WHERE railwayid=? and username =?";
			    	  
			  PreparedStatement pst2 = conn.getConnection().prepareStatement(query2);
			    
			    int num =Integer.parseInt(request.getParameter("id"));
			    
			    
			    
			    pst2.setInt(1, num);
			    pst2.setString(2,request.getParameter("username"));
			    
			    boolean res2 = pst2.execute();
			    
			    if(!res2){
			    	request.getRequestDispatcher("user.jsp").include(request, response);
					out.println("<center><h3 style='color:green'>Record removed</h3></center>");
			    }else{
			    	request.getRequestDispatcher("user.jsp").include(request, response);
					out.println("<center><h3 style='color:red'>not removed</h3></center>");
			    }
		   }

	    }
	}catch(SQLException e) {
		e.printStackTrace();
		System.out.println("Error");
	}
	
	%>

</body>
</html>