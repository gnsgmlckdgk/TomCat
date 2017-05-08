
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


</body>

<div class="clear"></div>
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
</html>