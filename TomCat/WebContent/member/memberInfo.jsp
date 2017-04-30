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
			<div class="content_member_info">
				<h1>회원정보</h1>
				
				<div class="info_form">
					
					<form action="" method="post" enctype="multipart/form-data">
						<table>	
							<tr><th>아이디</th>
								<td><input type="email" value="" name="id" readonly></td></tr>
							<tr><th>이름</th>
								<td><input type="text" value="" name="name"></td></tr>
							<tr><th>닉네임</th>
								<td><input type="text" value="" name="nick"></td></tr>
							<tr><th>성별</th>
								<td>
									<input type="radio" id="priority-normal man" name="gender" value="남">
									<label for="priority-normal man">남</label>
									<input type="radio" id="priority-normal woman" name="gender" value="여">
									<label for="priority-normal woman">여</label>
								</td></tr>
							<tr><th>전화</th>
								<td><input type="text" value="" name="tel"></td></tr>
							<tr><th>프로필사진</th>
								<td>
									<input type="file" value="" name="profile"><br><br>
									<img src="./images/member/남자 기본 프로필.png" width="70px" height="70px">
								</td></tr>	
						</table>
						<div class="form_btn">
							<input type="submit" value="수정">
							<input type="reset" value="되돌리기">
						</div>
					</form>
					
				</div>	<!-- info_form -->
				
			</div> <!-- content_member_info -->
		</div>	<!-- content -->
	
	</div>
</section>

<div class="clear"></div>

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />