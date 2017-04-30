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
				
				<div class="pass_form">
					
					<form action="" method="post">
						<table>	
							<tr>
								<th>현재 비밀번호</th>
								<td><input type="password" name="cur_pass"></td>
							</tr>
							<tr>
								<th>새로운 비밀번호</th>
								<td><input type="password" name="pass"></td>
							</tr>
							<tr>
								<th>새로운 비밀번호</th>
								<td><input type="password" name="pass2"></td>
							</tr>
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