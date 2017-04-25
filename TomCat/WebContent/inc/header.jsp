<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		<!-- Scripts -->
		<script src="./assets/js/jquery.min.js"></script>
		<script src="./assets/js/jquery-3.2.0.js"></script>
		<script src="./assets/js/skel.min.js"></script>
		<script src="./assets/js/util.js"></script>
		<script src="./assets/js/main.js"></script>
			
			<!-- RSA -->
			<script type="text/javascript" src="./assets/js/rsa/jsbn.js"></script>
        	<script type="text/javascript" src="./assets/js/rsa/rsa.js"></script>
       		<script type="text/javascript" src="./assets/js/rsa/prng4.js"></script>
       		<script type="text/javascript" src="./assets/js/rsa/rng.js"></script>
        	<script type="text/javascript" src="./assets/js/member/join.js"></script>	<!-- 회원가입 제약조건 및 암호화 -->
			
			
		<!-- 스타일 불러오기 -->
		<link rel="stylesheet" href="./assets/css/main.css" />
		
		<!-- 추가한 css -->
			<!-- member -->
			<link rel="stylesheet" href="./assets/css/member/join.css?ver=1" />	<!-- ?ver=1 은 이클립스에서 수정한거 있을때 서버가 인식을 잘 못해서 넣음 -->
			<link rel="stylesheet" href="./assets/css/member/loginPop.css?ver=2" />
		
		<!-- 추가한 js -->
			<!-- member -->
			<script type="text/javascript" src="./assets/js/member/loginPop.js"></script>
			
	</head>
	
<body>
<!-- 세션값 가져오기 -->
<%
	String id = (String)session.getAttribute("id");
%>

<!-- Header -->
<header id="header">
	<h1>
		<a href="./Main.me"><strong>Before</strong> you go...</a>
	</h1>
	
	<nav id="nav" style="font-family: '나눔고딕' , '맑은고딕', sans-serif; " >
		<ul>
			<li><a href="generic.html">함께해요</a></li>
			<li><a href="elements.html">여행일정플래너</a></li>
			<li><a href="elements.html">여행일정Q&A</a></li>
			<li><a href="elements.html">인생샷그램</a></li>
			<%
			if(id==null){ %>
				<li><a onclick="popupToggle()"><span class="login_txt">로그인/회원가입</span></a></li>
			<%}else { %>
					<li><a href="#" ><span class="login_txt">마이페이지(추가예정)</span></a></li>
					<!-- 로그아웃은 어디넣을지 고민좀 해야겠습니다. -->
				<%} %>
			
		</ul>
	</nav>
	
</header>

<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>


<!-- 로그인 팝업창 뜰때 배경 -->
<div id="loginPopContainer" onclick="popupToggle()"></div>
<!-- 로그인 팝업창 -->
<div id="loginPop">
	<form action="./MemberLoginAction.me" post="post" name="fr" id="login_form" onsubmit="return validateEncryptedLoginForm()">
		<input type="email" name="id" id="id"  placeholder="이메일을 입력하세요." >
		<input type="password" name="pass" id="pass" placeholder="비밀번호를 입력하세요."><br>

		<input type="submit" class="button special loginBtn" value="로그인" >
		
		<div id="login_txt">
			<a href="아이디 찾기 페이지" >아이디 찾기</a> || 
			<a href="비밀번호 찾기 페이지">비밀번호 찾기</a><br>
		</div>
		
		<br>
		아직 아이디가 없으십니까? <a href="./MemberJoin.me" onclick="popupToggle()">회원가입</a>
		
	</form>
	
</div>
