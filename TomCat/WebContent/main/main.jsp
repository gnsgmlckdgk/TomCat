<%@page import="java.util.Calendar"%>
<%@page import="net.board.db.boardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
	
	<style type="text/css">
		
		body {
			font-family: "나눔고딕", "맑은 고딕", sans-serif;
		}
		
		/* 첫번째 섹션 */
		div.main1 {	/* 내용물 */
			width: 1080px;
			margin: 0 auto;
		}
		div.main1 input, div.main1 select {
			font-size: 12px;
		}
		
		/* 두번째 섹션 */
		div.main2 {
			width: 1080px;
			margin: 0 auto;
			padding: 30px;
			font-size: 12px;	
			letter-spacing: -1px;
		}
		div.main2 h1 {
			font-size: 28px;
		}
		div.main2 h1 span {
			color: #f44066;
		}
		div.main2 div.main_explain {
			width: 1080px;
		}
		
		/* 세번째 섹션 */
		section.sectionThree {
			font-size: 12px;
			padding: 30px;
			background-color: #f0f0f0;
		}
		section.sectionThree header h1 {
			font-size: 18px;
			color: #f44066;
		}
		section.sectionThree header h2 {
			font-size: 20px;
		}
		div.main3 article {
			margin-right: 0;
		}
		div.main3 img {
			width: 213px;
			height: 213px;
		}
		
		/* 네번째 섹션 */
		section.sectionFour {
			font-size: 12px;
			padding: 30px;
			background-color: #fff;
			min-height: 600px;
		}
		div.main4 {
			width: 1080px;
			min-height: 600px;	/* 확인용 */
			margin: 0 auto;
			border: 1px solid red;	/* 확인용 */
		}
		
	</style>

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

<!-- Carousel, Three -->
<script src="assets/js/main/jquery.min.js"></script>
<script src="assets/js/main/jquery.dropotron.min.js"></script>
<script src="assets/js/main/jquery.scrolly.min.js"></script>
<script src="assets/js/main/jquery.onvisible.min.js"></script>
<script src="assets/js/main/skel.min.js"></script>
<script src="assets/js/main/util.js"></script>
<script src="assets/js/main/main.js"></script>

<section class="carousel sectionThree">
	
	<header>
		<h1>인생샷그램에서</h1>
		<h2>당신의 여행을 공유하세요!</h2>
	</header>

	<div class="reel main3">

		<%
			List boardList = (List) request.getAttribute("bl");

			if (boardList != null) {
				for (int i = 0; i < boardList.size(); i++) {

					//자바빈(boardBean) 변수=배열한칸 접근 배열변수.get()
					boardBean bb = (boardBean) boardList.get(i);
		%>

		<article>
			<a href="#" class="image featured"> <img
				src="./upload/<%=bb.getImage1()%>" width=300 height=300
				onerror="this.src='./images/instagram/noimage.png'">
			</a>
			<header>
				<h3>
					<a href="#"><%=bb.getSubject()%></a>
				</h3>
			</header>
			<p><%=bb.getNick()%></p>
		</article>


		<%
			}
			}
		%>
	</div>
</section>
<!-- Carousel end-->

<!-- Four -->
<section class="sectionFour">
	
	<div class="main4">
		<h1>인기여행일정 오는 자리???</h1>
		
	</div>

</section>

<!-- 테스트용 버튼들. -->
<div style="max-width: 1080px; margin: auto; border:5px solid red;">



	<p>
		임시 메인화면 입니다. <br /> 현재 session의 id는
		<%=id%>, nick은
		<%=nick%>입니다.
	</p>
	<ul class="actions">
		<li><a href="./BoardList1.bb" class="button special big">함께해요</a></li>
		<li><a href="./PlanMain.pl" class="button special big">여행 일정
				플래너</a></li>
		<li><a href="./BoardList.bo" class="button special big">인생샷그램</a></li>
		<li><a href="#" class="button special big">Q & A</a></li>
	</ul>

	<br> 아래는 연습용 버튼입니다.
	<ul class="actions">

		<li><a href="./MemberJoin.me" class="button special big">회원가입</a></li>


		<%
			if (!id.equals("")) {
		%>
		<li><a href="./MyPlan.pln?plan_nr=100" class="button special big">나의일정관리</a></li>
		<%
			} else if (id.equals("")) {
		%>
		<li><a onclick="popupToggle()" class="button special big">나의일정관리</a></li>

		<%
			}
		%>

		<li><form action="./PlanRegion.pl" method="get">
				<input type="text" name="region" style="background-color: white"
					placeholder="암거나 검색"> <input type="submit" value="검색"
					class="button special">
			</form></li>

		<li><a href="./CountryList.pl" class="button special big">국가
				DB</a></li>
		<li><a href="./CityList.pl" class="button special big">도시 DB</a></li>
		<li><a href="./PlanSpot.pl?travel=자연사 박물관" class="button special big">추천장소
				상세보기</a></li>
		<li><a href="./Chat.ct" class="button special big">채팅 테스트</a></li>
	</ul>



</div>
<!-- 테스트용 버튼들 끝. -->

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
