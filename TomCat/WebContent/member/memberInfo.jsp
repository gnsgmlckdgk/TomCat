<%@page import="net.member.db.MemberBean"%>
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
				
				<%
				// 세션값 없으면 Main으로
				String id = (String)session.getAttribute("id");
				if(id==null) {
					response.sendRedirect("Main.me");
				}
				
				// 회원정보 가져오기
				MemberBean mb = (MemberBean)request.getAttribute("mb");
				
				%>
				<script type="text/javascript">
				
				// 되는지 아직 확인 못함...
				$(document).ready(function() {
					// 프로필 사진 바꾸면 미리볼수 있게 사진 뜨게하기
					$('#profile').on('onchange', function(){
						var imgPath = $('#profile').val();
						$('#profileImg').val(imgPath);
					});
					
				});
				
				</script>
				
				<div class="info_form">
					
					<form action="" method="post" enctype="multipart/form-data">
						<table>	
							<tr><th>아이디</th>
								<td><input type="text" value="<%=mb.getId() %>" name="id" readonly></td></tr>
							<tr><th>이름</th>
								<td><input type="text" value="<%=mb.getName() %>" name="name"></td></tr>
							<tr><th>닉네임</th>
								<td><input type="text" value="<%=mb.getNick() %>" name="nick"></td></tr>
							<tr><th>성별</th>
								<td>
									<input type="radio" id="priority-normal man" name="gender" value="남" <%if(mb.getGender().equals("남")){ %>checked<%} %>>
									<label for="priority-normal man">남</label>
									<input type="radio" id="priority-normal woman" name="gender" value="여" <%if(mb.getGender().equals("여")){ %>checked<%} %>>
									<label for="priority-normal woman">여</label>
								</td></tr>
							<tr><th>전화</th>
								<td><input type="text" value="<%=mb.getTel() %>" name="tel"></td></tr>
							<tr><th>프로필사진</th>
								<td>
									<input type="file" value="<%=mb.getProfile() %>" name="profile" id="profile" ><br><br>
									<img src="<%if(mb.getProfile()==null){ 
										if(mb.getGender()=="남") {
											%>
											./images/member/남자 기본 프로필.png
											<%
										}else {
											%>./images/member/여자 기본 프로필.png<%} 
										}else {%> <%=mb.getProfile() %> <%} %>" width="70px" height="70px" id="profileImg">
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