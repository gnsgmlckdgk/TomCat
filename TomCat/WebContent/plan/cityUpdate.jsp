<%@page import="net.plan.db.PlanCityBean"%>
<%@page import="net.plan.db.PlanCountryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" />

<div class="clear"></div>
<%
	request.setCharacterEncoding("utf-8");
	
	String city_code=(String)request.getParameter("city_code");
	List countryList =(List)request.getAttribute("countryList");
	PlanCityBean pcb = (PlanCityBean)request.getAttribute("pcb");
	String pageNum = (String)request.getAttribute("pageNum");
%>

<section>

<div  style="width: 50em; margin: auto;">
	<form action="./CityUpdateAction.pl" name="city_fr" method="post">
		국가코드
		<select name="country_code">
			<option value=<%=pcb.getCountry_code() %>><%=pcb.getCountry_code() %></option>
			<%
				for(int i=0;i<countryList.size();i++){
					PlanCountryBean pcob = (PlanCountryBean)countryList.get(i);
					%>
					<option value="<%=pcob.getCountry_code() %>"><%=pcob.getName() %></option>
					<%
				}
			%>
		</select>  
		
		<!-- 도시 코드  ==> 도시영어이름과 동일 -->
		<input type="hidden" name="city_code" value="<%=city_code%>">
		
		도시 이름
		<input type="text" name="name" value="<%=pcb.getName()%>">
		
		도시 영어이름
		<input type="text" name="en_name" value="<%=pcb.getEn_name()%>">
		
		정보
		<textarea rows="20" cols="20" name="info"><%=pcb.getInfo()%></textarea>
	
		<input type="submit"  value="수정">
		
	</form>
</div>

</section>

<div class="clear"></div>
<!-- footer -->
<jsp:include page="../inc/footer.jsp" />