<%@page import="net.plan.db.PlanRegionCommentBean"%>
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
	int count = mbdao.getRegionCount(nick);
	int pageSize = 5;
	int startRow = (currentPage - 1) * pageSize + 1;
	
	List<PlanRegionCommentBean> list = null;
	if(count != 0) {
		list = mbdao.getRegionListComment(nick, startRow, pageSize);
	}
	
	%>
	<script type="text/javascript">
	function deleteCheck_rc(num) {
		var check = confirm("글을 삭제하시겠습니까?");
		if(check==true) {
			$.ajax({
				type : "GET",
				url : "./plan/planComment/planRegionCommentDelete.jsp",
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
	
	PlanRegionCommentBean prcb = null;
	if(count == 0) {
		%>
		<tr>
			<td colspan="4">작성한 글이 없습니다.</td>
		</tr>
		</table>
		<%
	}else {
		for(int i=0; i<list.size(); i++) {
			prcb = list.get(i);
			%>
			<tr>
				<td><%=prcb.getNum() %></td>
				<td onclick="location.href='./PlanRegion.pl?region=<%=prcb.getRegion()%>';"><%=prcb.getContent() %>(<%=prcb.getRegion() %>)</td>
				<td><%=prcb.getDate() %></td>
				<td><a href="javascript:deleteCheck_rc(<%=prcb.getNum()%>);">삭제</a></td>
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
				function prev_rc() {
					/* 페이지 처음 실행시 게시글 목록 조회 */
					$.ajax({
						type:"POST",
		       		 url:"./member/getBoardList/regionCommentList.jsp",
		       		 data : {pageNum : <%=currentPage-pageBlock%>},
		       		 success: function(data){
		       			$('.regionComu .table').empty();
		         		$('.regionComu .table').append(data);
		      		  },
		        		error: function(xhr, status, error) {
		           		 alert(error);
		       		 }   
					});
				}
				</script>
				<a href="javascript:prev_rc();">이전</a>
				<%	
			}
			// 페이징 번호
			%>
			<script type="text/javascript">
			function pageChange_rc(i) {
				$.ajax({
				type:"POST",
	       		 url:"./member/getBoardList/regionCommentList.jsp",
	       		 data : {pageNum : i},
	       		 success: function(data){
	       			$('.regionComu .table').empty();
	         		$('.regionComu .table').append(data);
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
				<a href="javascript:pageChange_rc(<%=i%>);" <%if(currentPage==i){ %>style="color: #1a7ad9; border: 1px solid #1a7ad9;"<%} %>><%=i %></a>
				<%
			}
			// 다음 페이지
			if(endPage < pageCount) {
				%>
				<script type="text/javascript">
				function next_rc() {
					$.ajax({
						type:"POST",
	       				 url:"./member/getBoardList/regionCommentList.jsp",
	       				 data : {pageNum : <%=endPage+pageBlock%>},
	       				 success: function(data){
	       					$('.regionComu .table').empty();
	         				$('.regionComu .table').append(data);
	      		 		 },
	        				error: function(xhr, status, error) {
	           				 alert(error);
	       		 		}   
						});	
					}
				</script>
				<a href="javascript:next_rc();">다음</a>
				<%
			}
			%>
		</div>
	<%}%>