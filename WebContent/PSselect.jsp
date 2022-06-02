<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section id="sec1">
<%@ include file="DBConn.jsp" %> 
<br>
<h2>상품/매장 정보 목록</h2>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int no=0;
%>
<table border="1" id="tab1">
<tr>
<th>no</th>
<th>상품코드</th>
<th>상품명</th>
<th>매장코드</th>
<th>매 장 명</th>
<th>단 가</th>
<th>수 량</th>
</tr>
<%
try{
	String sql="select p.productCode,p.productName,p.storeCode,s.storeName,p.unitPrice,p.stockQty from product0602 p,store0602 s where p.storeCode=s.storeCode  ";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String productCode=rs.getString("productCode");
		String productName=rs.getString("productName");
		String storeCode=rs.getString("storeCode");
		String storeName=rs.getString("storeName");
		String unitPrice=rs.getString("unitPrice");
		String stockQty=rs.getString("stockQty");
		no++;
	



%>
<tr>
<td><%=no %></td>
<td id="td2"><%=productCode %></td>
<td><%=productName %></td>
<td><%=storeCode %></td>
<td><%=storeName %></td>
<td><%=unitPrice %></td>
<td><%=stockQty %></td>
</tr>
<% 
}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<div style="text-align: center;"><input type="button" value="상품 정보 추가" onclick="location.href='productinsert.jsp'" id="bt1"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>