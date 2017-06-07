<%@page import="net.Board1.db.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- Header -->
<jsp:include page="../inc/header.jsp" />
<section class="wrapper" style="padding:0 ;">
<!-- Header ph -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body id="upBody">
<%
BoardBean bb = (BoardBean)request.getAttribute("bb");
String pageNum = (String)request.getAttribute("pageNum");

%>
<div class="update1" style="width:900px; margin-left: 500px;">
<form action="./BoardUpdateAction1.bb?pageNum=<%=pageNum%>" method="post" name="fr">
<input type="hidden" name="num" value="<%=bb.getNum()%>">
<b>글쓴이:<input type="text" name="name" value="<%=bb.getNick_name()%>" style="width: 200px;"><br></b>
<b>제목:<input type="text" name="subject" value="<%=bb.getSubject()%>" style="width: 650px;"><br></b>
<b>내용:<textarea rows="10" cols="20" name="content"><%=bb.getContent() %></textarea><br></b>
<input type="submit" value="글수정" style="margin-left: 350px;">
</form>
</div>
</body>
</html>
<!-- Footer --> <jsp:include page="../inc/footer.jsp" />