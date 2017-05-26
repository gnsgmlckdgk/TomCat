<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<section class="wrapper">

<html>
<head>



</head>
<body>

	<%
		String nick = (String) session.getAttribute("nick"); // 닉네임
		String location =(String) request.getParameter("location");
	%>

<iframe width="100%" height="400" frameborder="0" style="border: 0"
	src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAwZMwcmxMBI0VQAUkusmqbMVHy-b4FuKQ&q=<%=location%>" allowfullscreen>
</iframe>

	<form action="./BoardWriteAction1.bb" method="post" name="fr">
		글쓴이: <input type="text" name="nick_name" value=<%=nick%> readonly><br>
		제목: <input type="text" name="subject"><br>
		내용: <textarea rows="10" cols="20" name="content"></textarea><br>
		<input type="text" value="<%=location %>" name="location">
		
		<input type="submit" value="글쓰기">
	</form>
</body>
</html>
<!-- Footer --> <jsp:include page="../inc/footer.jsp" />