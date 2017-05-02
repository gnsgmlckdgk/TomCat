<%@page import="net.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    // nickOverlapCheck.jsp와 비슷하지만 id에서 쓰는 기존의 닉네임과 같을때는 중복으로 보지 않는다.
    MemberDAO mdao = new MemberDAO();
    
    String id = request.getParameter("id");
    String nick = request.getParameter("nick");
    int check = mdao.nickOverlapCheck2(id, nick);
    %>
    
    <%=check%>