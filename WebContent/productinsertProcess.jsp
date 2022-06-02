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
<%System.out.println("11111111");
request.setCharacterEncoding("utf-8");
System.out.println("2222221");
PreparedStatement pstmt=null;
System.out.println("333331");

String storeCode=request.getParameter("storeCode");
String unitPrice=request.getParameter("unitPrice");
String stockQty=request.getParameter("stockQty");
System.out.println("4444411");

String productCode=request.getParameter("productCode");

String productName=request.getParameter("productName");
System.out.println(productCode+productName);

try{
	String sql="insert into product0602 values(?,?,?,?,?) ";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productCode);
	pstmt.setString(2, productName);
	pstmt.setString(3, storeCode);
	pstmt.setString(4, unitPrice);
	pstmt.setString(5, stockQty);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("저장실패");
}
%>
</body>
</html>