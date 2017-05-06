
<%@page import="net.travel.admin.db.TravelBean"%>
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
//request.setAttribute("basketList", basketList);
//request.setAttribute("goodsList", goodsList);
List basketList=(List)request.getAttribute("basketList");
List goodsList=(List)request.getAttribute("goodsList");
%>
<h1>여행장바구니<%=basketList.size()%><%=goodsList.size()%></h1>
<table border="1">
<tr><td>myplans_id</td><td>id</td>
<td>plan_nr</td><td>travel_id</td>
<td>item_nr</td><td>name</td>
<td>lat</td><td>lng</td>
<td>address</td></tr>
  	<%
   for(int i=0;i<basketList.size();i++){
	   MyPlanBasketBean mpbb=(MyPlanBasketBean)basketList.get(i);
		TravelBean tb=(TravelBean)goodsList.get(i);
	%>
<tr><td><%=mpbb.getMyplans_id() %></td><td><%=mpbb.getId() %></td>
<td><%=mpbb.getPlan_nr() %></td><td><%=mpbb.getTravel_id() %></td>
<td><%=mpbb.getItem_nr() %></td><td><%=tb.getName()%></td>
<td>
<iframe
  width="600"
  height="450"
  frameborder="0" style="border:0"
  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAwZMwcmxMBI0VQAUkusmqbMVHy-b4FuKQ
    &q=<%=mpbb.getUser_lat() %>,<%=mpbb.getUser_lng() %>" allowfullscreen>
</iframe>
</td>
<td><%=tb.getAddress()%></td>
<td><a href="./MyPlanModify.pln?myplans_id=<%=mpbb.getMyplans_id()%>">일정만들기편집</a>/<a href="./MyPlanDelete.ag?myplans_id=<%=mpbb.getMyplans_id()%>">삭제</a></td></tr>	   
	<%
 	 }
   %></table>

</body>

<div class="clear"></div>
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
</html>