<%@page import="oracle.jdbc.OracleDriver"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
Connection conn=null;
try{
	String url="jdbc:oracle:thin:@//localhost:1521/xe";
	String user="system";
	String pass="1234";
	String driver="oracle.jdbc.OracleDriver";
	Class.forName(driver);
	conn=DriverManager.getConnection(url, user, pass);
	System.out.println("데이터베이스 연결성공");
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("데이터베이스 연결실패");
}
%>
</body>
</html>