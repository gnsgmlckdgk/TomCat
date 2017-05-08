<%@page import="temp.MyPlanBean"%>
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
<link rel="stylesheet" href="assets/css/map/myplanModify.css" />

<body>
	<%
		List basketList=(List)request.getAttribute("basketList");
		List goodsList=(List)request.getAttribute("goodsList");
		String id = (String) session.getAttribute("id");	
		MyPlanBasketBean mpbb = (MyPlanBasketBean)request.getAttribute("mpbb");
		System.out.println("jsp진입");
	%>

<h1>일정편집</h1>
<form action="./MyPlanModifyAction.pln" method="post">
<input type="hidden">
<table border="1" class="tg">
  <tr>
    <th class="tg-031e" rowspan="2">1일차</th>
    <th class="tg-031e">낮</th>
    <td class="tg-yw4l">일정추가1</td>
  </tr>
  <tr>
    <th class="tg-yw4l">밤</th>
    <td class="tg-yw4l">일정추가2</td>
  </tr>
   <tr>
    <th class="tg-031e" rowspan="2">2일차</th>
    <th class="tg-031e">낮</th>
    <td class="tg-yw4l">일정추가3</td>
  </tr>
  <tr>
    <th class="tg-yw4l">밤</th>
    <td class="tg-yw4l">일정추가4</td>
  </tr>
   <tr>
    <th class="tg-031e" rowspan="2">3일차</th>
    <th class="tg-031e">낮</th>
    <td class="tg-yw4l">일정추가5</td>
  </tr>
  <tr>
    <th class="tg-yw4l">밤</th>
    <td class="tg-yw4l">일정추가6</td>
  </tr> 
  <tr><td colspan="3"><input type="submit" value="일정수정">
<input type="reset" value="다시등록"></td></tr>
</table>
</form>
</body>

<div class="clear"></div>
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
</html>