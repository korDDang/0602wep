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
String inOutDate=request.getParameter("inOutDate");
String storeCode=request.getParameter("storeCode");
String gubun=request.getParameter("gubun");
String productCode=request.getParameter("productCode");
String saleQty=request.getParameter("saleQty");


try{
	String sql="insert into inOut0602 values(?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, inOutDate);
	pstmt.setString(2, storeCode);
	pstmt.setString(3, productCode);
	pstmt.setString(4, gubun);
	pstmt.setString(5, saleQty);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("저장실패");
}
%>
</body>
</html>