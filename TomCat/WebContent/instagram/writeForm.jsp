<%@page import="net.board.db.boardBean"%>
<%@page import="net.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>톰캣의여행커뮤니티</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />

<script type="text/javascript">

function func1(){
if(document.fr.image1.value==""){
	alert("당신의 인생샷을 첨부해주세요");
	document.fr.image1.focus();
	return false;}
	
document.fr.submit();

}

</script>
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<link rel="stylesheet" href="./assets/css/instagram/writeForm.css"/>	


<section class="wrapper">
  <div id="combine">
	<%
// 	인생샷그램 글쓰는곳
	String nick = (String)session.getAttribute("nick");	// 닉네임
	%>
	<div id="form">
		<form action="./BoardWriteAction.bo" method="post" name="fr" onsubmit="return func1()" enctype="multipart/form-data">
<!-- 		닉네임 세션값 생성해서 readonly로 설정하기 -->
<br> 
		글쓴이:<input type="text" name="nick" value=<%=nick %>><br>		
		제목:<input type="text" name="subject" ><br>
		내용:<textarea rows="7" cols="15" name="content" ></textarea><br>
		<input type="file" name="image1"><br><br>	
		<input id="submit" type="submit" value="글쓰기"><br> 
	</form>
	</div>
</div>
</section>
</body>
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />