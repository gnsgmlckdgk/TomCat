
<%@page import="net.Board1.db.BoardBean"%>
<%@page import="net.member.db.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<section class="wrapper">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="assets/css/list.css?ver=2" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>
<body class="fadein">

	<!-- 버튼 : 위로 -->
	<button type="button" class="btn_up_layer">
		<img src="./board/pl.png">
	</button>


	<script type="text/javascript">
		/* 위로
		 스크롤이 특정 위치로 이동하면 위로버튼이 나타난다.
		 위로버튼을 클릭하면 상단으로 이동
		 */
		function btn_mv_up(oj) {
			if (!oj)
				return false;
			var o = $(oj);
			var p = $(window).scrollTop();
			if (p > 300) {
				o.fadeIn('slow');
			} // 위로버튼이 나타나는 위치 지정
			else if (p < 300) {
				o.fadeOut('slow');
			} // 위로버튼을 숨기는 위치 지정
		}

		// 위로 버튼
		$(document).scroll(function() {
			btn_mv_up('.btn_up_layer');
		}).on('click', '.btn_up_layer', function() {
			$("html, body").animate({
				scrollTop : 0
			}, 'slow');
		});
	</script>



	<div class="q">
		<%
			// request.setAttribute("boardList", boardList);
			// request.setAttribute("pageNum", pageNum);
			// request.setAttribute("count", count);
			// request.setAttribute("pageCount", pageCount);
			// request.setAttribute("pageBlock", pageBlock);
			// request.setAttribute("startPage", startPage);
			// request.setAttribute("endPage", endPage);
			String id = (String) session.getAttribute("id");
			List boardList = (List) request.getAttribute("boardList");
			String pageNum = (String) request.getAttribute("pageNum");
			int count = ((Integer) request.getAttribute("count")).intValue();
			int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
			int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
			int startPage = ((Integer) request.getAttribute("startPage")).intValue();
			int endPage = ((Integer) request.getAttribute("endPage")).intValue();

			if (id != null) {
		%>

		<h3>
			<a href="./BoardWrite1.bb">글쓰기</a>
		</h3>
		<%
			}
		%>

		<div class="w">
			<%
				//  boardList 

				for (int i = 0; i < boardList.size(); i++) {
					//자바빈(BoardBean) 변수 =배열한칸 접근   배열변수.get()
					BoardBean bb = (BoardBean) boardList.get(i);
					MemberBean mb = new MemberBean();
			%>

			<div id="e">
				<!-- 프로필 -->
				<div id="file">
					<img src="./upload/images/profileimg/<%=mb.getProfile()%>">
				</div>

				<!-- 닉네임,날짜 -->
				<div id="nick">
					<%=bb.getNick_name()%>
					<%=bb.getDate()%>
				</div>

				<!--  제목 -->
				<div id="sub">
					<%=bb.getSubject()%>
				</div>

				<!-- 내용 -->
				<div id="con">
					<%=bb.getContent()%>
				</div>

			</div>
			<%
				}
			%>

		</div>
		<%
			//페이지 출력
			if (count != 0) {

			}

			BoardBean bb = new BoardBean();
		%>
		<script type="text/javascript">
			function prettyDate(time) {

				var date = new Date((time || "").replace(/-/g, "/").replace(
						/[TZ]/g, " ").split(".")[0]),

				diff = (((new Date()).getTime() - date.getTime()) / 1000);

				diff = diff - 33000;

				if (diff < 0)
					diff = 0;

				day_diff = Math.floor(diff / 86400);

				if (isNaN(day_diff) || day_diff < 0)

					return;

				return day_diff == 0
						&& (

						diff < 60 && "방금전" ||

						diff < 120 && "1분전" ||

						diff < 3600 && Math.floor(diff / 60) + " 분전" ||

						diff < 7200 && "1 시간전" ||

						diff < 86400 && Math.floor(diff / 3600) + " 시간전")
						||

						day_diff == 1
						&& "어제"
						||

						day_diff < 7
						&& day_diff
						+ " 일전"
						||

						day_diff < 31
						&& Math.floor(day_diff / 7)
						+ " 주전"
						||

						day_diff < 360
						&& Math.floor(day_diff / 30)
						+ " 개월 전"
						||

						day_diff >= 360
						&& (Math.floor(day_diff / 360) == 0 ? 1 : Math
								.floor(day_diff / 360)) + " 년 전"

			}
		</script>
	</div>
</body>
</html>
<!-- Footer --> <jsp:include page="../inc/footer.jsp" />