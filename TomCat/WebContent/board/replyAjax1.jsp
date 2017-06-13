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

Reply1DAO rdao = new Reply1DAO();

   String pageNum=request.getParameter("pageNum");
	if (pageNum == null) { // 처음 시작시 무조건 1페이지
		pageNum = "1";
	}
	
	
	
	int currentPage = Integer.parseInt(pageNum);
	int count = rdao.replyCount(num);
	int pageSize = 6;
	int startRow = (currentPage - 1) * pageSize + 1;
	
      
      List<Reply1Bean> replyList=rdao.getReplyList(startRow,pageSize,num);
      request.setAttribute("replyList", replyList);
      System.out.println(replyList.size());
      for(int i=0; i<replyList.size(); i++){
         Reply1Bean rr = replyList.get(i);
%>

   <div id="rp_nick">
              <%=rr.getNick()%>
                 </div>
                 
              <div id="rp_con">
              <%=rr.getContent() %>
              </div>

              <%} %>
           <form action="./ReplyWriteAction1.rr?pageNum=<%=pageNum %>" method="post" name="fr"  style="width: 50%;" onsubmit="return reSubmit()">         
               <input type="hidden" value="<%=session.getAttribute("id")%>" name="nick">                   
               <input type="hidden" value="<%=num%>" name="num">
               <input type="hidden" value="<%=pageNum%>" name="pageNum"> 
                     
         <textarea rows="2" cols="80" name="content"  class="re_id" > </textarea>
         <input type="submit"  id="txt1"  value="입력"  required>
         </form>

    <div class="page1">
	<%
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 5;
			int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			// 이전 페이지
			if (currentPage > pageBlock) {
	%>
	<script type="text/javascript">
		function prev_tog() {
			/* 페이지 처음 실행시 게시글 목록 조회 */
			$.ajax({
				type : "POST",
				url : "./board/replyAjax1.jsp",
				data : { 
							pageNum :<%=currentPage - pageBlock%>,
							num:<%=num%>
							},
				success : function(data) {
					  $('#dat1<%=num%>').empty();
			           $('#dat1<%=num%>').append(data);
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			});
		}
	</script>
	<a href="javascript:prev_tog();">이전</a>
	<%
		}
			// 페이징 번호
	%>
	<script type="text/javascript">
		function pageChange_tog(i) {
			/* 페이지 처음 실행시 게시글 목록 조회 */
			$.ajax({
				type : "POST",
				url : "./board/replyAjax1.jsp",
				data : {
					pageNum : i,
					num:<%=num%>
				},
				success : function(data) {
					 $('#dat1<%=num%>').empty();
			         $('#dat1<%=num%>').append(data);
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			});
		}
	</script>
	<%
		for (int i = startPage; i <= endPage; i++) {
	%>
	<a href="javascript:pageChange_tog(<%=i%>);" <%if (currentPage == i) {%>
		style="color: #1a7ad9; border: 1px solid #1a7ad9; text-decoration: none; color: skyblus;" <%}%>><%=i%></a>
	<%
		}
			// 다음 페이지
			if (endPage < pageCount) {
	%>
	<script type="text/javascript">
		function next_tog() {
			/* 페이지 처음 실행시 게시글 목록 조회 */
			$.ajax({
				type : "POST",
				url : "./board/replyAjax1.jsp",
				data : {
					pageNum :
	<%=endPage + pageBlock%>,
	num:<%=num%>
		},
				success : function(data) {
					 $('#dat1<%=num%>').empty();
			         $('#dat1<%=num%>').append(data);
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			});
		}
	</script>
	<a href="javascript:next_tog();">다음</a>
	<%
		}
	%>
</div>
  
</body>
</html>