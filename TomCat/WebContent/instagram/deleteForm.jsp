<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- 추가한 스크립트 -->
<script type="text/javascript" src="./assets/js/member/join.js"></script>	<!-- 회원가입 제약조건 및 암호화 -->

		
	<h1>WebContent/board/deleteForm.jsp</h1>
	<%	
	String pageNum = request.getParameter("pageNum");
	int num=Integer.parseInt(request.getParameter("num"));

	%>
	
	
	<h1>게시판 글 삭제</h1>
		<form action="./BoardDeleteAction.bo?pageNum=<%=pageNum%>" method="post" name="fr">
<!-- 		hidden으로 숨겨서 num값 넘겨주기 -->
		<input type="hidden" name="num" value="<%=num%>">				
		<input type="submit" value="글삭제"><br> 
	</form>

</body>
		
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />