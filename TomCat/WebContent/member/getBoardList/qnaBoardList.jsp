<%-- <%@page import="net.QandA.db.QandABean"%>
<%@page import="java.util.List"%>
<%@page import="net.member.db.MemberBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* DB가 아직 없어서 생기면 작업 */

// 세션값 가져오기
String nick = (String)session.getAttribute("nick");

// 인생샷그램 게시글 리스트 가져오기
MemberBoardDAO mbdao = new MemberBoardDAO();

String pageNum = request.getParameter("pageNum");
if(pageNum==null) {	// 처음 시작시 무조건 1페이지
	pageNum = "1";
}
int currentPage = Integer.parseInt(pageNum);
int count = mbdao.getQandAcount(nick);
int pageSize = 5;
int startRow = (currentPage - 1) * pageSize + 1;

List<QandABean> list = null;
if(count != 0) {
	list = mbdao.getQandAList(startRow, pageSize, nick);
}

%>
<table>
<tr>
	<th>글 번호</th><th>제목</th><th>작성한 날짜</th><th>관리</th>
</tr>
<%

QandABean qab = null;
if(count == 0) {
	%>
	<tr>
		<td colspan="4">작성한 글이 없습니다.</td>
	</tr>
	</table>
	<%
}else {
	for(int i=0; i<list.size(); i++) {
		qab = list.get(i);
		%>
		<tr>
			<td><%= %></td><td><%= %></td><td><%= %></td><td><a href="#">삭제</a></td>
		</tr>
		<%
	}
	%>
	</table>
	<div class="page">
			<%
			int pageCount = count/pageSize + (count%pageSize==0 ? 0:1);
			int pageBlock = 5;
			int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			// 이전 페이지
			if(currentPage > pageBlock) {
				%>
				<script type="text/javascript">
				function prev_qna() {
					$.ajax({
						type:"POST",
		       		 url:"./member/getBoardList/qnaBoardList.jsp",
		       		 data : {<%=currentPage-pageBlock%>},
		       		 success: function(data){
		       			$('.qnaBoard .table').empty();
		         		$('.qnaBoard .table').append(data);
		      		  },
		        		error: function(xhr, status, error) {
		           		 alert(error);
		       		 }   
					});
				}
				</script>
				<a href="javascript:prev_qna();">이전</a>
				<%	
			}
			// 페이징 번호
			%>
			<script type="text/javascript">
				function pageChange_qna(i) {
					$.ajax({
						type:"POST",
		       		 url:"./member/getBoardList/qnaBoardList.jsp",
		       		 data : {pageNume : i},
		       		 success: function(data){
		       			$('.qnaBoard .table').empty();
		         		$('.qnaBoard .table').append(data);
		      		  },
		        		error: function(xhr, status, error) {
		           		 alert(error);
		       		 }   
					});
				}
				</script>
			<%
			for(int i=startPage; i<=endPage; i++) {
				%>
				<a href="javascript:pageChange_qna(<%=i%>);"><%=i %></a>
				<%
			}
			// 다음 페이지
			if(endPage < pageCount) {
				%>
				<script type="text/javascript">
				function next_qna() {
					$.ajax({
						type:"POST",
		       		 url:"./member/getBoardList/qnaBoardList.jsp",
		       		 data : {<%=endPage+pageBlock%>},
		       		 success: function(data){
		       			$('.qnaBoard .table').empty();
		         		$('.qnaBoard .table').append(data);
		      		  },
		        		error: function(xhr, status, error) {
		           		 alert(error);
		       		 }   
					});
				}
				</script>
				<a href="javascript:next_qna();">다음</a>
				<%
			}
			%>
		</div>
	<%
}%> --%>