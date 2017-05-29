<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<link rel="stylesheet" href="./assets/css/QandA/writeForm.css"/>	



	<%
// 	인생샷그램 글쓰는곳
	String nick = (String)session.getAttribute("nick");	// 닉네임
	%>
	<div id="form">
		<form action="QandAWriteAction.qna" method="post" name="fr" onsubmit="return func1()" enctype="multipart/form-data">
<!-- 		닉네임 세션값 생성해서 readonly로 설정하기 -->
<br> 
		글쓴이:<input type="text" name="nick" value=<%=nick %> readonly><br>		
		제목:<input type="text" name="subject"><br>
		내용:<textarea rows="10" cols="20" name="content"></textarea><br>
		<input type="file" name="image1"><br><br>	
		<input id="submit" type="submit" value="글쓰기"><br> 
	</form>
	</div>



<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />