<%@page import="net.reply.db.ReplyBean"%>
<%@page import="java.util.List"%>
<%@page import="net.reply.db.ReplyDAO"%>
<%@page import="net.board.db.boardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.2.0.js"></script>
<style type="text/css">
#replytextarea{
display:none;
}

#replymodify{
display:none;
}
</style>

<script type="text/javascript">
function func1(re_num){		
	$(document).ready(function() {	
		var x=document.getElementById('replytextarea');		
		x.style.display='display';		
		$('.replyreply'+re_num).toggle('slow',function(){				
			});	
	});	
	}	
function func2(){alert("정말 삭제하시겠습니까?");}


function func3(i){
	
	$(document).ready(function() {	

		var x=document.getElementById('originalreply'+i);
		
		x.style.display='none';		
			$('.replymodifyclass'+i).toggle('slow',function(){
				
			});	

	});
	
}


</script>

<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<link rel="stylesheet" href="./assets/css/instagram/content.css"/>	
	<%	
	
	String id = (String)session.getAttribute("id");			// 아이디
	String nick = (String)session.getAttribute("nick");	// 닉네임
	
	
	
		boardBean bb = (boardBean) request.getAttribute("bb");
		ReplyBean rb=new ReplyBean();
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
	%>
	<section class="wrapper">
	
	<h1><%=bb.getNick() %>님의 멋진 인생샷♡</h1>
	<table class="table1">
		<tr>
			<td colspan="2"><%=bb.getSubject()%></td>
			<td><%=nick%></td>
			<td><%=bb.getDate()%></td>
		</tr>
		<tr>
			<td colspan="4"><a href="./upload/<%=bb.getImage1()%>"><%=bb.getImage1()%></a></td>
		</tr>
		<tr>
			<td colspan="4">
			
			<img src="./upload/<%=bb.getImage1()%>"
				width=400 height=400 onerror="this.src='./images/instagram/noimage.png'"></td>
		</tr>
		<tr>
			<td colspan="4"><%=bb.getContent()%></td>
		</tr>
		<tr>
		<td>
		<%if(bb.getNick().equals(nick)){%>	
	<input type="button" style="margin-left:50px;"
	 value="글수정" onclick="location.href='./BoardUpdate.bo?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
		</td>
		<td colspan="2">
				<form action="./BoardDeleteAction.bo" method="post" name="fr" onclick="func2()">					
					<input type="hidden" value="<%=num%>" name="num"> 															
					<input type="hidden" value="<%=pageNum%>" name="pageNum">					
					<input type="submit" value="글삭제">
				</form>
				</td>

		<%} %>
<td colspan="4">
	<input id="listbutton" type="button" value="글목록 "
		onclick="location.href='BoardList.bo?pageNum=<%=pageNum%>'">
		
	</td>	
		
		
		</tr>
		
		
	</table>
	


	<!--리플 -->	
	<%
	
		ReplyDAO rdao = new ReplyDAO();	
		int recount=((Integer)request.getAttribute("replycount")).intValue();
		
		List replylist = (List) request.getAttribute("rl");
	
		int count = ((Integer) request.getAttribute("count")).intValue();
		int pageSize = ((Integer) request.getAttribute("pageSize")).intValue();
		int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
		int startrow = ((Integer) request.getAttribute("startrow")).intValue();
		int endRow = ((Integer) request.getAttribute("endRow")).intValue();
	
		if(recount!=0){

	%>
	<table class="table2">
		<tr>
			<td colspan="2">닉네임</td>
			<td colspan="2">답 글</td>
			<td>작성일</td>
		</tr>
		<%for(int i=0;i<replylist.size();i++){
			rb = (ReplyBean)replylist.get(i);
			%>
<!-- 			댓글수정시 뜨는창 -->
			<tr id="replymodify" class="replymodifyclass<%=i%>">
			<td colspan="2"><%=rb.getNick() %></td>
			<td colspan="2">	
					
			<form action="RreplyUpdateAction.re" method="post" name="fr">
					<input type="hidden" value="<%=nick %>" name="nick"> 
					<input type="hidden" value="<%=rb.getNum()%>" name="num"> 
					<input type="hidden" value="<%=rb.getRe_num() %>" name="re_num">									
					<input type="hidden" value="<%=pageNum%>" name="pageNum"> 
					<input type="text" value="<%=rb.getContent() %>" name="content">			
					<input type="submit" id="txt" value="수정">			
			</form>	
					
			</td>			
			<td><%=rb.getDate()%></td>
			</tr>
			
			
		<tr id="originalreply<%=i%>">
		<td colspan="2">
		<%
		int wid=0;
		if(rb.getRe_lev()>0){
			wid=40*rb.getRe_lev();
			%>
			<img src="./images/instagram/level.gif" width="<%=wid%>" height="15">
			<img src="./images/instagram/re.gif">
			
	<%	} %>
		<%=rb.getNick() %>		
		</td>

	<td colspan="2"><%=rb.getContent() %>
	
<%if(rb.getNick().equals(nick)){%>
<input type="button" id="txt" value="삭제" onclick="location.href='./ReplyDelete.re?num=<%=rb.getNum()%>&pageNum=<%=pageNum%>&re_num=<%=rb.getRe_num()%>'">
<%int re_num=rb.getRe_num(); %>	
<input type="button" id="txt" value="수정" onclick="func3(<%=i%>)">
<%}


if(id!=null){%>
<input type="button" id="txt" value="댓글" onclick="func1(<%=rb.getRe_num()%>)">
<%} %>

		</td>
		
		<td><%=rb.getDate() %></td>
		</tr>	
		
<!-- 		대댓글창 -->
		<tr id="replytextarea" class="replyreply<%=rb.getRe_num() %>"><td colspan="5">
				<form action="ReplyReplyWriteAction.re" method="post" name="fr">
					<input type="hidden" value="<%=nick %>" name="nick"> 
					<input type="hidden" value="<%=rb.getNum()%>" name="num"> 
					<input type="hidden" value="<%=rb.getRe_ref() %>" name="re_ref">					
					<input type="hidden" value="<%=rb.getRe_lev() %>" name="re_lev">
					<input type="hidden" value="<%=rb.getRe_seq() %>" name="re_seq">
					<input type="hidden" value="<%=rb.getRe_num() %>" name="re_num">
									
					<input type="hidden" value="<%=pageNum%>" name="pageNum"> 
					<textarea rows="2" cols="100" name="content"></textarea>
					<input type="submit" id="submit" value="입력">
				</form>		
				
		
		</td></tr>
		<%} %>
		
		
<!-- 		댓글창 -->

		<tr id="replytextarea2">
			<td colspan="6">

				<form action="./ReplyWriteAction.re" method="post" name="fr">
					<input type="hidden" value="<%=nick%>" name="nick"> 
					<input type="hidden" value="<%=num%>" name="num"> 
					<input type="hidden" value="<%=rb.getRe_ref() %>" name="re_ref">								
					<input type="hidden" value="<%=rb.getRe_lev() %>" name="re_lev">
					<input type="hidden" value="<%=rb.getRe_seq() %>" name="re_seq">
					<input type="hidden" value="<%=rb.getRe_num() %>" name="re_num">										
					<input type="hidden" value="<%=pageNum%>" name="pageNum"> 
					
					<textarea rows="2" cols="80" name="content"></textarea>
					<input type="submit" id="submit" value="입력">
				</form>

			</td>
		</tr>

		
	</table>

<!-- 리플 페이징 -->
		<% 		
	//페이지 출력
	if(count!=0){
		//전체 페이지수 구하기 게시판 글 50개 한화면에 보여줄 글개수 10 =>5  전체페이지+0=>5
					//게시판 글 56개 한화면에 보여줄 글개수 10 =>5 전체페이지+1(나머지)=>6 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		//한 화면에 보여줄 페이지 번호 개수
		int pageBlock=5;
		//시작페이지 번호 구하기 1~10=>1  11~20=>11  21~30=>21
		int startPage=((currentPage-1)/pageBlock)*pageBlock+1;
		//끝페이지 번호 구하기
		int endPage=startPage+pageBlock-1;
		if(endPage>pageCount){
			endPage=pageCount;}
		//이전
		if(startPage>pageBlock){
			%><a href="./BoardContent.bo?num=<%=num %>&pageNum=<%=startPage-pageBlock%>">[이전]</a>
	<%
		}
		//1...10
		for(int i=startPage;i<=endPage;i++){
			%><a href="./BoardContent.bo?num=<%=num %>&pageNum=<%=i%>">[<%=i%>]</a>
	<%
		}
		//다음
		if(endPage< pageCount){
			%><a href="./BoardContent.bo?num=<%=num %>&pageNum=<%=startPage+pageBlock %>">[다음]</a>
			
			
			
	<%
				}		
			}
		
		}
		if(recount==0){
			%>
					<form action="./ReplyWriteAction.re" method="post" name="fr">
					<input type="hidden" value="<%=bb.getSubject()%>" name="nick">							
					<input type="hidden" value="<%=rb.getNick() %>" name="nick"> 
					<input type="hidden" value="<%=num%>" name="num"> 
					<input type="hidden" value="<%=rb.getRe_ref() %>" name="re_ref">								
					<input type="hidden" value="<%=rb.getRe_lev() %>" name="re_lev">
					<input type="hidden" value="<%=rb.getRe_seq() %>" name="re_seq">
					<input type="hidden" value="<%=rb.getRe_num() %>" name="re_num">										
					<input type="hidden" value="<%=pageNum%>" name="pageNum"> 
					
					
					<textarea rows="2" cols="80" name="content"></textarea>
					<input type="submit" value="입력">
				</form>
				<%}%>

	<!--리플 -->
</section>

</body>
</html>
		
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
