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
<section id="one" class="wrapper style1">
	<div class="container 75%">
		<div class="row 200%">
			<div class="6u 12u$(medium)">
				<header class="major">
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
				<iframe width="600em" height="400em" frameborder="0"
					style="border: 0"
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
			<br> <input type="button" class="button alt fit"
				onclick="location.href='#'" value="내가 작성하기" /> <br> <input
				type="button" value="전체" name="spotFilter"> <input
				type="button" value="관광지" name="spotFilter"> <input
				type="button" value="맛집" name="spotFilter"> <input
				type="button" value="숙소" name="spotFilter">

		</header>
		<div class="row 150%">


			<div class="6u 12u$(xsmall)">
				<div class="image fit captioned">
					<%-- 					<img class="img_sld1 w3-animate-fading" src="./upload/<%=pib.getFile()%>" alt="<%=region%> <%=pib.getType()%> <%=pib.getImg_info() %>" /> --%>
					<!-- 					<img class="img_sld1 w3-animate-fading" src="./images/pic03.jpg" alt="" /> -->

					<h3>
						<a href="./PlanRegion.pl?region='서울'" class="button special big">서울</a>
						<a href="./PlanRegion.pl?region='대전'" class="button special big">대전</a>
						<a href="./PlanRegion.pl?region='대구'" class="button special big">대구</a>
						<a href="./PlanRegion.pl?region='부산'" class="button special big">부산</a>

						<!-- svg 테스트 -->
<div>
						<script
							src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
						<script
							src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min.js"
							charset="utf-8"></script>

						<h1>svg를 이용해서 인터랙티브한 우리나라 지도 만들기</h1>
						<p>http://blog.dokenzy.com/archives/1071</p>
						<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							width="509px" height="716.105px" viewBox="0 0 509 716.105"
							enable-background="new 0 0 509 716.105" xml:space="preserve">
... 생략 ...
</svg>

						<script>
							$("g").mouseover(function(event) {
								var _path = event.target;
								var city_name = _path.id;
								var new_p = document.createElement('p');

								var province = $(_path).parent()[0].id;
								d3.select(_path).style("fill", "red");
								console.log(province, city_name);
							}).mouseout(function(event) {
								var _path = event.target;
								d3.select(_path).style("fill", "#B9B9B9");
							});
						</script>
						<!-- svg 테스트 -->
</div>


						<!-- 						<ul class="actions"> -->
						<!-- 							<li><a href="#" class="button special icon fa-download">찜</a></li> -->
						<!-- 						</ul> -->
					</h3>
				</div>
			</div>

		</div>

	</div>
</section>

<!-- Three -->
<section id="three" class="wrapper style1">
	<div class="container">
		<header class="major special">
			<h2><%=nation%>
				사진
			</h2>
			<!-- 			<p>Feugiat sed lorem ipsum magna</p> -->
		</header>

		<div class="feature-grid">

			<!-- 이미지 서치 시작.-->

			<script src="./assets/js/plan/daumSearch3.js"></script>

			<div id="daumForm">
				<input id="daumSearch" type="hidden" value="<%=nation%>+여행"
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

