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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Page</title>
</head>
<body>
	<h1>User Page</h1><br>
	<a href="user.jsp">All</a>&nbsp;&nbsp;&nbsp;<a href="f.jsp?user=<%=username%>">Add To Favorite</a>&nbsp;&nbsp;&nbsp;<a href="logout.jsp">logout</a><br><br><br>
	
	
	<sql:setDataSource var="data" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/phase2endproject" user="root"
	password="K.harsha@2000" />
	
	<form action="user.jsp" method="post">
		<input type="text" name="value" placeholder="search Crossing">
	
		<button>Search</button>
	</form><br>
	<%
		String search = request.getParameter("value");
		search = search+"%";
	
		if(request.getParameter("value") == null){
			%>
			
			<sql:query dataSource="${data}" var="resultSet" >
				select * from trainlist;
			</sql:query>
			
			<c:forEach var="row" items="${resultSet.rows}" >
				<div style="padding:5px;border:2px solid green;border-radius:10px">
					<h3 style="text-decoration:underline;">${row.name}</h3>	
					<p><b>Crossing status:</b><c:choose>
						<c:when test="${row.status=='close'}">
							<o style="background-color:red;border-radius:10px;padding:3px">${row.status}</o>
						</c:when>
						<c:when test="${row.status=='open'}">
							<o style="background-color:green;border-radius:10px;padding:3px">${row.status}</o>
						</c:when>
					</c:choose></p>
					<p><b>Person In-Charge:</b> ${row.persioncharge}</p>
					<p><b>Train Time:</b> ${row.traintime}</p>
					<p><b>Land mark:</b> ${row.landmark}</p>
					<p><b>Address:</b> ${row.address}</p>
					
					<form action="FServlet" method="post">
						<input type="hidden" name="id" value="${row.id}">
						<input type="hidden" name="username" value="${username}">						
						<button value="addf" style="padding:10px;border-radius:5px">Add To Favorite</button>
					</form>
				</div><br>
			</c:forEach>
			<%
		}else{
	%>
			
			<sql:query dataSource="${data}" var="resultSet" >
				select * from trainlist where name like '<%=search %>';
			</sql:query>
			
			
			<c:forEach var="row" items="${resultSet.rows}" >
				<div style="padding:5px;border:2px solid green;border-radius:10px">
					<h3 style="text-decoration:underline;">${row.name}</h3>	
					<p><b>Crossing status:</b><c:choose>
						<c:when test="${row.status=='close'}">
							<o style="background-color:red;border-radius:10px;padding:3px">${row.status}</o>
						</c:when>
						<c:when test="${row.status=='open'}">
							<o style="background-color:green;border-radius:10px;padding:3px">${row.status}</o>
						</c:when>
					</c:choose></p>
					<p><b>Person In-Charge:</b> ${row.persioncharge}</p>
					<p><b>Train Time:</b> ${row.traintime}</p>
					<p><b>Land mark:</b> ${row.landmark}</p>
					<p><b>Address:</b> ${row.address}</p>
				
					<form action="FServlet" method="post">
						<input type="hidden" name="id" value="${row.id}">
						<input type="hidden" name="username" value="${username}">
						
						<button value="addf" style="padding:10px;border-radius:5px">Add To Favorite</button>
					</form>
				</div><br>
			</c:forEach>
			<%			
		}
			
			
		%>
</body>
</html>