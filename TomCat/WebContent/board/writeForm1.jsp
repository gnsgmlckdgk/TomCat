<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<section class="wrapper">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String nick = (String)session.getAttribute("nick");	// 닉네임
%>
<form action="./BoardWriteAction1.bb" method="post" name="fr">
글쓴이:<input type="text" name="nick_name" value=<%=nick%> readonly><br>
제목:<input type="text" name="subject" ><br>
내용:<textarea rows="10" cols="20" name="content" ></textarea><br>
<input type="submit" value="글쓰기">
</form>
</body>
</html>
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
