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


<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
