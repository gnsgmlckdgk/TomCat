<%@page import="net.reply.db.ReplyBean"%>
<%@page import="net.board.db.boardBean"%>
<%@page import="java.util.List"%>
<%@page import="net.member.db.MemberBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션값 가져오기
	String nick = (String) session.getAttribute("nick");

	// 인생샷그램 게시글 리스트 가져오기
	MemberBoardDAO mbdao = new MemberBoardDAO();

	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) { // 처음 시작시 무조건 1페이지
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int count = mbdao.getGramReplyCount(nick);
	int pageSize = 5;
	int startRow = (currentPage - 1) * pageSize + 1;

	List<ReplyBean> list = null;
	if (count != 0) {
		list = mbdao.getGramReplyList(startRow, pageSize, nick);
	}
%>
<script type="text/javascript">
	function deleteCheck_gramReply(num, re_num) {
		var check = confirm("글을 삭제하시겠습니까?");
		if(check==true) {
			$.ajax({
				type : "GET",
				url : "./ReplyDelete.re?num="+num+"&pageNum=1&re_num="+re_num,
				data : {re_num : re_num},
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
		<th>글 번호</th>
		<th>내용</th>
		<th>작성한 날짜</th>
		<th>관리</th>
	</tr>
	<%
		ReplyBean rb = null;
		if (count == 0) {
	%>
	<tr>
		<td colspan="4">작성한 글이 없습니다.</td>
	</tr>
</table>
<%
	} else {
		for (int i = 0; i < list.size(); i++) {
			rb = list.get(i);
%>
<tr>
	<td><%=rb.getNum()%></td>
	<td
		onclick="location='./BoardContent.bo?num=<%=rb.getNum()%>&pageNum=1';"><%=rb.getContent()%></td>
	<td><%=rb.getDate()%></td>
	<td><a href="javascript:deleteCheck_gramReply(<%=rb.getNum() %>, <%=rb.getRe_num()%>);">삭제</a></td>
</tr>
<%
	}
%>
</table>

<div class="page">
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
		function prev_gramReply() {
			/* 페이지 처음 실행시 게시글 목록 조회 */
			$.ajax({
				type : "POST",
				url : "./member/getBoardList/gramBoardReplyList.jsp",
				data : {
					pageNum :
					<%=currentPage - pageBlock%>
					},
				success : function(data) {
					$('.gramBoard .table2').empty();
					$('.gramBoard .table2').append(data);
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			});
		}
	</script>
	<a href="javascript:prev_gramReply();">이전</a>
	<%
		}
			// 페이징 번호
	%>
	<script type="text/javascript">
		function pageChange_gramReply(i) {
			/* 페이지 처음 실행시 게시글 목록 조회 */
			$.ajax({
				type : "POST",
				url : "./member/getBoardList/gramBoardReplyList.jsp",
				data : {
					pageNum : i
				},
				success : function(data) {
					$('.gramBoard .table2').empty();
					$('.gramBoard .table2').append(data);
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
	<a href="javascript:pageChange_gramReply(<%=i%>);" <%if (currentPage == i) {%>
		style="color: #1a7ad9; border: 1px solid #1a7ad9;" <%}%>><%=i%></a>
	<%
		}
			// 다음 페이지
			if (endPage < pageCount) {
	%>
	<script type="text/javascript">
		function next_gramReply(i) {
			/* 페이지 처음 실행시 게시글 목록 조회 */
			$.ajax({
				type : "POST",
				url : "./member/getBoardList/gramBoardReplyList.jsp",
				data : {
					pageNum :
					<%=endPage + pageBlock%>
					},
				success : function(data) {
					$('.gramBoard .table2').empty();
					$('.gramBoard .table2').append(data);
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			});
		}
	</script>
	<a href="javascript:next_gramReply;">다음</a>
	<%
		}
	%>
</div>
<%
	}
%>