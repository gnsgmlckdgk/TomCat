
<%@page import="net.plan.db.PlanCityBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<!-- Banner -->
<!-- <section id="banner"> -->

<%
	String nation = request.getParameter("nation");	// 국가명
	String id = (String) session.getAttribute("id");
%>
<!-- One 지역명 및 설명-->
<section id="banner">
	<div class="container 75%">
		<div class="row 200%">
			<div class="6u 12u$(medium)">
				<h2><%=nation%>
					
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

<!-- Two 국가의 지역 리스트 -->
<section id="nation_two" class="wrapper style2 special">

<!-- Two 섹션 스크립트 -->
<script type="text/javascript">

// 페이지에 처음 왔을때 도시 리스트를 불러옴, 페이지번호는 1로 시작
$(window).load(function() {
	$.ajax({
		type: 'post',
		url: './plan/planNationCityList.jsp',
		data : {nation:'<%=nation%>', pageNum:'1'},
		success: function(data) {
			$('.city_list_div').append(data);
		},
		error: function(xhr, status, error) {
	        alert(error);
	    }   
	});
});

// 페이지 번호를 눌렸을때 그에 맞는 게시글을 불러옴
function cityListChange(pageNum) {
	
		$.ajax({
			type: 'post',
			url: './plan/planNationCityList.jsp',
			data : {nation:'<%=nation%>', pageNum: pageNum},
			success: function(data) {
				$('.city_list_div').empty();
				$('.city_list_div').append(data);
			},
			error: function(xhr, status, error) {
				alert("code:"+status+"\n"+"message: 8번째 페이지 이동시 멈춤..."+"\n"+"error:"+error);
		    }   
		});
}

</script>

	<div class="container">
		<h2><%=nation%> 주요 도시</h2>
		<div class="city_list_div">	<!-- 도시 리스트 -->
			<!-- 도시리스트 테이블 오는 자리 -->
		</div>	<!-- city_list_div -->
	</div>	<!-- container -->
</section>

<!-- Three -->
<section id="three" class="wrapper style1">
	<div class="container">
		<header class="major special">
			<h2><%=nation %>
				사진
			</h2>
			<!-- <p>Feugiat sed lorem ipsum magna</p> -->
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

