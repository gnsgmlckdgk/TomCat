<%@page import="net.plan.db.PlanCityBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
   	
   	<!-- Link Swiper's CSS 슬라이드 -->
    <link rel="stylesheet" href="./assets/dist/css/swiper.min.css">
    
</head>	
<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<%
	String nation = request.getParameter("nation");	// 국가명
	String id = (String) session.getAttribute("id");
%>
<!-- One 지역명 및 설명-->
<section id="banner" class="nation_one">
	<h2><%=nation%></h2>
	<div class="nation_info_content">
<!-- 국가의 도시들의 이미지 슬라이드 -->
<!-- Swiper -->
    <%
    // 도시 리스트
    List<PlanCityBean> cityList = null;
    cityList = (List)request.getAttribute("cityList");
    %>
    <div class="swiper-container slideContainer">
        <div class="swiper-wrapper">
    <%
    PlanCityBean pcb = null;
    if(cityList.size()>0) {
    	for(int i=0; i<cityList.size(); i++) {
    		pcb = cityList.get(i);
    		%>
    		<div class="swiper-slide"><img src="./images/plan/nation/<%=pcb.getCountry_code()%>/<%=pcb.getEn_name()%>.jpg"></div>
    		<%
    	}
    }else {
    	%>
    		<div class="swiper-slide" style="color: #fff;">이미지 정보가 없습니다.</div>
    	<%
    }
    %>
     </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
    </div>
    	
    <!-- Swiper JS -->
    <script src="./assets/dist/js/swiper.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
        spaceBetween: 30,
    });
    </script>
	
	<div class="map">
		<!-- 수현씨 지도 부분 -->
		<iframe width="100%" height="100%" frameborder="0" style="border: 0"
			src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAwZMwcmxMBI0VQAUkusmqbMVHy-b4FuKQ&q=<%=nation%>"
			allowfullscreen> </iframe>
	</div> <!-- 수현씨 지도 부분 끝 -->
	
	<div class="clear"></div>
			
			<div class="nation_info">
				 <%
				 // PlanNationAction에서 가져옴
				 StringBuffer nation_info = (StringBuffer)request.getAttribute("nation_info");
				 %>
				 <%=nation_info.toString() %>
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
	
		var search = $('#search').val();
	
		$.ajax({
			type: 'post',
			url: './plan/planNationCityList.jsp',
			data : {nation:'<%=nation%>', pageNum: pageNum, search: search},
			success: function(data) {
				$('.city_list_div').empty();
				$('.city_list_div').append(data);
			},
			error: function(xhr, status, error) {
				alert(error);
		    }   
		});
}
</script>
	<div class="container">
		<h2><%=nation%> 주요 도시</h2>
		<hr>
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
				여행 후기
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

