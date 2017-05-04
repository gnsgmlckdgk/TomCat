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
<h3><a href="./.pln">여행등록</a></h3>
<table border="1">
<tr><td>myplans_id</td><td>id</td><td>plan_nr</td><td>travel_id</td><td>item_nr</td>
<td>firstday</td><td>lastday</td><td>day_nr</td><td>day_night</td><td>user_lat</td>
<td>user_lng</td><td>date</td><td>memo</td><td>plan_done_nr</td><td>수정/삭제</td></tr>
   <%
   for(int i=0;i<myplanList.size();i++){
	   MyPlanBean mpl=(MyPlanBean)myplanList.get(i);
	   %>
<tr><td><%=mpl.getMyplans_id() %></td><td><%=mpl.getId() %></td>
<td><%=mpl.getPlan_nr() %></td><td><%=mpl.getTravel_id() %></td>
<td><%=mpl.getItem_nr() %></td><td><%=mpl.getFirstday() %></td>
<td><%=mpl.getLastday() %></td><td><%=mpl.getDay_nr() %></td>
<td><%=mpl.getDay_night() %></td><td><%=mpl.getUser_lat() %></td>
<td><%=mpl.getUser_lng() %></td><td><%=mpl.getDate() %></td>
<td><%=mpl.getMemo() %></td><td><%=mpl.getPlan_done_nr() %></td>
<td><a href="./?num=<%=mpl.getId()%>">수정</a>
    /<a href="./?num=<%=mpl.getId()%>">삭제</a></td></tr>	   
	   <%
   }
   %>
</table>
</body>

<div class="clear"></div>
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
</html>