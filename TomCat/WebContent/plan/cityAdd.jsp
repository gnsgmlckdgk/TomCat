<%@page import="net.plan.db.PlanCountryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" />

<div class="clear"></div>
<%
	request.setCharacterEncoding("utf-8");
	
	List countryList =(List)request.getAttribute("countryList");

%>

<section>

<div  style="width: 50em; margin: auto;">
	<form action="./CityAdd.pl" name="city_fr" method="post">
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
	
		<!-- 도시 코드  ==> 도시영어이름과 동일 -->
		
		
		도시 이름
		<input type="text" name="name">
		
		도시 영어이름
		<input type="text" name="en_name">
		
		정보
		<textarea rows="20" cols="20" name="info"></textarea>
	
		<input type="submit"  value="추가">
		
	</form>
</div>

</section>

<div class="clear"></div>
<!-- footer -->
<jsp:include page="../inc/footer.jsp" />