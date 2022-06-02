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
	if(doc.storeName.value==""){
		alert("매장명이 입력되지 않았습니다");
		doc.storeName.focus();
	}else if(doc.productCode.value==""){
		alert("상품코드가 입력되지 않았습니다");
		doc.productCode.focus();
	
		
	}else{
		alert("매장 테이블 등록 성공");
		form.action="storeinsertProcess.jsp";
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
	String sql="select sq2.nextval from dual";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1);
	
	}
}catch(SQLException e){
	e.printStackTrace();
}
String storeCode=request.getParameter("storeCode");
String storeName="";
String productName=request.getParameter("productName");
String Qty=request.getParameter("Qty");
String productCode=request.getParameter("productCode");

if(productName==null){
	productName="";
}
if(Qty==null){
	Qty="";
}
try{
	String sql="select productName from product0602 where productCode=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,  productCode);
	rs=pstmt.executeQuery();
	if(rs.next()){
		 productName=rs.getString("productName");
	
	}else if(productCode==null){
		productCode="";
	}else{
		%>
		<script>
		alert("등록되어 있지 않는 상품코드 입니다.");
		</script>
		<%
	}
	
	
}catch(SQLException e){
	e.printStackTrace();
}
%>
<h2>매장 등록 화면</h2>
<form name="form" method="post" action="storeinsert.jsp">
<table border="1" id="tab1">
<tr>
<th>매장 코드(자동생성)</th>
<td>
<input type="text" name="storeCode" value="<%=ma %>">
</td>
</tr>
<tr>
<th>매 장 명</th>
<td>
<input type="text" name="storeName" value="<%=storeName %>">
</td>
</tr>
<tr>
<th>상품코드</th>
<td>
<input type="text" name="productCode" onchange="check1()" value="<%=productCode %>"></td>
</tr>
<tr>
<th>상품명</th>
<td>
<input type="text" name="productName" value="<%=productName %>"></td>
</tr>
<tr>
<th>수량</th>
<td>
<input type="text" name="Qty" value="<%=Qty%>"></td>
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