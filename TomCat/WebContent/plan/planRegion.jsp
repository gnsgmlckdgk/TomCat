<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- Banner -->
<!-- <section id="banner"> -->

<%String region = request.getParameter("region"); %>

<%-- 	<h2><%=region %></h2> --%>
<!-- 	<p> -->
<!-- 		지역 목록의 링크 <br /> 타고오는 페이지 -->
<!-- 	</p> -->
	<!-- 	<ul class="actions"> -->
	<!-- 		<li><a href="#" class="button special big">함께해요</a></li> -->
	<!-- 	</ul> -->
<!-- </section> -->

<!-- One -->
<section id="one" class="wrapper style1">
	<div class="container 75%">
		<div class="row 200%">
			<div class="6u 12u$(medium)">
				<header class="major">
					<h2><%=region %> 설명</h2>
					<p>Perspiciatis 펄스피치아티스 <br>doloremque recusandae dolor</p>
				</header>
			</div>
			<div class="6u$ 12u$(medium)">
				<p>http://blog.acronym.co.kr/337 <br>
				https://ko.wikipedia.org/wiki/%EB%89%B4%EC%9A%95</p>
				<p>이 부분까지 위키피디아에서 파싱?</p>
			</div>
		</div>
	</div>
</section>

<!-- Two -->
<section id="two" class="wrapper style2 special">
	<div class="container">
		<header class="major">
			<h2>관광지 . 맛집 . 숙소</h2>
			<p>개발자의 추천</p>
		</header>
		<div class="row 150%">
			<div class="6u 12u$(xsmall)">
				<div class="image fit captioned">
					<img src="./images/pic02.jpg" alt="" />
					<h3>Lorem ipsum dolor sit amet.</h3>
				</div>
			</div>
			<div class="6u$ 12u$(xsmall)">
				<div class="image fit captioned">
					<img src="./images/pic03.jpg" alt="" />
					<h3>Illum, maiores tempora cupid?</h3>
				</div>
			</div>
		</div>
		<ul class="actions">
			<li><a href="#" class="button special big">Nulla luctus</a></li>
			<li><a href="#" class="button big">Sed vulputate</a></li>
		</ul>
	</div>
</section>

<!-- Three -->
<section id="three" class="wrapper style1">
	<div class="container">
		<header class="major special">
			<h2><%=region %> 사진</h2>
			<p>Feugiat sed lorem ipsum magna</p>
		</header>

		<div class="feature-grid">

			<!-- 이미지 서치 시작.-->
			
			<script src="./assets/js/plan/daumSearch3.js"></script>

			<div id="daumForm">
				<input id="daumSearch" type="hidden" value="<%=region %>+여행"
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