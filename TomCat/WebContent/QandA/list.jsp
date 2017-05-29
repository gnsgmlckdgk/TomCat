<%@page import="net.QandA.db.QandABean"%>
<%@page import="net.QandA.db.QandADAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<link rel="stylesheet" href="./assets/css/QandA/list.css"/>	

<%
String id = (String)session.getAttribute("id");
String nick = (String)session.getAttribute("nick");		

List QandAList=(List)request.getAttribute("ql");
int count=((Integer)request.getAttribute("count")).intValue();
int pageSize=((Integer)request.getAttribute("pageSize")).intValue();
String pageNum=(String)request.getAttribute("pageNum");
int currentPage=((Integer)request.getAttribute("currentPage")).intValue();
int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
int startPage=((Integer)request.getAttribute("startPage")).intValue();
int endPage=((Integer)request.getAttribute("endPage")).intValue();

QandADAO qdao=new QandADAO();

if(id!=null){%>
		<a href="./QandAWrite.qna">Q&A글쓰기</a>
	<br>
<%}%>

<table>
<tr><td>글넘버</td><td>글쓴이</td><td>제목</td><td>날짜</td></tr>
<%
		if(count!=0){
			for(int i=0;i<QandAList.size();i++){
				QandABean qb=(QandABean)QandAList.get(i);
%>

<tr>
<td><%=qb.getNum()%></td>
<td><%=qb.getNick()%></td>
<td><%=qb.getSubject()%></td>
<td><%=qb.getDate()%></td>
</tr>


<%}

			} %>
						</table>
	
	

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
