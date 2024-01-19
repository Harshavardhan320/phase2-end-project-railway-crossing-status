<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	if(session.getAttribute("username") == null || session.getAttribute("username").equals("")){
    		response.sendRedirect("Index.jsp");
    	}
    %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
   
<html>
<head>
<meta charset="UTF-8">
<title>Admin Edit Page</title>
 
</head>
<body>
	<h1>Admin Page</h1><br>
	<a href="admin.jsp">Home</a>&nbsp;&nbsp;&nbsp;<a href="Addtrain.jsp">Add Railway Crossing</a>&nbsp;&nbsp;&nbsp;<a href="search.jsp">Search Train</a>&nbsp;&nbsp;&nbsp;<a href="logout.jsp">Logout</a>
	<br><br>
	<sql:setDataSource var="data" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/phase2endproject" user="root"
	password="K.harsha@2000" />
	
	<sql:query dataSource="${data}" var="resultSet" >
		select * from trainlist where id=<%=request.getParameter("optionID")%>;
	</sql:query>
	
	<table border=1>
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>ADDRESS</th>
			<th>LANDMARK</th>
			<th>TRAIN TIME</th>
			<th>PERSON CHARGED</th>
			<th>STATUS</th>
			<th>ACTION</th>
		</tr>
		<c:forEach var="result" items="${resultSet.rows}" >
			<tr>
				<form action="UpdateServlet" method="post">
					<td><input type="text" value="${result.id}"	 readonly name="id" placeholder="ID"></td>
					<td><input type="text" value="${result.name}" name="name" placeholder="NAME"></td>
					<td><input type="text" value="${result.address}" name="address" placeholder="ADDRESS"></td>
					<td><input type="text" value="${result.landmark}" name="landmark" placeholder="LAND MARK"></td>
					<td><input type="time" value="${result.traintime}" name="time" placeholder="TIME"></td>
					<td><input type="text" value="${result.persioncharge}" name="personcharge" placeholder="PERSON CHARGE"></td>
					<td>
						<select name="status">
							<option value="close">Close</option>
							<option value="open">Open</option>
						</select><br><br>
					</td>
					<td><input type="submit" value="Update Record"></td>
				</form>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>