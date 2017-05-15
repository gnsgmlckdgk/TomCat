<%@page import="net.plan.db.PlanCityBean"%>
<%@page import="net.plan.db.PlanCountryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" />

<div class="clear"></div>

<section>
<%
	List cityList = (List)request.getAttribute("cityList"); 
	String pageNum=(String)request.getAttribute("pageNum");
	int count=((Integer)request.getAttribute("count")).intValue();
	int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
	int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
	int startPage=((Integer)request.getAttribute("startPage")).intValue();
	int endPage=((Integer)request.getAttribute("endPage")).intValue();
%>
<div>
<h3>DB 도시 개수 :<%=count %> </h3>

	<!-- 국가 리스트 출력 -->
	<table border="1">
		<tr>
			<td>도시 코드</td>
			<td>도시 이름</td>
			<td>국가 코드</td>
			<td>도시 영어이름</td>
			<td>정보</td>
			<td>수정 / 삭제</td>
		</tr>
		
		<%
		for (int i=0; i<cityList.size();i++){
			PlanCityBean pcb = (PlanCityBean)cityList.get(i);
		%>
		<tr>
			<td><%=pcb.getCity_code() %></td>
			<td><%=pcb.getName() %></td>
			<td><%=pcb.getCountry_code() %></td>
			<td><%=pcb.getEn_name() %></td>
			<td><%=pcb.getInfo() %></td>
			
			<td>
				<input type = "button" name="update" value="수정" onclick="location.href='./CityUpdate.pl?pageNum=<%=pageNum%>&city_code=<%=pcb.getCity_code() %>'">
				<input type = "button" name="delete" value="삭제" onclick="location.href='./CityDelete.pl?pageNum=<%=pageNum%>&city_code=<%=pcb.getCity_code() %>'">
			</td>
			
		</tr>
		<%}//for %>
	</table>
	
	<!-- 페이지 출력 -->
	<%	
	if(count != 0){
	if(startPage>pageBlock){
	%><a href="./CityList.pl?pageNum=<%=startPage - pageBlock%>" <%=startPage - pageBlock%>">[이전]</a>	
	<%}//if
	
	for (int i = startPage; i <= endPage; i++) {
	%><a href="./CityList.pl?pageNum=<%=i%>">[<%=i%>]</a>
	<%}//for
	
	if (endPage < pageCount) {
	%><a href="./CityList.pl?pageNum=<%=startPage + pageBlock%>">[다음]</a>
	<%
		}//if
	}//if
	%>	
	
	<!-- 국가 추가 버튼 -->
	<input type="button" onclick="location.href='./CityAddForm.pl'" value="도시 추가하기">	
</div>
</section>

<div class="clear"></div>
<!-- footer -->
<jsp:include page="../inc/footer.jsp" />