<%@page import="net.plan.db.PlanSouvenirBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Before you go</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		<!-- Scripts -->
		<script src="./assets/js/jquery.min.js"></script>
		<script src="./assets/js/skel.min.js"></script>
		<script src="./assets/js/util.js"></script>
		<script src="./assets/js/main.js"></script>

		<!-- 스타일 불러오기 -->
		<link rel="stylesheet" href="./assets/css/main.css?ver=3"/>
		<link rel="stylesheet" href="./assets/css/animate/animate.min.css"/>	<!-- 애니메이트 css -->
			
	</head>
<body>
<% 
	String city_code=request.getParameter("city_code");
	int num= Integer.parseInt(request.getParameter("num"));
	
	PlanSouvenirBean psb = (PlanSouvenirBean)request.getAttribute("psb");

%>
<div class="clear"></div>
<!-- 도시 기념품 수정하기 -->
<section>
	<div class="souvenirAdd">
		<form action="./SouvenirUpdateAction.pl" name="sou_fr" method="post" enctype="multipart/form-data">
			<input type="hidden" value="<%=num%>" name=num>
			<label>도시</label>
			<input type="text" value="<%=city_code%>" name="city_code" readonly>
			
			<label>순위</label>
			<input type="text" name="ranking" value="<%=psb.getRanking()%>">
			
			<label>이름</label>
			<input type="text" name="name" value="<%=psb.getName()%>">
			
			<label>이미지 : <%=psb.getImg()%></label>
			<input type="file" name="img" >
			<input type="hidden" name="img2" value="<%=psb.getImg()%>">
			
			<label>설명</label>
			<textarea rows="10" cols="20" name="info" value="<%=psb.getInfo()%>"></textarea>
			
			<input type="submit" value="추가하기">
			
			<div class="clear"></div>	
		</form>
	</div>

</section>

<!-- footer -->
</body>
</html>