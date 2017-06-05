<%@page import="net.member.db.MemberDAO"%>
<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Before you go</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		<!-- Scripts -->
		<script src="./assets/js/jquery.min.js"></script>
		<script src="./assets/js/skel.min.js"></script>
		<script src="./assets/js/util.js"></script>
		<script src="./assets/js/main.js"></script>
			
			<!-- RSA -->
			<script type="text/javascript" src="./assets/js/rsa/jsbn.js"></script>
        	<script type="text/javascript" src="./assets/js/rsa/rsa.js"></script>
       		<script type="text/javascript" src="./assets/js/rsa/prng4.js"></script>
       		<script type="text/javascript" src="./assets/js/rsa/rng.js"></script>
        	
		<!-- 스타일 불러오기 -->
		<link rel="stylesheet" href="./assets/css/main.css?ver=68"/>
		<link rel="stylesheet" href="./assets/css/animate/animate.min.css"/>	<!-- 애니메이트 css -->
		
		<!-- 추가한 css -->
			<!-- member -->
			<link rel="stylesheet" href="./assets/css/member/loginPop.css"/>
			<link rel="stylesheet" href="./assets/css/member/memberManager.css?ver=62"/>
			
			<!-- plan -->
			<link rel="stylesheet" href="./assets/css/plan/planMain.css?ver=63"/>	<!-- 메인페이지 -->
			<link rel="stylesheet" href="./assets/css/plan/planNation.css?ver=64"/>	<!-- 국가페이지 -->
			<link rel="stylesheet" href="./assets/css/plan/planResion.css?ver=65"/>	<!-- 지역(도시)페이지 -->
			
		<!-- 추가한 js(스크립트 파일은 사용하는 페이지에서 외부 스크립트 불러오도록 합시다. 다른 외부 스크립트의 이름과 중복되서 오류날 수 도 있음) -->
			<!-- member -->
			<script type="text/javascript" src="./assets/js/member/loginPop.js?ver=66"></script>	<!-- 로그인 스크립트 -->
			<script type="text/javascript" src="./assets/js/member/memberManager.js?ver=67"></script>	<!-- 정보관리 팝업 스크립트 -->
			
			<!-- plan -->
			<script type="text/javascript" src="./assets/js/plan/planMain.js?ver=69"></script>
			
			
			<style type="text/css">
			header.subject .logo {
				font-size: 18px;
			}
			header.subject .logo strong {
				color: #49b2e9;
			}
			
			#nav li {
				margin-top: 0;
				margin-bottom: 0;
			}
			#nav a {
				font-family: "나눔 고딕" , "맑은 고딕", sans-serif;
				font-size: 15px;
				font-weight: bold;
				line-height: 50px;
				color: #000;
			}
			#nav a:hover {
				cursor: pointer;
			}
			</style>
			
			<script type="text/javascript">
			$(document).ready(function() {
				/* 헤더 */
				var wid = screen.width;
				$('.subject').css('width', wid);
				$('.subject nav').css('text-align', 'center');
				
				/* 회원정보 팝업 */
				var memberInfoMenuTxt = $(".memberInfoMenuTxt");        
				var divX = memberInfoMenuTxt.offset().left;
				var divY = memberInfoMenuTxt.offset().top;
				
				$('.memberManagerNav').css({
					'left' : divX,
					'top' : divY+53
				});
				first_li
				var first_li = $(".first_li"); 
				var liX = first_li.offset().left;
				var liY = first_li.offset().top;
				
				$('.logo').css({
					'left' : liX-260
				});
			});
			</script>
	</head>
	
<body>

<%
	String id = (String)session.getAttribute("id");
	String nick = (String) session.getAttribute("nick");
%>

<!-- Header -->
<header id="header" class="subject">
	<h1 class="logo">
		<a href="./Main.me"><strong>Before</strong> you go...</a>
	</h1>
	
	<nav id="nav" style="font-family: '나눔고딕' , '맑은고딕', sans-serif; " >
		<ul>
			<li class="first_li"><a href="./PlanMain.pl">여행지</a></li>
			<li><a href="./QandAList.qna">여행일정Q&A</a></li>
			<li><a href="./BoardList.bo">인생샷그램</a></li>
			
			<%
			if(id==null){ %>
				<li><a onclick="popupToggle()">함께해요</a></li>
				<li><a onclick="popupToggle()">일정 관리</a></li>
				<li><a onclick="popupToggle()" class="login_txt">로그인/회원가입</a></li>
			<%}else { %>
					<li><a href="./BoardList1.bb?plan_nr=100">함께해요</a></li>
					<li><a href="./MyPlan.pln?plan_nr=100">일정 관리</a></li>
					<li><a class="memberInfoMenuTxt login_txt" style="color: #ff9320;"><%=nick %></a></li>
				<%} %>
		</ul>
	</nav> 
</header>

<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>


<!-- 로그인 팝업 창 -->

<!-- 로그인 팝업창 뜰때 배경 -->
<div id="loginPopContainer" onclick="popupToggle()"></div>
<!-- 로그인 팝업창 -->
<div id="loginPop">
	<form action="javascript:validateEncryptedLoginForm()" post="post" name="login_form" id="login_form">
		
		<input type="email" name="id_login" id="id_login"  placeholder="이메일을 입력하세요." >
		<input type="password" name="pass_login" id="pass_login" placeholder="비밀번호를 입력하세요."><br>

		<input type="submit" class="button special loginBtn" value="로그인" >
		
		<div id="login_txt">
			<a onclick="idFinderPopup();" ><span class="login_txt">아이디 찾기</span></a> || 
			<a onclick="passFinderPopup();"><span class="login_txt">비밀번호 찾기</span></a><br>
		</div>
		
		<br>
		아직 아이디가 없으십니까? <a href="./MemberJoin.me" onclick="popupToggle()">회원가입</a>
		
	</form>	
</div>

<!-- 회원관리/로그아웃 선택 팝업 메뉴 -->
<%
	if(nick!=null) {	// 로그인 되어 있을때만
			MemberDAO mdao = new MemberDAO();
			MemberBean mb = mdao.getMember(id);
			String profile = mb.getProfile();
		%>
		<div class="memberManagerNavPopupToggle" style="display:none;"></div>	<!-- 애니메이트 이벤트 토글 하기 위해 만든것, 화면에 출력 안됨 -->
			<div class="memberManagerNav">
			
			<%
				%>
				<img src="./upload/images/profileImg/<%=profile %>"  width="100px" height="120px"><!-- 프로필 사진 -->
				<%
			%>
				<ul>
					<li><a href="./MemberInfo.me">정보관리</a></li>
					<li><a href="./MemberLogout.me">로그아웃</a></li>
				</ul>
			</div>
		<%	
	}
%>













