<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%
    	if(session.getAttribute("username") == null || session.getAttribute("username").equals("")){
    		response.sendRedirect("Index.jsp");
    	}
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Cross Admin</title>
</head>
<body>
	<div >
		<h1>Add Railway Crossing</h1>
		<a href="admin.jsp">Home</a>&nbsp;&nbsp;&nbsp;<a href="Addtrain.jsp">Add Railway Crossing</a>&nbsp;&nbsp;&nbsp;<a href="search.jsp">Search Train</a>
	<br><br>
		<form action="AddData" method="post">
			<div >
				<label for="name">Name</label>
				<input type="text" name="name" placeholder="Name">
			</div>
			<div><br>
				<label for="address">Address</label>
				<input type="text" name="address" placeholder="Address">
			</div>
			<div><br>
				<label for="landmark">Land Mark</label>
				<input type="text" name="landmark" placeholder="Land Mark">
			</div>
			<div><br>
				<label for="time">Time</label>
				<input type="time" name="time" placeholder="Time">
			</div>
			<div><br>
				<label for="Personcharge">Person Charge</label>
				<input type="text" name="personcharge" placeholder="Person Charge">
			</div><br>
			<select name="status">
				<option value="close">Close</option>
				<option value="open">Open</option>
			</select><br><br>
			
			<button>Add Train Cross</button>
		</form>
	</div>
</body>
</html>