<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 내가 쓴 답글 관리 페이지 -->
<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- Main -->
<!-- Main -->
<section class="memberManager">
	<div class="memberContainer">	<!-- 서브메뉴 + 내용물 -->

		<!-- 서브메뉴 -->
		<jsp:include page="subMenu/memberManager.jsp"/>
		
		<!-- 컨텐츠 -->
		<div class="memberContent">	<!-- 내용물 -->
			
			<header>
				<h1>내가 작성한 댓글</h1><hr>
			</header>
			
			<div class="myReplyManager">	<!-- 게시판들 -->

			</div> <!-- myReplyManager -->
		
		</div>	<!-- memberContent -->
	
	</div>	<!-- memberContainer -->
</section>	<!-- memberManager -->

<div class="clear"></div>

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />