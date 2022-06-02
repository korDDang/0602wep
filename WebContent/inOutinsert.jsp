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
	if(doc.inOutDate.value==""){
		alert("입출고일자를 입력하지 않았습니다");
		doc.inOutDate.focus();
		
	}else{
		alert("입출고 테이블 등록 성공");
		form.action="inOutinsertProcess.jsp";
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

request.setCharacterEncoding("utf-8");
ResultSet rs=null;
PreparedStatement pstmt=null;

String storeCode=request.getParameter("storeCode");
String storeName="";
String productCode=request.getParameter("productCode");
String productName=request.getParameter("productName");
String unitPrice=request.getParameter("unitPrice");
String saleQty=request.getParameter("saleQty");
String inOutDate=request.getParameter("inOutDate");
if(unitPrice==null){
	unitPrice="";
}
if(productName==null){
	productName="";
}
if(saleQty==null){
	saleQty="";
}
if(productCode==null){
	productCode="";
	}
if(inOutDate==null){
	inOutDate="";
}
try{
	String sql="select storeName,productName from store0602 s,product0602 p where p.productCode=s.productCode and s.storeCode=? and s.productCode=? ";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,  storeCode);
	pstmt.setString(2,  productCode);
	rs=pstmt.executeQuery();
	if(rs.next()){
		 storeName=rs.getString("storeName");
		 productName=rs.getString("productName");
	
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
<h2>입출고 정보 등록</h2>
<form name="form" method="post" action="inOutinsert.jsp">
<table border="1" id="tab1">
<tr>
<th>입출고일자</th>
<td colspan="4">
<input type="text" name="inOutDate" value="<%=inOutDate %>">
</td>
</tr>
<tr>
<th>매장코드</th>
<td>
<input type="text" name="storeCode" value="<%=storeCode%>">
</td>
<th>매 장 명</th>
<td><input type="text" name="storeName" value="<%=storeName %>"></td>
</tr>
<tr>
<th>상품코드</th>
<td>
<input type="text" name="productCode" onchange="check1()" value="<%=productCode %>"></td>
<th>상품명</th>
<td><input type="text" name="productName" value="<%=productName%>"></td>
</tr>
<tr>
<th>입출고구분</th>
<td colspan="4">
<input type="radio" name="gubun" value="1">입고
<input type="radio" name="gubun" value="2">출고
</td>
</tr>
<tr>
<th>입출고 수량</th>
<td>
<input type="text" name="saleQty" value="<%=saleQty%>"></td>
<th>입출고 금액</th>
<td><input type="text" name="unitPrice" value="<%=unitPrice %>"></td>
</tr>
<tr>
<td colspan="4" id="td1">
<input type="button" value="목록" onclick="location.href='inOutselect.jsp'">
<input type="submit" value="저장" onclick="check()">
</td>
</tr>
</table>
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>