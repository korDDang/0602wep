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
<h2>매장 정보 목록</h2>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int cnt=0;
int no=0;
try{
	String sql="select count(storeCode)from store0602";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div id="cnt1">총  <%=cnt %>개의 상품정보가 있습니다.</div>
<table border="1" id="tab1">
<tr>
<th>no</th>
<th>매장코드</th>
<th>매 장 명</th>
<th>상품코드</th>
<th>상 품 명</th>
<th>상품수량</th>
<th>관리</th>
</tr>
<%
try{
	String sql="select s.storeCode,s.storeName,p.productCode,p.productName,s.Qty from product0602 p,store0602 s where p.storeCode=s.storeCode  ";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String productCode=rs.getString("productCode");
		String productName=rs.getString("productName");
		String storeCode=rs.getString("storeCode");
		String storeName=rs.getString("storeName");
		String Qty=rs.getString("Qty");
		no++;
	



%>
<tr>
<td><%=no %></td>
<td id="td2"><%=storeCode %></td>
<td><%=storeName %></td>
<td><%=productCode %></td>
<td><%=productName%></td>
<td><%=Qty %></td>
<td><a href="#">삭제</a></td>
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