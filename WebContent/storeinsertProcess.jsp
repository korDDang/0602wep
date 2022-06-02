<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("utf-8");
PreparedStatement pstmt=null;
String storeCode=request.getParameter("storeCode");
String storeName=request.getParameter("storeName");
String Qty=request.getParameter("Qty");
String productCode=request.getParameter("productCode");

try{
	String sql="insert into store0602 values(?,?,?,?) ";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, storeCode);
	pstmt.setString(2, storeName);
	pstmt.setString(3, productCode);
	pstmt.setString(4, Qty);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("저장실패");
}
%>
</body>
</html>