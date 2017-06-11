<%@page import="net.QandA.db.QandABean"%>
<%@page import="net.QandA.db.QandADAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- 추가한 스크립트 -->
<script type="text/javascript" src="./assets/js/member/join.js"></script>	<!-- 회원가입 제약조건 및 암호화 -->
<link rel="stylesheet" href="./assets/css/QandA/writeForm.css"/>	


<%
//int num,String pageNum 파라미터 가져오기
String pageNum = request.getParameter("pageNum");
int num=Integer.parseInt(request.getParameter("num"));
QandABean qb = (QandABean) request.getAttribute("qb");
%>
<div id="combine">
		<img id="question" src="./images/QandA/questionmark.png">
	
		<form id="form" action="./QandAUpdateAction.qna?num=<%=num %>&pageNum=<%=pageNum%>" method="post" name="fr" enctype="multipart/form-data">
<!-- 		hidden으로 숨겨서 num값 넘겨주기 -->
		<input type="hidden" name="num" value="<%=num%>">
		<br>
		글쓴이:<input type="text" name="nick" value="<%=qb.getNick()%>"><br> 
		제목:<input type="text" name="subject" value="<%=qb.getSubject()%>"><br>
<!-- 		textarea는 value값이 없움 -->
		내용:<textarea rows="10" cols="20" name="content"><%=qb.getContent()%></textarea><br>
		
		<img src="./upload/<%=qb.getImage1()%>" width=200 height=200><br>
		<br>
<!-- 		파일 첨부할때 type2개 만들어 놓기(하나는  hidden) -->
		<input type="file" name="image1"><br>
		<input type="hidden" name="image2" value="<%=qb.getImage1()%>">
		
		
		<br>
				<input type="submit" id="submit" value="글수정"><br> 
		
	</form>
	
	
		
<table id="banner">
<tr><td><a href="./QandACompanyIntro.qna">회사소개</a></td></tr>
<tr><td id="darker"><a href="./QandAHowToUse.qna">이용방법</a></td></tr>
<tr><td><a href="./QandAadvertise.qna">광고 및 제휴</a></td></tr>
<tr><td id="darker"><a href="./QandAcondition.qna">이용약관</a></td></tr>
<tr><td><a href="./QandAprivacy.qna">개인정보 취급 방침</a></td></tr>
<tr><td id="darker"><a href="./QandAWrite.qna">문의하기</a></td></tr>
<tr><td><a href="./Memberintro.qna">운영진소개</a></td></tr>
<tr><td id="darkerlast"><a href="./QandAList.qna">목록으로</a></td></tr>

</table>
</div>
<jsp:include page="../inc/footer.jsp" />
