<%@page import="net.plan.db.PlanImageBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<!-- Banner -->
<!-- <section id="banner"> -->
<link rel="stylesheet" href="./assets/css/map/map.css" />
<%
	String nation = request.getParameter("nation");
	String id = (String) session.getAttribute("id");
%>
<!-- One 지역명 및 설명-->
<section id="banner">
	<div class="container 75%">
		<div class="row 200%">
			<div class="6u 12u$(medium)">
				<h2><%=nation%>
					설명
				</h2>
				<p>
					Perspiciatis 펄스피치아티스 <br>doloremque recusandae dolor
				</p>
				<br>
				<p>
					http://blog.acronym.co.kr/337 <br>
					https://ko.wikipedia.org/wiki/%EB%89%B4%EC%9A%95
				</p>
				<br>
				<p>이 부분까지 위키피디아에서 파싱???</p>


				</header>
			</div>
			<div class="6u$ 12u$(medium)">
				<!-- 수현씨 지도 부분 -->
				<iframe width="600" height="450" frameborder="0" style="border: 0"
					src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAwZMwcmxMBI0VQAUkusmqbMVHy-b4FuKQ&q=<%=nation%>"
					allowfullscreen> </iframe>
			</div>
			<!-- 수현씨 지도 부분 끝 -->
		</div>
	</div>
</section>
<!-- Two -->
<section id="two" class="wrapper style2 special">
	<div class="container">
		<header class="major">
			<h2>관광지 . 맛집 . 숙소</h2>
			<p>
				<%=nation%>에 있습니다!
			</p>

		</header>
		<div class="row 150%">
			<div class="6u 12u$(xsmall)">
				<div class="image fit captioned">
					<h3>
					
						민정씨 국가 리스트 참조해서 지역 리스트 만들 부분. 갤러리 형식? 게시판 형식?
					<br>
					DB에서 받아오기? 직접 코딩하기?
					<br><br><br>
					
						<a href="./PlanRegion.pl?region='서울'" class="button special big">서울</a><br>
						<a href="./PlanRegion.pl?region='대전'" class="button special big">대전</a><br>
						<a href="./PlanRegion.pl?region='대구'" class="button special big">대구</a><br>
						<a href="./PlanRegion.pl?region='부산'" class="button special big">부산</a><br>
					</h3>
				</div>

			</div>
		</div>

	</div>

	</div>
</section>

<!-- Three -->
<section id="three" class="wrapper style1">
	<div class="container">
		<header class="major special">
			<h2><%=nation %>
				사진
			</h2>
			<!-- 			<p>Feugiat sed lorem ipsum magna</p> -->
		</header>

		<div class="feature-grid">

			<!-- 이미지 서치 시작.-->

			<script src="./assets/js/plan/daumSearch3.js"></script>

			<div id="daumForm">
				<input id="daumSearch" type="hidden" value="<%=nation %>+여행"
					onkeydown="javascript:if(event.keyCode == 13) daumSearch.search();" />
				<!-- 				<input id="daumSubmit" onclick="javascript:daumSearch.search()" -->
				<!-- 					type="submit" value="검색" /> -->
			</div>

			<div id="daumView">
				<div id="daumImage"></div>
			</div>

			<div id="daumScript">
				<div id="daumImageScript"></div>
			</div>
		</div>
		<!-- 이미지 서치 끝. -->


	</div>
	</div>
</section>

<!-- Four -->
<section id="four" class="wrapper style3 special">
	<div class="container">
		<header class="major">
			<h2>Aenean elementum ligula</h2>
			<p>Feugiat sed lorem ipsum magna</p>
		</header>
		<ul class="actions">
			<li><a href="#" class="button special big">Get in touch</a></li>
		</ul>
	</div>
</section>

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />

