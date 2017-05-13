<%@page import="net.plan.db.PlanCountryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" />

<div class="clear"></div>

<section>
<%
	List countryList = (List)request.getAttribute("countryList"); 
	String pageNum=(String)request.getAttribute("pageNum");
	int count=((Integer)request.getAttribute("count")).intValue();
	int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
	int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
	int startPage=((Integer)request.getAttribute("startPage")).intValue();
	int endPage=((Integer)request.getAttribute("endPage")).intValue();
%>
<div  style="width: 50em; margin: auto;">
<h3>DB 국가 개수 :<%=count %> </h3>

	<!-- 국가 리스트 출력 -->
	<table border="1">
		<tr>
			<td>국가 코드</td>
			<td>국가 이름</td>
			<td>대륙</td>
			<td>국가 영어이름</td>
			<td>정보</td>
		</tr>
		
		<%
		for (int i=0; i<countryList.size();i++){
			PlanCountryBean pcb = (PlanCountryBean)countryList.get(i);
		%>
		<tr>
			<td><a href="./CountryUpdate.pl?pageNum='<%=pageNum%>'&country_code=<%=pcb.getCountry_code() %>"><%=pcb.getCountry_code() %></a></td>
			<td><%=pcb.getName() %></td>
			<td><%=pcb.getContinent() %></td>
			<td><%=pcb.getEn_name() %></td>
			<td><%=pcb.getInfo() %></td>
		</tr>
		<%}//for %>
	</table>
	
	<!-- 페이지 출력 -->
	<%	
	if(count != 0){
	if(startPage>pageBlock){
	%><a href="./CountryList.pl?pageNum=<%=startPage - pageBlock%>" <%=startPage - pageBlock%>">[이전]</a>	
	<%}//if
	
	for (int i = startPage; i <= endPage; i++) {
	%><a href="./CountryList.pl?pageNum=<%=i%>">[<%=i%>]</a>
	<%}//for
	
	if (endPage < pageCount) {
	%><a href="./CountryList.pl?pageNum=<%=startPage + pageBlock%>">[다음]</a>
	<%
		}//if
	}//if
	%>	
	
	<!-- 국가 추가 버튼 -->
	<input type="button" onclick="location.href='./countryAdd.pl'" value="국가 추가하기">	
</div>
</section>

<div class="clear"></div>
<!-- footer -->
<jsp:include page="../inc/footer.jsp" />