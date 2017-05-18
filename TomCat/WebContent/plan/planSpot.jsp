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

<!-- 장소 이미지(이미지 슬라이드) -->
<div class="planSpot_tb" style="border: 2px solid red;">
이미지 1 
</div>

<!-- 추가정보(검색설명) -->
<div class="tr_info" style="">추가 정보들</div>
<div class="clear"></div>

<!-- 장소 설명(db에서 받아온 설명) -->
<h1><%=ptb.getInfo() %></h1>

<!-- 월별 옷차림(검색) -->

<h3>월별 옷차림</h3>
<input type="button" value="1월" class="special">
<input type="button" value="2월">
<input type="button" value="3월">
<input type="button" value="4월">
<input type="button" value="5월">
<input type="button" value="6월">
<input type="button" value="7월">
<input type="button" value="8월">
<input type="button" value="9월">
<input type="button" value="10월">
<input type="button" value="11월">
<input type="button" value="12월">


<!-- 선물리스트(1위 2위 3위)(db에서 받아오기) -->

<h3>선물리스트</h3>

<!-- 장소에 대한 후기 작성 -->






</section>


<!-- footer -->
<jsp:include page="../inc/footer.jsp" />