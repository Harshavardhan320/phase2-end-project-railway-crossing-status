<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
</head>
<body>

	<div style="text-align:center;border-color: 2px solid black">
		<h1>Railway Crossing</h1>
		<h3>User Register</h3><br><br>
		<form action="Registerservlet" method="post">
			<div>
				<label for="username">Username</label>
				<input type="text" name="username" placeholder="password">
			</div>
			<div><br>
				<label for="password">Password</label>
				<input type="password" name="password" placeholder="password">
			</div><br>
			<button>Register</button>
		</form>
	</div>

</body>
</html>