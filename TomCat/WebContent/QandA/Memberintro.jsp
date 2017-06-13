<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<link rel="stylesheet" href="./assets/css/QandA/Memberintro.css?ver=1"/>
	<%
	// 	QnA 글쓰는곳
	String nick = (String)session.getAttribute("nick");	// 닉네임
	String id = (String)session.getAttribute("id"); //id
	%>		

	<div id="combine">
	<h1 class="combine_logo"><span>BEFORE</span> YOU GO</h1>

<table id="table1">
<tr><td id="tdsize">
<h1 id="h1">김형주(조장)</h1>
안녕하세요 
TomCat 팀의 팀장으로서, Before You Go 서비스를 시작할수 있게되어 정말 기쁩니다. 
부족한 점이 있더라도 저희 팀을 어여삐 봐주시고, 건의사항이나 오류사항을 알려주시면, 
적극 반영해 드리겠습니다. 감사합니다.<br>
e-mail : overtimearmy@gmail.com
</td>
<td>
	<img src="./images/QandA/zozangnim.png" width="300" height="300">

</td>
</tr>
	
	<tr>
<td><h1 id="h1">박성우</h1>
반갑습니다. 박성우입니다. 저희는 이제 성장하기 시작한 개발자들입니다. 
이에 프로젝트 중간에 예상치 못한 어려움을 겪기도 했지만, 완성도 있는 사이트를 웹 호스팅까지 하기 위해서 노력했습니다. 
그리고 이렇게 사이트를 인터넷상에 업로드하기까지 많은 공부를 할 수 있어서 기쁨을 느낍니다. 
지금까지 함께 고생한 팀 TOMCAT에 감사의 말을 전합니다. 
e-mail : psw607me@gmail.com

</td>
<td>
	<img src="./images/QandA/psu.jpg" width="300" height="300" >

</td>
	
</tr>

<tr>
<td><h1 id="h1">강수현</h1>
안녕하세요 조원 강수현입니다.
저는 여행 일정만들기에서 일정수정 부분을 담당했습니다. 
실력있는 조원들의 도움이 아니었다면 혼자서 감당하지 못했을 상황이라 조원들에게도 고마운 마음을 전합니다.  
서비스를 이용하시면서 문제점을 발견하시면 surulru44@naver.com 으로 연락주시기 바랍니다.
</td>
<td>
	<img src="./images/QandA/ksh.jpg" width="300" height="300">
</td>

</tr>

<tr>
<td><h1 id="h1">김규아</h1>
 인생샷그램(글쓰기,수정,삭제 좋아요, best shot,댓글,대댓글), Q&A 페이지의 기능 구현 및 디자인을 담당하였습니다.
  이용 시 불편하거나 문의사항이 있으면 다이렉트 051.555.555로 연락해 주세요.<br>
e-mail : rbdk1219@gmail.com<br>
phone : 010.1111.1111<br>
</td>
<td>
	<img src="./images/QandA/kyuakim.jpg" width="300" height="300">
</td>
</tr>

<tr>
<td><h1 id="h1">황창하</h1>
회원가입, 로그인, 회원관리, DB관리 페이지와 국가, 도시 페이지 그 외 몇가지 기능을 담당하였습니다. 
개선사항이나 버그 발견시 dohauzi@gmail.com으로 글 남겨 주시기 바랍니다.
</td>
<td>
	<img src="./images/QandA/HCH.jpg" width="300" height="300" >
</td>
</tr>

<tr>
<td><h1 id="h1">구민정</h1>
여행지 페이지의 일부 기능과 css를 담당하였습니다 
더많은 여행지의 자료를 원하시거나 이용시 불편한 점이 있으시면 문의해 주세요<br>
e-mail : zlxl2723@gmail.com<br>
phone : 010.9999.9999<br> 
</td>
<td>
	<img src="./images/QandA/GMJ.jpg" width="300" height="300" >
</td>
</tr>


<tr>
<td><h1 id="h1">이승민</h1>
함께해요 게시판 기능 구현 및 css 작업을 담당했습니다
부족한 점이 많고 미숙한 점도 있지만 많은 노력 끝에
피드 형식의 게시판과 채팅, 차별점을 둔 글 쓴 시간
또 특이점이 온 채팅창을 구현해내는 기염을 토했습니다
고집과 아집을 버리고 전체 분위기에 맞는 디자인으로
부담스럽지 않은 시각의 즐거움까지 포함하였습니다.
혹여 이용 시 불편한 점이 있으시면 바로 문의주세요<br>
e-mail : most8482@gmail.com
</td>
<td>
	<img src="./images/QandA/LSM.jpg" width="300" height="300">
</td>
</tr>
</table>

	

<table id="banner">

<tr><td><a href="./QandACompanyIntro.qna">회사소개</a></td></tr>
<tr><td id="darker"><a href="./QandAHowToUse.qna">이용방법</a></td></tr>
<tr><td><a href="./QandAadvertise.qna">광고 및 제휴</a></td></tr>
<tr><td id="darker"><a href="./QandAcondition.qna">이용약관</a></td></tr>
<tr><td><a href="./QandAprivacy.qna">개인정보 취급 방침</a></td></tr>

<tr><td id="darker">
<%if(id!=null){ %>
<a href="./QandAWrite.qna">문의하기</a>
<%
}else if(id==null){
%>
<a href="javascript:popupToggle()">문의하기</a>
<%
}
%>
</td></tr>

<tr><td><a href="./Memberintro.qna">운영진소개</a></td></tr>
<tr><td id="darkerlast"><a href="./QandAList.qna">목록으로</a></td></tr>

</table>


	</div>



<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />