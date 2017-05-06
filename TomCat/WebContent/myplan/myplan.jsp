
<%@page import="net.myplanBasket.db.MyPlanBasketBean"%>
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
<h1>여행장바구니</h1>
<h3><a href="./MyPlanModify.pln">일정만들기편집</a></h3>
<table border="1">
<tr><td>myplans_id</td><td>id</td><td>plan_nr</td><td>travel_id</td><td>item_nr</td>
<td>firstday</td><td>lastday</td><td>day_nr</td><td>day_night</td><td>user_lat</td>
<td>user_lng</td><td>date</td><td>memo</td><td>plan_done_nr</td><td>수정/삭제</td></tr>
  	<%
   for(int i=0;i<myplanList.size();i++){
	   MyPlanBasketBean mpbb=(MyPlanBasketBean)myplanList.get(i);
	%>
<tr><td><%=mpbb.getMyplans_id() %></td><td><%=mpbb.getId() %></td>
<td><%=mpbb.getPlan_nr() %></td><td><%=mpbb.getTravel_id() %></td>
<td><%=mpbb.getItem_nr() %></td><td><%=mpbb.getFirstday() %></td>
<td><%=mpbb.getLastday() %></td><td><%=mpbb.getDay_nr() %></td>
<td><%=mpbb.getDay_night() %></td><td><%=mpbb.getUser_lat() %></td>
<td><%=mpbb.getUser_lng() %></td><td><%=mpbb.getDate() %></td>
<td><%=mpbb.getMemo() %></td><td><%=mpbb.getPlan_done_nr() %></td>
<td><a href="./?num=<%=mpbb.getId()%>">수정</a>
    /<a href="./?num=<%=mpbb.getId()%>">삭제</a></td></tr>	   
	   
 
</table>
<iframe
  width="600"
  height="450"
  frameborder="0" style="border:0"
  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAwZMwcmxMBI0VQAUkusmqbMVHy-b4FuKQ
    &q=<%=mpbb.getUser_lat() %>,<%=mpbb.getUser_lng() %>" allowfullscreen>
</iframe>
	<%
 	 }
   %>
   
</body>

<div class="clear"></div>
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
</html>