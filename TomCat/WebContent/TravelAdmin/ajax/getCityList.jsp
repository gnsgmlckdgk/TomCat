<%@page import="net.plan.db.PlanCityBean"%>
<%@page import="net.plan.db.PlanDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");

	// 파라미터 값 가져오기
	String country_code = request.getParameter("country_code");
	

	PlanDAO pdao = new PlanDAO();
	List<PlanCityBean> cityList = pdao.getCityList2(country_code);
%>
<%
		if(cityList.size()!=0) {
			for(int i=0; i<cityList.size(); i++) {
				PlanCityBean pcb = cityList.get(i);
				%>
					<option value="<%=pcb.getCity_code()%>"><%=pcb.getName()%></option>
				<%
			}
		}else{
			%>
				<option>입력된 정보가 없습니다.</option>
			<%	
		}
%>