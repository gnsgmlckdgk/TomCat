<%@page import="net.member.db.MemberDAO"%>
<%@page import="net.member.action.MailAuthentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String id = request.getParameter("id");

// 아이디(이메일) 중복확인
MemberDAO mdao = new MemberDAO();
int check = mdao.idOverlapCheck(id);

MailAuthentication mail = null;
int certificationNumber;					// 인증번호

if(check == 1) {
	// 인증번호 보내기
	mail = new MailAuthentication();
	String subject = "BEFORE YOU GO 회원가입 인증번호";
	String content = "안녕하세요! BEFORE YOU GO입니다.\n인증번호는 다음과 같습니다.\n인증번호: ";
	//certificationNumber = mail.sendMail(content, id, subject);	// 카페24용
	certificationNumber = mail.sendMail(id);					// gmail용
}else {	// 인증번호 안보냄
	certificationNumber = -1;
}
%>

<%=certificationNumber%>