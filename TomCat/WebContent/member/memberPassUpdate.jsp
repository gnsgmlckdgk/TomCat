<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- Main -->
<section id="main" class="wrapper">
	<div class="container">

		<!-- 서브메뉴 -->
		<jsp:include page="subMenu/memberManager.jsp"/>
		
		<!-- 컨텐츠 -->
		<div class="content">
			<div class="content_member_passUpdate">
				<h1>비밀번호 변경</h1>
			</div>
		</div>
	
	</div>
</section>

<div class="clear"></div>

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />