<%@page import="net.member.action.MemberLoginKeySetting"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    // 로그인 팝업 띄우기 전에 RSA암호화를 위해 키를 생성, 공개키는 request에 개인키는 session에 저장됨
    MemberLoginKeySetting keySet = new MemberLoginKeySetting();
    keySet.ketSet(request);	// request에 공개키 담음
    %>
    
<input type="hidden" id="rsaPublicKeyModulusLogin" value="<%=request.getAttribute("publicKeyModulusLogin")%>" />
<input type="hidden" id="rsaPublicKeyExponentLogin" value="<%=request.getAttribute("publicKeyExponentLogin")%>" />