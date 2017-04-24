<%@page import="net.member.action.MailAuthentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
MailAuthentication mail = new MailAuthentication();
int certificationNumber = mail.sendMail(request.getParameter("id"));
%>

<%=certificationNumber%>