<%-- <%@page import="java.sql.Statement"%> --%>

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

<!-- 추가한 스크립트 -->
<script type="text/javascript" src="./assets/js/member/join.js"></script>	<!-- 회원가입 제약조건 및 암호화 -->


	<%

	List boardList=(List)request.getAttribute("bl");
	
	int count=((Integer)request.getAttribute("count")).intValue();
	int pageSize=((Integer)request.getAttribute("pageSize")).intValue();
	String pageNum=(String)request.getAttribute("pageNum");
	int currentPage=((Integer)request.getAttribute("currentPage")).intValue();
	int startrow=((Integer)request.getAttribute("startrow")).intValue();
	int endRow=((Integer)request.getAttribute("endRow")).intValue();

	BoardDAO bdao = new BoardDAO();	
	ReplyDAO rdao=new ReplyDAO();
	

	
			 %>
		<a href="./BoardWrite.bo">인생샷 공유해요~</a>
		

		
			<table>
		<%
		int boardcount=bdao.getBoardcount();
		if(boardcount!=0){
		
			for(int i=0;i<boardList.size();i++){
				//자바빈(boardBean) 변수=배열한칸 접근 배열변수.get()
			boardBean bb=(boardBean)boardList.get(i);
			%>
		<tr>
			<td colspan="4"><%=bb.getSubject() %>(<%=rdao.replyCount(bb.getNum()) %>)</td>
			</tr>		
			<tr><td>닉네임:</td><td><%=bb.getNick()%></td>
			<td>업로드날짜:</td><td><%=bb.getDate() %></td>
			</tr>	
			<tr>
			<td colspan="4">
			<a href="./BoardContent.bo?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
			<img src="./upload/<%=bb.getImage1()%>" width=300 height=300></a>
			</td></tr>
					
		<%
			}
			%>
			
	</table>
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
	<%
			}		
	}
	}
	%>


</body>
		
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />