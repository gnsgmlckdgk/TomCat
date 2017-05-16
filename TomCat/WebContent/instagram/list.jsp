<%-- <%@page import="java.sql.Statement"%> --%>

<%@page import="net.like.db.LikeDAO"%>
<%@page import="net.like.db.LikeBean"%>
<%@page import="net.member.db.MemberBean"%>
<%@page import="net.reply.db.ReplyDAO"%>
<%@page import="com.mysql.jdbc.jdbc2.optional.SuspendableXAConnection"%>
<%@page import="net.board.db.boardBean"%>
<%@page import="net.board.db.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<link rel="stylesheet" href="./assets/css/instagram/list.css"/>	
<section class="wrapper">

	
	<%
	String id = (String)session.getAttribute("id");			// 아이디
	String nick = (String)session.getAttribute("nick");	// 닉네임
		

	List boardList=(List)request.getAttribute("bl");
	
	int count=((Integer)request.getAttribute("count")).intValue();
	int pageSize=((Integer)request.getAttribute("pageSize")).intValue();
	String pageNum=(String)request.getAttribute("pageNum");
	int currentPage=((Integer)request.getAttribute("currentPage")).intValue();
	int startrow=((Integer)request.getAttribute("startrow")).intValue();
	int endRow=((Integer)request.getAttribute("endRow")).intValue();

	BoardDAO bdao = new BoardDAO();	
	ReplyDAO rdao=new ReplyDAO();
	

	
if(id!=null){
			 %>
			 
		<a href="./BoardWrite.bo" class="button" >인생샷 공유해요</a>
	<br><br>
	<%} %>
	
		
		

	<div class="table-wrapper">
			<table class="alt" id="border">
		<%
		
		int boardcount=bdao.getBoardcount();
		if(boardcount!=0){
		
			for(int i=0;i<boardList.size();i++){
				
				//자바빈(boardBean) 변수=배열한칸 접근 배열변수.get()
			boardBean bb=(boardBean)boardList.get(i);
				
			LikeBean lb=new LikeBean();
			LikeDAO ldao=new LikeDAO();
			int likecountall=ldao.getLikecountall(bb.getNum());
			int likecount=ldao.getLikecount(bb.getNum(), nick);
				
			%>
		<tr>
			<td colspan="4"><%=bb.getSubject() %>(댓글:<%=rdao.replyCount(bb.getNum()) %>)</td>
			</tr>		
			<tr><td>닉네임:</td><td><%=bb.getNick()%></td>
			<td>업로드날짜:</td><td><%=bb.getDate() %></td>
			</tr>	
			<tr>
			<td colspan="4">
			<a href="./BoardContent.bo?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
			<img src="./upload/<%=bb.getImage1()%>" width=300 height=300 onerror="this.src='./instagram/noimage.png'">
			</a>
			</td></tr>
		<%if(id!=null){	//아이디가 not null일때만 좋아요/좋아요취소버튼 출력%>			
			<tr >
			<td colspan="4" class="bottomline">
			
<!-- 			====================좋아요================= -->
<%

if(likecount%2==0){
%>
			<form action="./LikeaddAction.lk" method="post" name="fr" >
			<input type="submit" id="like" value="좋아요: )">	
				<%if(likecountall>0){ %>회원님 외<%=likecountall %>명<%} %>	
			
			<input type="hidden" name="num" value="<%=bb.getNum()%>">
			<input type="hidden" name="nick" value="<%=nick%>">
			<input type="hidden" name="pageNum"value="<%=pageNum%>">				
				
			</form>
			<%} %>			
						
<!-- 			====================좋아요취소=============== -->

		<%if(likecount%2!=0){			
		%>
		
			<form action="./DislikeaddAction.lk" method="post" name="fr">		
			<input type="submit" id="dislike" value="좋아요취소 ">
			<%if(likecountall>0){ %>회원님 외<%=likecountall %>명<%} %>					
			<input type="hidden" name="num" value="<%=bb.getNum()%>">
			<input type="hidden" name="nick" value="<%=nick%>">
			<input type="hidden" name="pageNum"value="<%=pageNum%>">			
			
			</form>	
			<%} %>
			
			</td>
			</tr>
		<%
			}//좋아요 취소 종료		
			}//아이디가 not null이면
			%>
			
			<tr>
			<td colspan="4" id="listpage">
			
			<%
			
			//페이지 출력
			if(count!=0){
				//전체 페이지수 구하기 게시판 글 50개 한화면에 보여줄 글개수 10 =>5  전체페이지+0=>5
							//게시판 글 56개 한화면에 보여줄 글개수 10 =>5 전체페이지+1(나머지)=>6 
				int pageCount=count/pageSize+(count%pageSize==0?0:1);
				//한 화면에 보여줄 페이지 번호 개수
				int pageBlock=10;
				//시작페이지 번호 구하기 1~10=>1  11~20=>11  21~30=>21
				int startPage=((currentPage-1)/pageBlock)*pageBlock+1;
				//끝페이지 번호 구하기
				int endPage=startPage+pageBlock-1;
				if(endPage>pageCount){
					endPage=pageCount;}
				//이전
				if(startPage>pageBlock){
					%><a href="./BoardList.bo?pageNum=<%=startPage-pageBlock%>">[이전]</a>
			<%
				}
				//1...10
				for(int i=startPage;i<=endPage;i++){
					%><a href="./BoardList.bo?pageNum=<%=i%>">[<%=i%>]
			</a>
			<%
				}
				//다음
				if(endPage< pageCount){
					%><a href="./BoardList.bo?pageNum=<%=startPage+pageBlock %>">[다음]</a>
			<%}		
			}		
			%>			
			</td>
			</tr>
	</table>
	</div>
	<%
	
	}
	%>
	
	<table class="banner">
	<tr><td>BEST샷</td></tr>
	<tr><td><img src="./instagram/italy.png" onerror="this.src='./instagram/italy.png'"></td></tr>	
	</table>
	

</section>
	
</body>
		
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />