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
			<!-- plan -->
			<link rel="stylesheet" href="./assets/css/plan/planMain.css?ver=20"/>	<!-- 메인페이지 -->
			<link rel="stylesheet" href="./assets/css/plan/planNation.css?ver=23"/>	<!-- 국가페이지 -->
			<link rel="stylesheet" href="./assets/css/plan/planResion.css?ver=23"/>	<!-- 지역(도시)페이지 -->
			
		<style type="text/css">
			section.cityList {
				position: relative;
				top: -70px;
				padding: 10px;
			}
			
			section.cityList .list_div tr {
				display: block;
			}
			
			section.cityList .list_div th:nth-of-type(1), section.cityList .list_div td:nth-of-type(1) {
				width: 130px;
			}
			section.cityList .list_div th:nth-of-type(2), section.cityList .list_div td:nth-of-type(2) {
				width: 120px;
			}
			section.cityList .list_div th:nth-of-type(3), section.cityList .list_div td:nth-of-type(3) {
				width: 100px;
			}
			section.cityList .list_div th:nth-of-type(4), section.cityList .list_div td:nth-of-type(4) {
				width: 150px;
			}
			section.cityList .list_div th:nth-of-type(5), section.cityList .list_div td:nth-of-type(5) {
				width: 540px;
			}
			section.cityList .list_div th:nth-of-type(6), section.cityList .list_div td:nth-of-type(6) {
				width: 220px;
			}
		</style>
			
	</head>

<body>
<div class="clear"></div>

<section class="cityList">
<%
	List cityList = (List)request.getAttribute("cityList"); 
	String pageNum=(String)request.getAttribute("pageNum");
	int count=((Integer)request.getAttribute("count")).intValue();
	int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
	int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
	int startPage=((Integer)request.getAttribute("startPage")).intValue();
	int endPage=((Integer)request.getAttribute("endPage")).intValue();
%>
<div class = "list_div">
<h3>DB 도시 개수 :<%=count %> </h3>

	<!-- 국가 리스트 출력 -->
	<table border="1">
		<tr>
			<th>도시 코드</th>
			<th>도시 이름</th>
			<th>국가 코드</th>
			<th>영어 이름</th>
			<th>정보</th>
			<th>수정 / 삭제</th>
		</tr>
		
		<%
		for (int i=0; i<cityList.size();i++){
			PlanCityBean pcb = (PlanCityBean)cityList.get(i);
		%>
		<tr>
			<td><%=pcb.getCity_code() %></td>
			<td><%=pcb.getName() %></td>
			<td><%=pcb.getCountry_code() %></td>
			<td><%=pcb.getEn_name() %></td>
			<td><%=pcb.getInfo() %></td>
			
			<td>
				<input type = "button" name="update" value="수정" onclick="location.href='./CityUpdate.pl?pageNum=<%=pageNum%>&city_code=<%=pcb.getCity_code() %>'">
				<input type = "button" name="delete" value="삭제" onclick="location.href='./CityDelete.pl?pageNum=<%=pageNum%>&city_code=<%=pcb.getCity_code() %>'">
			</td>
			
		</tr>
		<%}//for %>
	</table>
	
	<!-- 페이지 출력 -->
	<%	
	if(count != 0){
	if(startPage>pageBlock){
	%><a href="./CityList.pl?pageNum=<%=startPage - pageBlock%>" <%=startPage - pageBlock%>">[이전]</a>	
	<%}//if
	
	for (int i = startPage; i <= endPage; i++) {
	%><a href="./CityList.pl?pageNum=<%=i%>">[<%=i%>]</a>
	<%}//for
	
	if (endPage < pageCount) {
	%><a href="./CityList.pl?pageNum=<%=startPage + pageBlock%>">[다음]</a>
	<%
		}//if
	}//if
	%>	
	
	<!-- 국가 추가 버튼 -->
	<input type="button" onclick="location.href='./CityAddForm.pl'" value="도시 추가하기">	
</div>
</section>

</body>
</html>
