<%@page import="net.plan.db.PlanTravelBean"%>
<%@page import="net.plan.db.PlanCountryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./assets/css/plan/planSpot.css"/>

<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" />


<%
	PlanTravelBean ptb = (PlanTravelBean)request.getAttribute("ptb");

%>

<!-- 본문 -->
<section class = "planSpot">
<h2><%=ptb.getName() %><span><%=ptb.getAddress() %></span></h2>


<!-- 찜하기 버튼 추가 -->

<!-- 장소 이미지 -->
<table class="planSpot_tb">
<tr>
<td>이미지 1</td>
<td>이미지 2</td>
<td>이미지 3</td>
</tr>
</table>

<!-- 장소 설명 -->
<h1><%=ptb.getInfo() %></h1>

<!-- 추가정보) -->
<div>추가 정보들</div>

</section>


<!-- footer -->
<jsp:include page="../inc/footer.jsp" />