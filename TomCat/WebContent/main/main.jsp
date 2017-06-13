<%@page import="net.member.action.MainListAction"%>
<%@page import="java.util.Calendar"%>
<%@page import="net.board.db.boardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
	
	<!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="./assets/dist/css/swiper.min.css">
	
	<link rel="stylesheet" href="./assets/css/main/mainSub.css?ver=10">

</head>

<body>
<%
	String id = "";
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}

	String nick = "";
	if (session.getAttribute("nick") != null) {
		nick = (String) session.getAttribute("nick");
	}
	
	//바뀌는 배경을 초 단위로 하기 위해서 현재 시간 불러오기.
	Calendar cal = Calendar.getInstance();
	int second = cal.get(Calendar.SECOND)%4;//배경 갯수에 따라서 나누는 값 바꾸기
%>
<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- Banner -->
<!-- 현재 초 값을 받아와서, 배경이 새로고침 할때마다 바뀌도록. -->
<%if(second==3) {%>
<section id="banner" class="b_back<%=second%> sectionOne">
<%} else if(second==2) {%>
<section id="banner" class="b_back<%=second%> sectionOne">
<%} else if(second==1) {%>
<section id="banner" class="b_back<%=second%> sectionOne">
<%} else { %>
<section id="banner" class="b_back sectionOne">
<%} %>


	<div class="main1">
		<span class="small">나만의 여행 플래너</span><span class="head1"> <b style="color: #f44066">BEFORE</b>
			YOU GO...
		</span>
		<!-- 검색폼 -->
		<div class="Main_Search">
			<form name="fr" action="./PlanSearch.pl" class="main_plan_search"
				method="post" onsubmit="return checkSearch();">
				<h2>어디로 여행을 가시나요?</h2>
				<div class="clear"></div>
				<div style="max-width: 950px; margin: auto;">
					<select name="check" class="check_search">
						<option value="0">선택해주십시오</option>
						<option value="1">국가명</option>
						<option value="2">도시명</option>
					</select> <input type="text" name="search" value="" class="search_text"
						placeholder="국가, 도시 이름을 검색해주세요."> <input type="submit"
						value="검색" class="main_serch_button">
				</div>
			</form>
		</div>
	</div>

</section>

<!-- Two -->
<section class="sectionTwo">
	<div class="main2">
		<header>
			<h1><span>BEFORE</span> YOU GO 에서</h1>
			<h2>성공적인 여행을 시작하세요</h2>

		</header>
		
<!-- 		https://hyeonseok.com/soojung/css/2013/03/12/730.html -->
<!-- 마우스를 올렸을 때만 동작하도록 설정하자. -->
		
		<div class="main_explain">

			<a href="./PlanMain.pl">
				<div class="explain_gif">
					<img src="./images/main/gif01.gif" alt="" />
					<h4>
						여행 일정 플래너에서 <br>가고 싶은 여행지를 선택하세요!
					</h4>
				</div>
			</a>
			
			<%if(id.equals("")){ %>
			<a onclick="popupToggle()">
			<%} else {%>
			<a href="./MyPlan.pln?plan_nr=100">
			<%} %>
				<div class="explain_gif">
					<img src="./images/main/gif02.gif" alt="" />
					<h4>
						나의 일정 관리에서 <br> 여행 날짜와 교통을 알수있습니다!
					</h4>
				</div>
			</a>
			<a href='./BoardList1.bb'>
				<div class="explain_gif">
					<img src="./images/main/gif03.gif" alt="" />
					<h4>
						함께해요와 인생샷그램에서 <br> 여행을 공유하세요!
					</h4>
				</div>
			</a>
		</div>
		<div class="clear"></div>

	</div>
</section>

<<<<<<< HEAD
=======
<%if(second==3) {%>
<section id="banner" class="b_back<%=second%> sectionThree">
<%} else if(second==2) {%>
<section id="banner" class="b_back<%=second%> sectionThree">
<%} else if(second==1) {%>
<section id="banner" class="b_back<%=second%> sectionThree">
<%} else { %>
<section id="banner" class="b_back sectionThree">
<%} %>

	<header>
		<h1><a href="./BoardList.bo">인생샷그램</a>에서</h1>
		<h2>당신의 여행을 공유하세요!</h2>
	</header>

	<%
	int count = Integer.parseInt(request.getAttribute("count").toString());
	
	List boardList = null;
	if(count!=0) {
		boardList = (List)request.getAttribute("bl");
	}
	
	
	%>
	 <!-- Swiper -->
    <div class="swiper-container imgContainer">
        <div class="swiper-wrapper imgs">
        <%
        
        if(count != 0){
        
    	for(int i=0; i<boardList.size(); i++) {
    		boardBean bb = (boardBean) boardList.get(i);
    	%>
    		<div class="swiper-slide"><a href="./BoardContent.bo?num=<%=bb.getNum()%>&pageNum=1"><img
				src="./upload/images/gram/<%=bb.getImage1()%>" width="300" height="300"
				onerror="this.src='./images/instagram/noimage.png'">
				<span class="imgsSubject"><%=bb.getSubject() %></span></a>
			</div>
    	<%
    	}
        }else {
        	%>
        	<div class="swiper-slide"><span style="color: #fff; font-size: 28px;">이미지 정보가 없습니다.</span></div>
    		<%
        }
        
   		%>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div> 
    </div>

    <!-- Swiper JS -->
    <script src="./assets/dist/js/swiper.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        slidesPerView: 'auto',
        centeredSlides: true,
        paginationClickable: true,
        spaceBetween: 30,
        autoplay: 1500
    });
    </script>


</section>

<!-- <script>
	window.onload=CountryList();
</script> -->

<script type="text/javascript">
	
	$(window).load(function(){
		$.ajax({
			type:'post',
			url:'./plan/planMainCityList.jsp',
			data:{continent:'All'},
			success:function(data){
				$('div.bestTripimg').append(data);
			},
			error:function(xhr, status, error){
				alert(error);
			}
		});
	});
	
	function cityListchange(continent) {
		$.ajax({
			type:'post',
			url:'./plan/planMainCityList.jsp',
			data:{continent : continent},
			success:function(data){
				$('div.bestTripimg').empty();
				$('div.bestTripimg').append(data);
			},
			error:function(xhr, status, error){
				alert(error);
			}
		});
	
	}
</script>

<!-- Four -->
<section class="sectionFour">
	
		<div class="bestTrip">
		<h1 style="font-size: 2.2em;text-align: center;margin:50px 0 10px 0;"> 인기 여행지</h1>
			<h3 style="text-align: center;font-size: 1.3em;"><span style="color: #f44066">대륙별</span> 추천도시로 <span style="color: #f44066">여행</span>을 떠나보세요!</h3>
			<div class="bestTripMenu">
				<ul class="bestTrip_cont">
					<li><a href="javascript:cityListchange('All');">추천</a></li>
					<li><a href="javascript:cityListchange('asia');">아시아</a></li>
					<li><a href="javascript:cityListchange('europe');">유럽</a></li>
					<li><a href="javascript:cityListchange('oceania');">남태평양</a></li>
					<li><a href="javascript:cityListchange('south');">중남미</a></li>
					<li><a href="javascript:cityListchange('north');">북미</a></li>
				</ul>
			</div>

			<div class="clear"></div>

			<div class="bestTripimg">
				
			</div>
		</div>

		<div class="clear"></div>

</section>
>>>>>>> branch 'master' of https://github.com/gnsgmlckdgk/TomCat

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
