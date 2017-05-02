<%@page import="net.myplan.admin.db.MyPlanBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<!-- 스타일 불러오기 -->
<link rel="stylesheet" href="assets/css/main.css" />

<body>

<%
// request.setAttribute("myplanList", myplanList);
List myplanList=(List)request.getAttribute("myplanList");
%>
<h1>나의 여행 일정</h1>
<h3><a href="./TravelDataAdmin.pln">여행등록</a></h3>
<table border="1">
<tr><td>여행타입</td><td>국가</td><td>도시</td><td>이름</td><td>소개</td><td>주소</td><td>수정/삭제</td></tr>
   <%
   for(int i=0;i<myplanList.size();i++){
	   MyPlanBean mpl=(MyPlanBean)myplanList.get(i);
	   %>
<tr><td><%=mpl.getType() %></td><td><%=mpl.getCountry_code() %></td>
<td><%=mpl.getCity_code() %></td><td><%=mpl.getName() %></td>
<td><%=mpl.getInfo() %></td>
<td><%=mpl.getAddress() %></td>
<td><a href="./?num=<%=mpl.getType()%>">수정</a>
    /<a href="./?num=<%=mpl.getType()%>">삭제</a></td></tr>	   
	   <%
   }
   %>
</table>
</body>

<div class="clear"></div>
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
</html>