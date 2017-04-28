<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

String id = (String)session.getAttribute("id");
String nick = (String)session.getAttribute("nick");
String region = (String)request.getParameter("region");
%>
	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Banner -->
	<section id="banner">
	<h2><%=region %>의 맛집, 관광지, 숙소를 추천하는 공간입니다.</h2>
	<p>
		여기서 db에 저장해야 하는 값이 뭘까? <br /> 현재 session의 id는 <%=id %>, nick은 <%=nick %>입니다.
	</p>
	<br>
	
	<!-- 입력란 들어갈 곳. -->
	<form action="">
	<table style="width: 80%; margin: auto;">
	<tr>
	<td>작 성 자 : <input type="text" value="<%=nick %>" name="nick" readonly="readonly"/></td>
	<td>작 성 일 : <input type="text" value="시간값 받아오기" name="date" readonly="readonly"/></td>
	<td>지    역 : <input type="text" value="<%=region %>" name="region" readonly="readonly"/></td>
	</tr>
	<tr>
		<td>tt</td>	
	<tr>
	</table>
	
	<ul class="actions"> 
		<li><a href="#" class="button special big">작성완료</a></li>
	</ul>
	
	</form>
	<!-- 입력란 들어갈 곳. 끝. -->
	
	</section>



	<!-- Four -->
	<section id="four" class="wrapper style3 special">
	<div class="container">
		<header class="major">
		<h2>Aenean elementum ligula</h2>
		<p>Feugiat sed lorem ipsum magna</p>
		</header>
		<ul class="actions">
			<li><a href="#" class="button special big">Get in touch</a></li>
		</ul>
	</div>
	</section>

	<!-- Footer -->
	<jsp:include page="../inc/footer.jsp" />