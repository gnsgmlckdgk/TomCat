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
<div id="combine">
<table class="table1">
<tr><td>글넘버</td><td>글쓴이</td><td>제목</td><td>날짜</td><td>조회수</td></tr>
<%
		if(count!=0){
			for(int i=0;i<QandAList.size();i++){
				QandABean qb=(QandABean)QandAList.get(i);
%>

<tr>
<td>
		<%
		int wid=0;
		if(qb.getRe_lev()>0){
			wid=40*qb.getRe_lev();
			%>
			<img src="./images/QandA/level.gif" width="<%=wid%>" height="15">
			<img src="./images/QandA/re.gif">
			
	<%	} %>



<%=qb.getNum()%></td>
<td><%=qb.getNick()%></td>
<td>
<a href="./QandAContentAction.qna?num=<%=qb.getNum()%>&pageNum=<%=pageNum %>">
<%=qb.getSubject()%></a>

</td>
<td><%=qb.getDate()%></td>
<td><%=qb.getReadcount() %></td>
</tr>
<%} %>
<tr><td colspan="5">

			<%
// 			=======================페이지출력===================
			
			if(count!=0){//글이 한개라도 있을때 하기 출력

				if(endPage>pageCount){
					endPage=pageCount;}
				//이전
				if(startPage>pageSize){
					%><a href="./QandAList.qna?pageNum=<%=startPage-pageSize%>">[이전]</a>
			<%
				}
				//1...10
				for(int j=startPage;j<=endPage;j++){
					%><a href="./QandAList.qna?pageNum=<%=j%>">[<%=j%>]
			</a>
			<%
				}
				//다음
				if(endPage< pageCount){
					%><a href="./QandAList.qna?pageNum=<%=startPage+pageSize %>">[다음]</a>
			<%}		
			}		
			%>	



</td>

</tr>

<%

			} %>
</table>

<table id="banner">
<tr><td><a href="./QandAWrite.qna">Q&A글쓰기</a></td></tr>
<tr><td><a href="#">자주묻는 질문</a></td></tr>
<tr><td><a href="./QandAList.qna">목록으로</a></td></tr>

</table>
</div>

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
