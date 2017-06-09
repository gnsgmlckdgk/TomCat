<%@page import="java.util.List"%>
<%@page import="net.Board1.db.BoardBean"%>
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
	int count = mbdao.getTogetherCount(nick);
	int pageSize = 5;
	int startRow = (currentPage - 1) * pageSize + 1;
	
	List<BoardBean> list = null;
	if(count != 0) {
		list = mbdao.getTogetherBoardList(startRow, pageSize, nick);
	}
	
	%>
	<script type="text/javascript">
	function deleteCheck_tog(num) {
		var check = confirm("글을 삭제하시겠습니까?");
			if(check==true) {
				$.ajax({
					type : "GET",
					url : "./BoardDelete1.bb?num="+num,
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
	
	BoardBean bb = null;
	if(count == 0) {
		%>
		<tr>
			<td colspan="4">작성한 글이 없습니다.</td>
		</tr>
		</table>
		<%
	}else {
		for(int i=0; i<list.size(); i++) {
			bb = list.get(i);
			%>
			<tr>
				<td><%=bb.getNum() %></td>
				<td onclick="location.href='./BoardList1.bb?plan_nr=100';"><%=bb.getSubject() %></td>
				<td><%=bb.getDate() %></td>
				<td><a href="javascript:deleteCheck_tog(<%=bb.getNum()%>);">삭제</a></td>
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
				function prev_tog() {
					$.ajax({
						 type:"POST",
		       			 url:"./member/getBoardList/togetherBoardList.jsp",
		       			 data : {<%=currentPage-pageBlock%>},
		       		 	success: function(data){
		       		 		$('.togetherBoard .table').empty();
		         			$('.togetherBoard .table').append(data);
		      		  },
		        		error: function(xhr, status, error) {
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
					$.ajax({
						 type:"POST",
		       			 url:"./member/getBoardList/togetherBoardList.jsp",
		       			 data : {pageNume : i},
		       		 	success: function(data){
		       		 		$('.togetherBoard .table').empty();
	         				$('.togetherBoard .table').append(data);
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
				<a href="javascript:pageChange_tog(<%=i %>);" <%if(currentPage==i){ %>style="color: #1a7ad9; border: 1px solid #1a7ad9;"<%} %>><%=i %></a>
				<%
			}
			// 다음 페이지
			if(endPage < pageCount) {
				%>
				<script type="text/javascript">
				function next_tog() {
					$.ajax({
						 type:"POST",
		       			 url:"./member/getBoardList/togetherBoardList.jsp",
		       			 data : {<%=endPage+pageBlock%>},
		       		 	success: function(data){
		       		 		$('.togetherBoard .table').empty();
	         				$('.togetherBoard .table').append(data);
		      		  },
		        		error: function(xhr, status, error) {
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
	<%}%>