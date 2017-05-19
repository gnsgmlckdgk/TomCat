<%@page import="net.plan.db.PlanTravelBean"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<!-- Banner -->
<!-- <section id="banner"> -->
<%
	String region = request.getParameter("region");
	String id = (String) session.getAttribute("id");
	String city_code = (String) request.getAttribute("city_code");
%>
<!-- One 지역명 및 설명-->
<section id="banner" class="resion_one">
	<div class="container 75% resion_info_content">
		<div class="row 200%">
			<div class="6u 12u$(medium)">

				<div class="resion_info">
					<h2><%=region%></h2>
					<!-- 지역 정보 -->
					<%
						StringBuffer region_info = (StringBuffer) request.getAttribute("region_info");
					%>
					<%=region_info.toString()%>
				</div>
			</div>
			<div class="6u$ 12u$(medium)">
				<!-- 수현씨 지도 부분 -->
				<iframe width="600" height="450" frameborder="0" style="border: 0"
					src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAwZMwcmxMBI0VQAUkusmqbMVHy-b4FuKQ&q=<%=region%>"
					allowfullscreen> </iframe>
			</div>
			<!-- 수현씨 지도 부분 끝 -->

		</div>
	</div>
</section>




<!-- Two -->
<!-- Two 국가의 지역 리스트 -->
<section id="nation_two" class="wrapper style2 special">

	<!-- Two 섹션 스크립트 -->
	<script type="text/javascript">
// 페이지에 처음 왔을때 도시 리스트를 불러옴, 페이지번호는 1로 시작
$(window).load(function() {
	$.ajax({
		type: 'post',
		url: './plan/planRegionList.jsp',
		data : {region:'<%=region%>', pageNum:'1', city_code:'<%=city_code%>'},
		success: function(data) {
			$('.region_list_div').append(data);
		},
		error: function(xhr, status, error) {
	        alert(error);
	    }   
	});
});

//checkbox 버튼을 통한 조건부 검색.
function checkbox_change(){
		
	var $checkbox;
	
	if(r.checked && p.checked && h.checked) {$checkbox="rph"}
	else if(!r.checked && !p.checked && !h.checked) {$checkbox="rph"}
	
	else if(r.checked && p.checked && !h.checked) {$checkbox="rp"}
	else if(r.checked && !p.checked && h.checked) {$checkbox="rh"}
	else if(!r.checked && p.checked && h.checked) {$checkbox="ph"}
	
	else if(r.checked && !p.checked && !h.checked) {$checkbox="r"}
	else if(!r.checked && p.checked && !h.checked) {$checkbox="p"}
	else if(!r.checked && !p.checked && h.checked) {$checkbox="h"}
	
	
	$.ajax({
		type: 'post',
		url: './plan/planRegionList.jsp',
		data : {region:'<%=region%>', pageNum: '1', search: $checkbox, city_code:'<%=city_code%>'},
		success: function(data) {
			$('.region_list_div').empty();
			$('.region_list_div').append(data);
			
		},
		error: function(xhr, status, error) {
			alert(error);
	    }
	});
	
}

// 페이지 번호를 눌렸을때 그에 맞는 게시글을 불러옴
function regionListChange(pageNum) {
	
		var search = $('#search').val();
	
		$.ajax({
			type: 'post',
			url: './plan/planRegionList.jsp',
			data : {region:'<%=region%>', pageNum: pageNum, search: search, city_code:'<%=city_code%>'
				},
				success : function(data) {
					$('.region_list_div').empty();
					$('.region_list_div').append(data);
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			});
		}

		//찜 버튼 누르면 내 일정에 담김. 
		function zzim_add(travel_id) {

			$.ajax({
				type : 'POST',
				url : './MyPlanBasketAdd.pln',
				data : {
					'travel_id' : travel_id
				},
				dataType : 'text',
				async : false,
				success : function(data) {
					console.log(data)

				}
			});
			alert("나의 일정에 등록되었습니다.");
			//		$.toast('<h4>나의 일정에 추가되었습니다.</h4>', { type: 'success', duration: 3000 } );
		}

		//비로그인 상태에서 찜버튼을 누르면 로그인 창 활성화.
		function zzim_noId() {
			popupToggle()
		}
	</script>

	<div class="container">
		<h2><%=region%>
			주요 지역
		</h2>
		<hr>

<!-- checkbox -->
		<div class="checkbox" onchange="checkbox_change()">
			<input type="checkbox" name="r" id="r" checked="checked"><label for="r">Restaurant</label>
			<input type="checkbox" name="p" id="p" checked="checked"><label for="p">Place</label>
			<input type="checkbox" name="h" id="h" checked="checked"><label
				for="h">Hotel</label>
		</div>
<!--end checkbox -->

		<div class="region_list_div">
			<!-- 도시 리스트 -->
			<!-- 도시리스트 테이블 오는 자리 -->
		</div>
		<!-- region_list_div -->
	</div>
	<!-- container -->
</section>




<!-- Three -->
<section id="three" class="wrapper style1">
	<div class="container">
		<header class="major special">
			<h2><%=region%>
				여행 후기
			</h2>

		</header>

		<div class="feature-grid">

			<!-- 이미지 서치 시작.-->

			<script src="./assets/js/plan/daumSearch3.js"></script>

			<div id="daumForm">
				<input id="daumSearch" type="hidden" value="<%=region%>+여행"
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

