<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

		<!-- Header -->
		<jsp:include page="../inc/header.jsp" />

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="container">
				
					<!-- 회원가입 -->
					<div class="join_div">
						<h2>회원가입</h2>
							<h4 style="color: #ccc;">★ 모든 입력란에 입력해주세요.</h4>
						<form action="./MemberJoinAction.me" method="post" name="fr" onsubmit="return validateEncryptedForm()" >
							
							<label for="id">아이디</label> 
								<input type="email" name="id" id="id" placeholder="이메일을 입력해주세요." >
							<input type="button" value="인증번호 전송" class="button alt small email_btn" >	<!-- 이메일 인증하기 -->
							<input type="text" name="email_check" class="email_check_input" placeholder="인증번호를 입력" >	
								
							<div class="clear"></div>
								
							<label for="pass">비밀번호</label> 
								<input type="password" name="pass" id="pass" placeholder="6~16자 영문 대 소문자로 시작하고, 숫자, 특수문자를 사용" >
							<label for="">비밀번호 확인</label> 
								<input type="password" name="pass2" id="pass2" >
							<label for="name">이름</label> 
								<input type="text" name="name" id="name" maxlength="16" >
							<label for="nick">닉네임</label> 
								<input type="text" name="nick" id="nick" placeholder="2~9자 영문 대 소문자, 한글로 시작하고 숫자 사용" >
								<input type="button" name="nick_check" value="닉네임 중복확인" class="button alt small" >
							
							<label for="gender">성별</label> 
							<div class="radio_box">
								<input type="radio" id="priority-normal man" name="pregender" value="남"  checked="checked">
									<label for="priority-normal man">남</label>
								<input type="radio" id="priority-normal woman" name="pregender" value="여" >
									<label for="priority-normal woman">여</label><br>
								<input type="hidden" name="gender" id="gender" value="" >	<!-- 암호화 후 넘길때 여기로 덮어쓰고 넘김 -->
							</div>
								
							<div class="clear"></div>
							
							<label for="tel" >연락처</label> 
								<input type="text" name="tel" id="tel" placeholder=" ' - '문자 생략, 예)01000000000" >
							
							<!-- 공개키 -->
							<input type="hidden" id="rsaPublicKeyModulus" value="<%=request.getAttribute("publicKeyModulus") %>">
							<input type="hidden" id="rsaPublicKeyExponent" value="<%=request.getAttribute("publicKeyExponent") %>">
							
							<!-- 버튼 -->
							<div class="join_btn">	
								<input type="submit" class="button special" value="가입" >
								<input type="reset" class="button" value="다시쓰기" >
							</div>
							
						</form> 
					
					</div>	<!-- join_div -->
					
				</div>	<!-- container -->
		</section>
		
		<!-- Footer -->
		<jsp:include page="../inc/footer.jsp" />
		
		