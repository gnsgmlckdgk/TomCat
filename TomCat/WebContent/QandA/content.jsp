<%@page import="net.QandA.db.QandABean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<link rel="stylesheet" href="./assets/css/QandA/content.css"/>	
<%

String id = (String)session.getAttribute("id");			// 아이디
String nick = (String)session.getAttribute("nick");	// 닉네임
QandABean qb = (QandABean) request.getAttribute("qb");

int num=((Integer)request.getAttribute("num")).intValue();
String pageNum = request.getParameter("pageNum");

%>
<h1>Q&A</h1>

<table>
<tr><td><%=qb.getSubject() %></td><td><%=qb.getNick() %></td><td><%=qb.getDate() %></td></tr>
<tr><td colspan="3"><%=qb.getContent() %></td></tr>
</table>
	
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
