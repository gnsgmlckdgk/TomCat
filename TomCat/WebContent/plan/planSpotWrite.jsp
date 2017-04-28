<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@page import="sun.nio.cs.HistoricallyNamedCharset"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = (String) session.getAttribute("id");
	String nick = (String) session.getAttribute("nick");
	String region = (String) request.getParameter("region");
	Date now = new Date();
%>
<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- Banner -->
<section id="banner">
	<h2><%=region%>의 맛집, 관광지, 숙소를 추천하는 공간입니다.
	</h2>
	<p>
		여기서 db에 저장해야 하는 값이 뭘까? <br /> 현재 session의 id는
		<%=id%>, nick은
		<%=nick%>입니다.
	</p>
	<br>

	<!-- 입력란 들어갈 곳. -->
	<form action="">
		<table
			style="width: 80%; margin: auto; background-color: white; opacity: 0.85; border-radius: 20px;">
			<tr>
				<td>작성자 : <input type="text" value="<%=nick%>" name="nick"
					readonly="readonly" /></td>
				<td>작성일 : <input type="text" value="<%=now%>" name="date"
					readonly="readonly" /></td>
				<td>작성시간 : <input type="text" value="<%=region%>"
					name="region" readonly="readonly" /></td>
			</tr>
			<tr>
				<td colspan="3">작성란<br>
				<textarea rows="10" cols="10"></textarea></td>
			<tr>
			<tr>
				<td colspan="3">어떤 내용을 보내어야 하는가. db에 어떤 내용을..사진, 위치값,</td>			
			</tr>
		</table>

		<br>


		<ul class="actions">
			<li><a href="#" class="button special big">작성완료</a></li>
			<li><a href="#" class="button big">돌아가기</a></li>
		</ul>


	</form>
	<!-- 입력란 들어갈 곳. 끝. -->

</section>




<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />