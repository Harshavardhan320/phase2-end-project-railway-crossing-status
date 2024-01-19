<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("username") == null || session.getAttribute("username").equals("")){
	response.sendRedirect("Index.jsp");
}else{
	session.invalidate();
	response.sendRedirect("Index.jsp");
}


%>