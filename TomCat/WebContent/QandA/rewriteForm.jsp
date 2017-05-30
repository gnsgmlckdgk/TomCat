<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<link rel="stylesheet" href="./assets/css/QandA/writeForm.css"/>	


답글~
	<%
	String nick = (String)session.getAttribute("nick");	// 닉네임(세션값)
	
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	int re_ref=Integer.parseInt(request.getParameter("re_ref"));
	int re_lev=Integer.parseInt(request.getParameter("re_lev"));
	int re_seq=Integer.parseInt(request.getParameter("re_seq"));
	%>

	<div id="form">
		<form action="QandAReplyWriteAction.qna?" method="post" name="fr" onsubmit="return func1()" enctype="multipart/form-data">
<!-- 		닉네임 세션값 생성해서 readonly로 설정하기 -->
<br> 
		글쓴이:<input type="text" name="nick" value=<%=nick %> readonly><br>		
		제목:<input type="text" name="subject"><br>
		내용:<textarea rows="10" cols="20" name="content"></textarea><br>
		<input type="file" name="image1"><br><br>
		<input type="hidden" name="re_ref" value="<%=re_ref%>">
		<input type="hidden" name="re_lev" value="<%=re_lev%>">
		<input type="hidden" name="re_seq" value="<%=re_seq%>">
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		
		
		<input id="submit" type="submit" value="글쓰기"><br> 
		
		
	</form>
	</div>



<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />