<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
	<div style="text-align:center;border-color: 2px solid black">
		<h1>Railway Crossing</h1>
		<h3>Login</h3><br><br>
		<form action="Loginservlet" method="post">
			<div>
				<label for="select">Select</label>
				<select name="select">
					<option value="user">User</option>
					<option value="admin">Admin</option>
				</select>
			</div><br>
			<div>
				<label for="username">Username</label>
				<input type="text" name="username" placeholder="username">
			</div>
			<div><br>
				<label for="password">Password</label>
				<input type="password" name="password" placeholder="password">
			</div><br>
			<a href="register.jsp">Register form</a><br><br>
			<button>Login</button>
		</form>
	</div>
	<%
		String username = request.getParameter("value");
		String pe =request.getParameter("page");
						
		if(username != null && pe != null){
			session.setAttribute("username", username);
			
			response.sendRedirect(pe);
		}
	
	
	%>
</body>
</html>