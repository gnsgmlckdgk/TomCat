<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" />

<!-- 메인 -->

<!-- 대륙별 국가리스트 출력 -->
<script>
	window.onload=CountryList();
</script>

<%
	/* 대륙 리스트 */
	String[] cont = { "아시아", "유럽", "남태평양", "북미", "중남미" };
%>

<div class="clear"></div>

<section class="planMain">
	<div>
		<!-- 검색폼 -->
		<div class="Search">
			<form name="fr" action="./PlanSearch.pl" class="plan_search" method="post" onsubmit="return checkSearch();">
				<h2>어디로 여행을 가시나요?</h2>
				<select name="check" class="check_search">
					<option value="0">선택해주십시오</option>
					<option value="1">국가명</option>
					<option value="2">도시명</option>
				</select> 
				<input type="text" name="search" value="" class="search_text">
				<input type="submit" value="검색" class="serch_button">
			</form>
		</div>
		
	<hr><div class="clear"></div>
	
		<!-- 인기여행지 리스트(대륙별 도시추천) -->
		<div class="bestTrip">
			<h2>인기여행지</h2>
			<div class="bestTripMenu">
				<ul class="bestTrip_cont">
					<li><a href="#">추천</a></li>
					<li><a href="#">아시아</a></li>
					<li><a href="#">유럽</a></li>
					<li><a href="#">남태평양</a></li>
					<li><a href="#">북미</a></li>
					<li><a href="#">중남미</a></li>
				</ul>
			</div>
		
	<div class="clear"></div>
	
		<!-- 인기여행지 이미지리스트(대륙별 도시추천) -->
			<div class="bestTripimg">
			<table border="1">
					<tr>
						<td><img alt="" src="./images/pic01.jpg" width="350em" height="300em"></td>
						<td><img alt="" src="./images/pic02.jpg" width="350em" height="300em"></td>
						<td><img alt="" src="./images/pic03.jpg" width="350em" height="300em"></td>
						<td><img alt="" src="./images/pic04.jpg" width="350em" height="300em"></td>
					</tr>
					<tr>
						<td><img alt="" src="./images/pic04.jpg" width="350em" height="300em"></td>
						<td><img alt="" src="./images/pic03.jpg" width="350em" height="300em"></td>
						<td><img alt="" src="./images/pic05.jpg" width="350em" height="300em"></td>
						<td><img alt="" src="./images/pic06.jpg" width="350em" height="300em"></td>
					</tr>
				</table>
			</div>
		</div>
	
	<div class="clear"></div>
	
		<!-- 국가 리스트  -->
		<div class="countryList" >
			<h2>국가 리스트</h2>
			<%
				for (int j = 0; j < 5; j++) {
			%>
			<h3><%=cont[j]%></h3>
			<div class="<%=cont[j]%>"></div>
			<div class="clear"></div>
			<%
				}
			%>
		</div>
	</div>
</section>

<!-- footer -->
<jsp:include page="../inc/footer.jsp" />