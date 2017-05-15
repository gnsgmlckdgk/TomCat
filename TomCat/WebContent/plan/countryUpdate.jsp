<%@page import="net.plan.db.PlanCountryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" />

<div class="clear"></div>
<%
	PlanCountryBean pcb = (PlanCountryBean)request.getAttribute("pcb");
%>

<section>
<div  style="width: 50em; margin: auto;">
	<form action="./CountryUpdateAction.pl" name="coun_fr" method="post">
		대륙
		<select name="continent">
			<option value=<%=pcb.getContinent() %>><%=pcb.getContinent() %></option>
			<option value="asia">아시아</option>
			<option value="europe">유럽</option>
			<option value="north">북미</option>
			<option value="oceania">남태평양</option>
			<option value="south">남미</option>
		</select>
		
		국가 코드
		<input type="text" name="country_code" value="<%=pcb.getCountry_code() %>">
		
		국가 이름
		<input type="text" name="name" value="<%=pcb.getName() %>">
		
		국가 영어이름
		<input type="text" name="en_name" value="<%=pcb.getEn_name() %>">
		
		정보
		<textarea rows="20" cols="20" name="info"><%=pcb.getInfo() %></textarea>
		
		<input type="submit"  value="수정" >	
	</form>
</div>
</section>

<div class="clear"></div>
<!-- footer -->
<jsp:include page="../inc/footer.jsp" />