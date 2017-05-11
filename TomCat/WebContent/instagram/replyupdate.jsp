<%@page import="net.reply.db.ReplyBean"%>
<%@page import="java.util.List"%>
<%@page import="net.reply.db.ReplyDAO"%>
<%@page import="net.board.db.boardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- 추가한 스크립트 -->
<script type="text/javascript" src="./assets/js/member/join.js"></script>	<!-- 회원가입 제약조건 및 암호화 -->
<link rel="stylesheet" href="./assets/css/instagram/replyupdate.css"/>	
		
		<section id="wrapper">

	<%
	//out.println("replyupdateform.jsp");
	
		boardBean bb = (boardBean) request.getAttribute("bb");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
	%>
	<h1>글내용 보기</h1>
	<table border="1">
		<tr>
			<td colspan="2"><%=bb.getSubject()%></td>
			<td><%=bb.getNick()%></td>
			<td><%=bb.getDate()%></td>
		</tr>
		<tr>
			<td colspan="4"><a href="./upload/<%=bb.getImage1()%>"><%=bb.getImage1()%></a></td>
		</tr>
		<tr>
			<td colspan="4"><img src="./upload/<%=bb.getImage1()%>"
				width=400 height=400></td>
		</tr>
		<tr>
			<td colspan="4"><%=bb.getContent()%></td>
		</tr>
	</table>
	<input type="button" value="글수정"
		onclick="location.href='./BoardUpdate.bo?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
	<!-- http://localhost:8080/Study.jsp/board/////////updateForm.jsp?num=21&pageNum=1 -->

	<input type="button" value="글삭제"
		onclick="location.href='./BoardDelete.bo?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">

	<input type="button" value="글목록 "
		onclick="location.href='BoardList.bo?pageNum=<%=pageNum%>'">



	<!--리플 -->
	<%
	int re_num=Integer.parseInt(request.getParameter("re_num"));
	ReplyDAO rdao = new ReplyDAO();
	ReplyBean rb=rdao.getReply(re_num);
	%>
	
	<form action="./RreplyUpdateAction.re?pageNum=<%=pageNum %>"method="post" name="fr">
	<table border="1">
		<tr>
			<td>닉네임</td>
			<td colspan="2">답 글</td>
			<td>작성일</td>
		</tr>
		<tr>
		<td>
			<input type="hidden" name="num" value="<%=num %>">
			<input type="hidden" name="re_num" value="<%=re_num %>">					

			<input type="text" name="nick" value="<%=rb.getNick() %>"></td>
		<td colspan="2"><input type="text" name="content" value="<%=rb.getContent()%>"></td>
		<td><input type="text" name="date" value="<%=rb.getDate()%>"><input type="submit" value="수정"></td>
		</tr>
	
		</table>
	</form>
		</section>


	<!--리플 -->

</body>
		
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />