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
								
				<div class="info_form">
					
					<form action="./MemberUpdate.me" method="post" enctype="multipart/form-data" onsubmit="return updateCheck();">
						<table>	
							<tr><th>아이디</th>
								<td><input type="text" value="<%=mb.getId() %>" name="id" id="id" readonly></td></tr>
							<tr><th>이름</th>
								<td><input type="text" value="<%=mb.getName() %>" name="name" id="name" maxlength="30"></td></tr>
							<tr><th>닉네임</th>
								<td><input type="text" value="<%=mb.getNick() %>" name="nick" id="nick" maxlength="16"></td></tr>
							<tr><th>성별</th>
								<td>
									<input type="radio" id="priority-normal man" name="gender" value="남" <%if(mb.getGender().equals("남")){ %>checked<%} %>>
									<label for="priority-normal man">남</label>
									<input type="radio" id="priority-normal woman" name="gender" value="여" <%if(mb.getGender().equals("여")){ %>checked<%} %>>
									<label for="priority-normal woman">여</label>
								</td></tr>
							<tr><th>전화</th>
								<td><input type="text" value="<%=mb.getTel() %>" name="tel" id="tel" maxlength="20"></td></tr>
							<tr><th>프로필사진</th>
								<td>
									<input type="file" value="<%=mb.getProfile() %>" name="profile" id="profile" onchange="loadImageFile()">
									<p>추천 사이즈: 100 x 120</p>
									<img src="<%if(mb.getProfile()==null){ 
										if(mb.getGender().equals("남")) {
											%>
											./images/member/남자 기본 프로필.png
											<%
										}else {
											%>./images/member/여자 기본 프로필.png<%} 
										}else {%> ./upload/images/profileImg/<%=mb.getProfile() %> <%} %>" width="100px" height="120px" id="profileImg">
										
										
										<img src="./images/member/오른쪽 화살표.png" id="right_arrow" >
										<div id="previewImg"></div>
										
								</td></tr>	
						</table>
						<div class="form_btn">
							<input type="submit" value="수정">
							<input type="reset" value="되돌리기" id="reset">
						</div>
					</form>
					
					<script type="text/javascript">
					/* memberInfo.jsp */

					// fakepath로 이미지 경로가 뜨기 때문에 실제 경로를 알아내기 위한 코드들(이미지파일 제약조건 포함)
					var loadImageFile = (function() {

						if (window.FileReader) {
							var oPreviewImg = null, oFReader = new window.FileReader(), rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;

							oFReader.onload = function(oFREvent) {
								if (!oPreviewImg) {
									var newPreview = document.getElementById("previewImg"); // 보여줄
																							// 화면
									oPreviewImg = new Image();
									oPreviewImg.style.width = (newPreview.offsetWidth).toString()
											+ "px";
									oPreviewImg.style.height = (newPreview.offsetHeight).toString()
											+ "px";
									newPreview.appendChild(oPreviewImg);
								}
								oPreviewImg.src = oFREvent.target.result;
							};

							return function() {
								var aFiles = document.getElementById("profile").files; // 파일 입력 폼
								if (aFiles.length === 0) {
									return;
								}
								if (!rFilter.test(aFiles[0].type)) {
									alert("이미지 파일만 선택해주세요!");
									$('#profile').val('');
									return;
								}
								oFReader.readAsDataURL(aFiles[0]);
							}

						}
						if (navigator.appName === "Microsoft Internet Explorer") {
							return function() {
								document.getElementById("previewImg").filters
										.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document
										.getElementById("profile").value;
							}
						}
					})();

					// 리셋 버튼 누르면 프로필사진 미리보기가 사라짐
					$('#reset').click(function() {
						$('#right_arrow, #previewImg').css('display', 'none');
						$('#name, #nick, #tel, #profile').css('color', '#333');
					});
					// 프로필 사진 바뀌면 미리보기 보여짐
					$('#profile').change(function() {
						$('#right_arrow, #previewImg').css('display', 'inline');
					});

					// 바뀐정보는 글자 색을 바꿈
					$('#name').on('change', function() {
						$(this).css('color', '#6B66FF');
					});
					$('#nick').on('change', function() {
						$(this).css('color', '#6B66FF');
					});
					$('#tel').on('change', function() {
						$(this).css('color', '#6B66FF');
					});
					$('#profile').on('change', function() {
						$(this).css('color', '#6B66FF');
					});

					// 수정완료 전 체크
					function updateCheck() {
						// 아이디, 이름, 닉네임, 성별, 전화, 프로필사진
						var id = document.getElementById("id").value;
						var name = document.getElementById("name").value;
						var nick = document.getElementById("nick").value;
						var gender = document.getElementsByName("gender");
						for (var i = 0; i < gender.length; i++) {
							if (gender[i].checked == true) {
								gender = gender[i].value
							}
						}
						var tel = document.getElementById("tel").value;

						// 폼에 입력했는지...
						if (name.length == 0) {
							alert("이름을 입력해주세요.");
							$('#name').focus();
							return false;
						} else if (nick.length == 0) {
							alert("닉네임을 입력해주세요.");
							$('#nick').focus();
							return false;
						} else if (tel.length == 0) {
							alert("전화번호를 입력해주세요.");
							$('#tel').focus();
							return false;
						}

						// 정규표현식
						var regNick = /^[a-z|가-힣][a-z|0-9|가-힣]{1,8}/i; // 영문, 한글 시작 영문,숫자,한글 조합 가능
																		// 2~9자
						var regTel = /^[0-9]{7,20}/; // 숫자만 가능 7~20자

						if (!regNick.test(nick)) {
							alert("닉네임을 형식에 맞게 입력해주세요.");
							return false;

						} else if (!regTel.test(tel)) {
							alert("연락처를 형식에 맞게 입력해주세요.");
							return false;
						}

						// 닉네임 중복확인
						var check = 0;
						$.ajax({ // ajax는 비동기방식, ajax의 실행여부와는 상관없이 밑의 코드가 계속 실행됨
							type : 'POST',
							data : {
								'id' : id,
								'nick' : nick	
							},
							dataType : 'text',
							url : './member/joinCheck/nickOverlapCheck2.jsp',
							async : false, // 동기방식으로
							success : function(data) {
								check = data;
							}
						});

						if (check == 0) {
							alert("이미 사용중인 닉네임 입니다.");
							return false;
						} else {
							return true;
						}
					}

					</script>
					
				</div>	<!-- info_form -->
				
			</div> <!-- content_member_info -->
		</div>	<!-- content -->
	
	</div>
</section>

<div class="clear"></div>

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />