<%@page import="net.plan.db.PlanCityBean"%>
<%@page import="net.plan.db.PlanCountryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
		
		<!-- 추가한 css -->
	<style type="text/css">
		
		section {
				text-align: center;
			}
		
			div.city_update {
				width: 80%;
				margin: -60px auto 30px auto;
				
				text-align: center;
			}
			
			div.city_update .btn_div {
				margin-top: 20px;
			}
	
	</style>

	</head>

<body>
<div class="clear"></div>
<%
	request.setCharacterEncoding("utf-8");
	
	String city_code=(String)request.getParameter("city_code");
	List countryList =(List)request.getAttribute("countryList");
	PlanCityBean pcb = (PlanCityBean)request.getAttribute("pcb");
	String pageNum = (String)request.getAttribute("pageNum");
%>

<section>

<div class="city_update">
	<form action="./CityUpdateAction.pl" name="city_fr" method="post">
		국가코드
		<select name="country_code">
			<option value=<%=pcb.getCountry_code() %>><%=pcb.getCountry_code() %></option>
			<%
				for(int i=0;i<countryList.size();i++){
					PlanCountryBean pcob = (PlanCountryBean)countryList.get(i);
					%>
					<option value="<%=pcob.getCountry_code() %>"><%=pcob.getName() %></option>
					<%
				}
			%>
		</select>  
		
		<!-- 도시 코드  ==> 도시영어이름과 동일 -->
		<input type="hidden" name="city_code" value="<%=city_code%>">
		
		도시 이름
		<input type="text" name="name" value="<%=pcb.getName()%>">
		
		도시 영어이름
		<input type="text" name="en_name" value="<%=pcb.getEn_name()%>">
		
		정보
		<textarea rows="10" cols="20" name="info"><%=pcb.getInfo()%></textarea>
	
		<div class="btn_div">
		<input type="submit"  value="수정" >
		<input type="reset"  value="다시쓰기" >
		</div>
		
	</form>
</div>

<!-- 뒤로가기 버튼 -->
<input type="button" class="button special" value="뒤로가기" onclick="history.back()">

</section>

<div class="clear"></div>

</body>
</html>