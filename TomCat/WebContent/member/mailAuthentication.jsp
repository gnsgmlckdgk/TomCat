<%@page import="net.member.action.MailSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 메일로 인증번호 보내는 페이지 -->
	<%
	MailSession mail = new MailSession();
	int certificationNumber = mail.sendMail(request.getParameter("id"));
	%>
	
	<!-- 인증번호 -->
	<%=certificationNumber %>
	
</body>
</html>