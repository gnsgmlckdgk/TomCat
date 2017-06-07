<%@page import="net.plan.db.PlanSpotCommentBean"%>
<%@page import="net.plan.db.PlanCommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	
	// 파라미터 값 가져오기
	String spot = request.getParameter("spot");
	String nick = (String)session.getAttribute("nick");
	String content = request.getParameter("content");
	int eval = Integer.parseInt(request.getParameter("eval"));
	
	// DB작업
	PlanCommentDAO pcdao = new PlanCommentDAO();
	PlanSpotCommentBean pscb = new PlanSpotCommentBean();
	
	pscb.setSpot(spot);
	pscb.setNick(nick);
	pscb.setContent(content);
	pscb.setEval(eval);
	
	pcdao.insertSpotComment(pscb);
%>