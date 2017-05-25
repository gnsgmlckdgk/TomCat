<%@page import="java.util.Calendar"%>
<%@page import="net.Board1.db.BoardBean"%>
<%@page import="net.member.db.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<section class="wrapper" style="padding:0 ;">


<head>


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

	<a href="./BoardWrite1.bb">
		<h3 class="write">글쓰기</h3>
		
	</a>
	
	

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

			//jsp 날짜 구하기
			Calendar cal = Calendar.getInstance();
			//jsp 날짜 구하기 끝.
		%>


		<div class="w">
			<%
				//  boardList 

				MemberBean mb = new MemberBean();

				for (int i = 0; i < boardList.size(); i++) {
					//자바빈(BoardBean) 변수 =배열한칸 접근   배열변수.get()
					BoardBean bb = (BoardBean) boardList.get(i);
			%>


			<div id="e">

				<!--  제목 -->
				<div id="sub">
					<%=bb.getSubject()%>
				</div>

				<!-- 내용 -->
				<div id="con">
					<%=bb.getContent()%>
				</div>

				<div id="2_inner_left" style="width: 30%;">
					<!-- 프로필 -->
					<div id="file">
						<img src="./upload/images/profileImg/basic/man.png">
						<%-- 					<img src="./upload/images/profileImg/<%=mb.getProfile()%>"> --%>
					</div>

					<!-- 닉네임,날짜 -->
					<div id="nick">
						<%=bb.getNick_name()%>
					</div>

					<!--  날짜 -->
					<div id="date">
						<%
							if (cal.get(Calendar.YEAR) == bb.getDate().getYear() + 1900) {
								if (cal.get(Calendar.MONTH) == bb.getDate().getMonth()) {
									if (cal.get(Calendar.DATE) == bb.getDate().getDate()) {
						%>
										<%=cal.get(Calendar.HOUR) - bb.getDate().getHours()%>시
						<%
									} else {
						%>
										<%=cal.get(Calendar.DATE) - bb.getDate().getDate()%>일전
						<%
									}
								} else {
						%>
									<%=cal.get(Calendar.MONTH) - bb.getDate().getMonth()%>달전
						<%
								}

							} else {
						%>
								<%=bb.getDate().getYear()%>년 <br>
								<%=bb.getDate().getMonth()%>월
								<%=bb.getDate().getDate()%>일
								<%=bb.getDate().getHours()%>시
						<%
							}
						%>
					</div>
				</div>


			</div>


			<%
				}
			%>

		</div>
		
		

	</div>
	
	<div id="chat"></div>
		
		<script type="text/javascript">
		// 채팅을 불러온다.
		$(window).load(function() {
			$.ajax({
				type: 'post',
				url: './chat/broadcast.jsp',
				success: function(data) {
					$('#chat').append(data);
				},
				error: function(xhr, status, error) {
        			alert(error);
    			}   
			});
		});
		</script>
	
</body>

<!-- Footer --> <jsp:include page="../inc/footer.jsp" />