
<%@page import="net.board.db.boardBean"%>
<%@page import="net.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- 추가한 스크립트 -->
<script type="text/javascript" src="./assets/js/member/join.js"></script>
<!-- 회원가입 제약조건 및 암호화 -->
<link rel="stylesheet"
	href="./assets/css/instagram/updateForm.css?ver=2" />

<section class="updateFormSection">
	<%
		//int num,String pageNum 파라미터 가져오기
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		//BoardDAO bdao 객체 생성
		BoardDAO bdao = new BoardDAO();
		//BoardBean bb=메서드호출 getBoard(num)
		boardBean bb = bdao.getBoard(num);
	%>
	<div class="combine">
		<!-- 내용물 -->
		<form
			action="./BoardUpdateAction.bo?num=<%=num%>&pageNum=<%=pageNum%>"
			method="post" name="fr" enctype="multipart/form-data">

			<input type="hidden" name="num" value="<%=num%>"> 
			글쓴이<input type="text" name="nick" value="<%=bb.getNick()%>"><br>
			<span>제목</span><input type="text" name="subject" value="<%=bb.getSubject()%>"><br>

			<span>내용</span>
			<textarea rows="5" cols="8" name="content"><%=bb.getContent()%></textarea>
			<br>


			<div class="imgManager">
				<div class="left">
					<span>현재 이미지</span><br> <img src="./upload/images/gram/<%=bb.getImage1()%>" width=250
						height=250><br>
					<!-- 현재 이미지 -->
					<input type="file" id="imgFile" name="image1" onchange="loadImageFile();">
					<!--이미지 변경 안했을때 쓰기위해 현재 이미지 저장 -->
					<input type="hidden" name="prevImg" value="<%=bb.getImage1()%>">
					
				</div>

				<div class="right">
					<span>변경된 이미지</span>
					<div id="previewImg">
						<!-- 변경된 이미지 오는 자리 -->
					</div>
					
		<script type="text/javascript">
					/* 이미지 미리보기 */
		var loadImageFile = (function() {
		if (window.FileReader) {
		var oPreviewImg = null, oFReader = new window.FileReader(), rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;

		oFReader.onload = function(oFREvent) {
			if (!oPreviewImg) {
				var newPreview = document.getElementById("previewImg"); // 보여줄 화면
																		
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
			var aFiles = document.getElementById("imgFile").files; // 파일 입력 폼
			if (aFiles.length === 0) {
				return;
			}
			if (!rFilter.test(aFiles[0].type)) {
				alert("이미지 파일만 선택해주세요!");
				$('#imgFile').val('');
										return;
				}
				oFReader.readAsDataURL(aFiles[0]);
				}

				}
			if (navigator.appName === "Microsoft Internet Explorer") {
			
				return function() {
					document.getElementById("previewImg").filters
					.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document
					.getElementById("imgFile").value;
					}
				}
			})();
		</script>
					
				</div>

				<div class="clear"></div>

			</div>
			
			<div class="btnDiv">
				<input type="submit" value="글수정" style="margin-right: 30px;">
				<input type="reset" value="되돌리기"><br>
				<input type="button" value="뒤로가기" onclick="history.back();" class="button special">
			</div>
		
		</form>
	</div>
</section>
</body>
<jsp:include page="../inc/footer.jsp" />
