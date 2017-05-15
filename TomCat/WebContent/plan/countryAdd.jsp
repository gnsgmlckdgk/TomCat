<%@page import="net.plan.db.PlanCountryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" />

<div class="clear"></div>
<%
	List countryList =(List)request.getAttribute("countList");

%>

<section>
<div  style="width: 50em; margin: auto;">
	<form action="./CounAdd.pl" name="coun_fr" method="post">
		대륙
		<select name="continent">
			<option value="asia">아시아</option>
			<option value="europe">유럽</option>
			<option value="north">북미</option>
			<option value="oceania">남태평양</option>
			<option value="south">남미</option>
		</select>
		
		국가 코드
		<input type="text" name="country_code">
		
		국가 이름
		<input type="text" name="name">
		
		국가 영어이름
		<input type="text" name="en_name">
		
		정보
		<input type="text" name="info">
		
		<input type="submit"  value="추가">	
	</form>
</div>
<%-- 
<div  style="width: 50em; margin: auto;">
	<form action="./CityAdd.pl" name="coun_fr" method="post">
		국가코드
		<select name="country_code">
			<%
				for(int i=0;i<countryList.size();i++){
					PlanCountryBean pcb = (PlanCountryBean)countryList.get(i);
					%>
					<option value="<%=pcb.getCountry_code() %>"><%=pcb.getName() %></option>
					<%
				}
			%>
		
		</select>
		
		도시 코드
		<input type="text" name="city_code">
		
		도시 이름
		<input type="text" name="name">
		
		도시 영어이름
		<input type="text" name="en_name">
		
		정보
		<input type="text" name="info">
		
		<input type="submit"  value="추가">
		
	</form>
</div>
 --%>
</section>

<div class="clear"></div>
<!-- footer -->
<jsp:include page="../inc/footer.jsp" />