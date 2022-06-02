<%@ page import="java.text.DecimalFormat" %>
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
<h2>출고 정보(금액)목록</h2>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int no=0;
String in="";
String out1="";
double sum1=0;
DecimalFormat fo=new DecimalFormat();
%>
<table border="1" id="tab1">
<tr>
<th>no</th>
<th>입.출고일자</th>
<th>매장코드</th>
<th>매 장 명</th>
<th>상품코드</th>
<th>상 품 명</th>
<th>출고 수량</th>
<th>단가</th>
<th>출고 금액</th>
<th>할인된금액<br>(10%)</th>
</tr>
<%
try{
	String sql="select to_char(i.inOutDate,'YYYY-MM-DD'),s.storeCode,s.storeName,s.productCode,p.productName,i.saleQty,p.unitPrice from product0602 p,store0602 s,inOut0602 i where p.storeCode=s.storeCode and p.storeCode=i.storeCode and gubun=2 ";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String inOutDate=rs.getString(1);
		String storeCode=rs.getString("storeCode");
		String storeName=rs.getString("storeName");
		String productCode=rs.getString("productCode");
		String productName=rs.getString("productName");
		int saleQty=rs.getInt("saleQty");
		int unitPrice=rs.getInt("unitPrice");
		int sum=saleQty*unitPrice;
		if(saleQty>=5){
		 sum1=(saleQty*unitPrice)*0.9;
		}else if(saleQty<5){
			sum1=saleQty*unitPrice;
				}
		no++;
	



%>
<tr>
<td><%=no %></td>
<td><%=inOutDate %></td>
<td><%=storeCode %></td>
<td><%=storeName %></td>
<td><%=productCode %></td>
<td><%=productName %></td>
<td><%=saleQty %></td>
<td><%=unitPrice%></td>
<td><%=sum %></td>
<td><%=fo.format(sum1) %></td>
</tr>
<% 
}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<div style="text-align: center;"><input type="button" value="입출고 정보 추가" onclick="location.href='productinsert.jsp'" id="bt1"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>