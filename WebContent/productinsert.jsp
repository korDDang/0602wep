<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check1(){
	document.form.submit();
}

function check() {
	var doc=document.form;
	if(doc.productName.value==""){
		alert("상품명이 입력되지 않았습니다");
		doc.productName.focus();
	}else if(doc.storeCode.value==""){
		alert("매장코드가 입력되지 않았습니다");
		doc.storeCode.focus();
	}else if(doc.storeName.value==""){
		alert("매장명이 입력되지 않았습니다");
		doc.storeName.focus();
	}else if(doc.unitPrice.value==""){
		alert("단가가 입력되지 않았습니다");
		doc.unitPrice.focus();
	}else if(doc.stockQty.value==""){
		alert("재고수량이 입력되지 않았습니다");
		doc.stockQty.focus();
	
		
	}else{
		alert("상품 테이블 등록 성공");
		form.action="productinsertProcess.jsp";
	}
}

</script>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section id="sec1"> 
<%@include file="DBConn.jsp" %>

<%
int ma=0;
request.setCharacterEncoding("utf-8");
ResultSet rs=null;
PreparedStatement pstmt=null;
try{
	String sql="select max(productCode) from product0602 ";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1)+1;
	}else{
		ma=1;
	}
}catch(SQLException e){
	e.printStackTrace();
}
String storeCode=request.getParameter("storeCode");
String storeName="";
String productName=request.getParameter("productName");
String unitPrice=request.getParameter("unitPrice");
String stockQty=request.getParameter("stockQty");
if(unitPrice==null){
	unitPrice="";
}
if(productName==null){
	productName="";
}
if(stockQty==null){
	stockQty="";
}
try{
	String sql="select storeName from store0602 where storeCode=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,  storeCode);
	rs=pstmt.executeQuery();
	if(rs.next()){
		 storeName=rs.getString("storeName");
	
	}else if(storeCode==null){
		storeCode="";
	}else{
		%>
		<script>
		alert("등록되어 있지 않는 매장코드 입니다.");
		</script>
		<%
	}
	
	
}catch(SQLException e){
	e.printStackTrace();
}
%>
<h2>상품 등록 화면</h2>
<form name="form" method="post" action="productinsert.jsp">
<table border="1" id="tab1">
<tr>
<th>상품 코드(자동생성)</th>
<td>
<input type="text" name="productCode" value="<%=ma %>">
</td>
</tr>
<tr>
<th>상 풍 명</th>
<td>
<input type="text" name="productName" value="<%=productName %>">
</td>
</tr>
<tr>
<th>매장코드</th>
<td>
<input type="text" name="storeCode" onchange="check1()" value="<%=storeCode %>"></td>
</tr>
<tr>
<th>매 장 명</th>
<td>
<input type="text" name="storeName" value="<%=storeName %>"></td>
</tr>
<tr>
<th>단가</th>
<td>
<input type="text" name="unitPrice" value="<%=unitPrice %>"></td>
</tr>
<tr>
<th>재고수량</th>
<td>
<input type="text" name="stockQty" value="<%=stockQty %>"></td>
</tr>
<tr>
<td colspan="2" id="td1">
<input type="submit" value="등록" onclick="check()">
<input type="reset" value="취소">
</td>
</tr>
</table>
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>