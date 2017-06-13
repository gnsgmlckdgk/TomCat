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
	int currentPage = Integer.parseInt(pageNum);
	
	Reply1DAO r1dao = new Reply1DAO();
	
	int count = r1dao.replyCount(num);
	int pageSize = 5;
	int startRow = (currentPage - 1) * pageSize + 1;
	
		Reply1DAO rdao = new Reply1DAO();
		List<Reply1Bean> replyList=rdao.getReplyList(startRow,pageSize,num);
		
		System.out.println("사이즈: " + replyList.size());
		
		if(count!=0) {
			for(int i=0; i<replyList.size(); i++){
				Reply1Bean rr = replyList.get(i);
		
%>
<div id="dat2">
	<div id="rp_nick">
        		<%=rr.getNick()%>
        		</div>
        		
     <div id="rp_date">
        		<%=rr.getDate() %>
        		</div>
        		
      <div id="rp_con">
        		<%=rr.getContent()%>
       		    </div>
       		     		
        	<%} 
        	}%>
        		</div>
</body>
</html>