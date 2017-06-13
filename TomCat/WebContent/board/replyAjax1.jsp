<%@page import="net.reply1.db.Reply1Bean"%>
<%@page import="java.util.List"%>
<%@page import="net.reply1.db.Reply1DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int num= Integer.parseInt(request.getParameter("num"));
System.out.print("넘버값이 들어오나 확인창"+num);


	String pageNum=request.getParameter("pageNum");
	
		Reply1DAO rdao = new Reply1DAO();
		List<Reply1Bean> replyList=rdao.getReplyList(1,10,num);
		request.setAttribute("replyList", replyList);
		System.out.println(replyList.size());
		for(int i=0; i<replyList.size(); i++){
			Reply1Bean rr = replyList.get(i);
%>

	<div id="rp_nick">
        		<%=rr.getNick()%>
        		<%=rr.getContent() %>
        		</div>
        		
        		<%} %>
</body>
</html>