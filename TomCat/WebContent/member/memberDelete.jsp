<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 회원탈퇴 페이지 -->
<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- Main -->
<section id="main" class="wrapper">
	<div class="container">

		<!-- 서브메뉴 -->
		<jsp:include page="subMenu/memberManager.jsp"/>
		
		<!-- 컨텐츠 -->
		<div class="content">
			<div class="content_member_memberDelete">
				<h1>회원 탈퇴</h1>
				
				<form action="./MemberDeleteAction.me" method="post" >
					<label for="pass">비밀번호</label><input type="password" name="pass" id="pass" maxlength="16" placeholder="6~16자 영문 대 소문자로 시작하고, 숫자, 특수문자를 사용">
				
				<!-- RSA암호화 공개키 -->
				<input type="hidden" id="delete_publicKeyModulus" value="<%=request.getAttribute("updatePass_publicKeyModulus") %>">
				<input type="hidden" id="delete_publicKeyExponent" value="<%=request.getAttribute("updatePass_publicKeyExponent") %>">
				
					<input type="submit" value="회원탈퇴">
				
				</form>
				
			</div> <!-- content_member_info -->
		</div>	<!-- content -->
	
	</div>
</section>

<div class="clear"></div>

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />