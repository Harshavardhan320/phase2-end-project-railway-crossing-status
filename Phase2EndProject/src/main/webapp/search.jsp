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
<title>search page</title>
 
</head>
<body>
	<h1>Admin search Page</h1><br>
	<a href="admin.jsp">Home</a>&nbsp;&nbsp;&nbsp;<a href="Addtrain.jsp">Add Railway Crossing</a>&nbsp;&nbsp;&nbsp;<a href="search.jsp">Search Train</a>&nbsp;&nbsp;&nbsp;<a href="logout.jsp">Logout</a>
	<br><br><br>
	
	<form action="search.jsp">
		<input type="text" name="search" placeholder="Enter Crossing Name">
		<input type="submit" value="Search">
	</form>
	
	
	
	
	<sql:setDataSource var="data" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/phase2endproject" user="root"
	password="K.harsha@2000" />
	
	<%String search = " ";
	
	
	
	if(request.getParameter("search") != null){
		
		search = request.getParameter("search");
		
		search = search+"%";
		
	}
	
	
	
	%>
	
	<sql:query dataSource="${data}" var="resultSet" >
		select* from trainlist where name like "<%=search%>";
		
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
				<td>${result.id}</td>
				<td>${result.name}</td>
				<td>${result.address}</td>
				<td>${result.landmark}</td>
				<td>${result.traintime}</td>
				<td>${result.persioncharge}</td>
				<td>${result.status}</td>
				<td>
					<form  style="display:inline-block"action="Deleteservlets" method="post" >
						<input type="hidden" value="${result.id}" name="optionID">
						<input type="hidden" value="delete" name="option">
						<button>Delete</button>
					</form>
						<form style="display:inline-block" action="edit.jsp" method="post">
						<input type="hidden" value="${result.id}" name="optionID">
						<input type="hidden" value="${result.status}" name="status">
						<input type="hidden" value="edit" name="option">
						<button>Edit</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>