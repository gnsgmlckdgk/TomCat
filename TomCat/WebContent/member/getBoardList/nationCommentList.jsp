<%@page import="net.plan.db.PlanNationCommentBean"%>
<%@page import="java.util.List"%>
<%@page import="net.member.db.MemberBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 세션값 가져오기
	String nick = (String)session.getAttribute("nick");

	// 인생샷그램 게시글 리스트 가져오기
	MemberBoardDAO mbdao = new MemberBoardDAO();
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null) {	// 처음 시작시 무조건 1페이지
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int count = mbdao.getNationCommentCount(nick);
	int pageSize = 5;
	int startRow = (currentPage - 1) * pageSize + 1;
	
	List<PlanNationCommentBean> list = null;
	if(count != 0) {
		list = mbdao.getNationListComment(nick, startRow, pageSize);
	}
	
	%>
	<script type="text/javascript">
	function deleteCheck_nc(num) {
		var check = confirm("글을 삭제하시겠습니까?");
		if(check==true) {
			$.ajax({
				type : "GET",
				url : "./plan/planComment/planNationCommentDelete.jsp",
				data : {num : num},
				async: false,
				success : function(data) {
					alert("삭제되었습니다.");
					location.reload(true);
				},
				error : function(xhr, status, error) {
					alert(status+", "+error);
				}
			});
		}
	}
</script>
	<table>
	<tr>
		<th>글 번호</th><th>제목</th><th>작성한 날짜</th><th>관리</th>
	</tr>
	<%
	
	PlanNationCommentBean pncb = null;
	if(count == 0) {
		%>
		<tr>
			<td colspan="4">작성한 글이 없습니다.</td>
		</tr>
		</table>
		<%
	}else {
		for(int i=0; i<list.size(); i++) {
			pncb = list.get(i);
			%>
			<tr>
				<td><%=pncb.getNum() %></td>
				<td onclick="location.href='./PlanNation.pl?nation=<%=pncb.getNation()%>';"><%=pncb.getContent() %>(<%=pncb.getNation() %>)</td>
				<td><%=pncb.getDate() %></td>
				<td><a href="javascript:deleteCheck_nc(<%=pncb.getNum()%>);">삭제</a></td>
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
				function prev_nc() {
					/* 페이지 처음 실행시 게시글 목록 조회 */
					$.ajax({
						type:"POST",
		       		 url:"./member/getBoardList/nationCommentList.jsp",
		       		 data : {pageNum : <%=currentPage-pageBlock%>},
		       		 success: function(data){
		       			$('.nationComu .table').empty();
		         		$('.nationComu .table').append(data);
		      		  },
		        		error: function(xhr, status, error) {
		           		 alert(error);
		       		 }   
					});
				}
				</script>
				<a href="javascript:prev_nc();">이전</a>
				<%	
			}
			// 페이징 번호
			%>
			<script type="text/javascript">
				function pageChange_nc(i) {
					/* 페이지 처음 실행시 게시글 목록 조회 */
					$.ajax({
						type:"POST",
		       		 url:"./member/getBoardList/nationCommentList.jsp",
		       		 data : {pageNum : i},
		       		 success: function(data){
		       			$('.nationComu .table').empty();
		         		$('.nationComu .table').append(data);
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
				<a href="javascript:pageChange_nc(<%=i%>);" <%if(currentPage==i){ %>style="color: #1a7ad9; border: 1px solid #1a7ad9;"<%} %>><%=i %></a>
				<%
			}
			// 다음 페이지
			if(endPage < pageCount) {
				%>
				<script type="text/javascript">
				function next_nc() {
					/* 페이지 처음 실행시 게시글 목록 조회 */
					$.ajax({
						type:"POST",
		       		 url:"./member/getBoardList/nationCommentList.jsp",
		       		 data : {pageNum : <%=endPage+pageBlock%>},
		       		 success: function(data){
		       			$('.nationComu .table').empty();
		         		$('.nationComu .table').append(data);
		      		  },
		        		error: function(xhr, status, error) {
		           		 alert(error);
		       		 }   
					});
				}
			</script>
				<a href="javascript:next_nc();">다음</a>
				<%
			}
			%>
		</div>
	<%}%>