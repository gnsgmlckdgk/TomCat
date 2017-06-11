<%@page import="net.images.db.ImagesBean"%>
<%@page import="net.plan.db.PlanCityBean"%>
<%@page import="net.plan.db.PlanCountryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Before you go</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		<!-- Scripts -->
		<script src="./assets/js/jquery.min.js"></script>
		<script src="./assets/js/skel.min.js"></script>
		<script src="./assets/js/util.js"></script>
		<script src="./assets/js/main.js"></script>

		<!-- 스타일 불러오기 -->
		<link rel="stylesheet" href="./assets/css/main.css?ver=3"/>
		<link rel="stylesheet" href="./assets/css/animate/animate.min.css"/>	<!-- 애니메이트 css -->
		
		<!-- 추가한 css -->
	<style type="text/css">
		
		section {
				text-align: center;
				
				font-weight: bold;
			}
		
			div.city_update {
				width: 80%;
				margin: -60px auto 30px auto;
				
				text-align: center;
			}
			
			div.city_update .btn_div {
				margin-top: 20px;
			}
			
			/* 이미지 BOX */
			div.city_update div.imgBox {	
				width: 800px;
				margin: 0 auto 30px auto;
			}
			div.city_update div.imgBox .beforeBox {
				width: 350px;
				float: left;
				margin-left: 30px;
			}
			div.city_update div.imgBox .previewBox {
				width: 300px;
				float: left;
				margin-left: 30px;
			}
	
	</style>

	</head>

<body>
<div class="clear"></div>
<%
	request.setCharacterEncoding("utf-8");
	
	String city_code=(String)request.getParameter("city_code");
	List countryList =(List)request.getAttribute("countryList");
	PlanCityBean pcb = (PlanCityBean)request.getAttribute("pcb");
	
	String pageNum = (String)request.getAttribute("pageNum");
	
	ImagesBean cityImage = (ImagesBean)request.getAttribute("ib");
%>

<section>

<div class="city_update">
	<form action="./CityUpdateAction.pl" name="city_fr" method="post" enctype="multipart/form-data">
		국가코드
		<%-- <select name="country_code" >
			<optgroup label="현제 국가코드">
				<option value=<%=pcb.getCountry_code() %>><%=pcb.getCountry_code() %></option>
			</optgroup>
			<optgroup label="수정가능한 국가코드">
			<%
				for(int i=0;i<countryList.size();i++){
					PlanCountryBean pcob = (PlanCountryBean)countryList.get(i);
					%>
					<option value="<%=pcob.getCountry_code() %>"><%=pcob.getName() %></option>
					<%
				}
			%>
			</optgroup>
		</select> --%>
		<input type="text" name="country_code" value="<%=pcb.getCountry_code() %>" readonly="readonly">
		
		<!-- 이전 국가코드 : 국가코드 변경시 필요 -->
		<input type="hidden" name="beforeCountryCode" value="<%=pcb.getCountry_code() %>">
		
		<!-- 도시 코드  ==> 도시영어이름과 동일 -->
		<input type="hidden" name="city_code" value="<%=city_code%>">
		
		도시 이름
		<input type="text" name="name" value="<%=pcb.getName()%>">
		
		도시 영어이름
		<input type="text" name="en_name" value="<%=pcb.getEn_name()%>" readonly="readonly">
		<input type="hidden" name="before_en_name" value="<%=pcb.getEn_name() %>">
		
		<br>이미지 변경
		<input type="file" id="cityfile" name="file" value="<%=cityImage.getFile()%>" onchange="loadImageFile();"><br>
		
		<div class="imgBox">
			<div class="beforeBox"><span>현재 이미지</span><img src="./images/plan/nation/<%=cityImage.getFile()%>" width="300" height="200"></div>
			<div class="previewBox"><span>변경할 이미지</span><div id="preview" style="width: 300; height: 200;"></div></div>
			
			<div class="clear"></div>
		</div>
		
		<script type="text/javascript">
		// 이미지 미리보기
		var loadImageFile = (function () {
	        if (window.FileReader) {
	            var oPreviewImg = null, oFReader = new window.FileReader(),
	                rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;

	            oFReader.onload = function (oFREvent) {
	                if (!oPreviewImg) {
	                    var newPreview = document.getElementById("preview");	// 보여줄 화면
	                    oPreviewImg = new Image();
	                    oPreviewImg.style.width = (newPreview.offsetWidth).toString() + "px";
	                    oPreviewImg.style.height = (newPreview.offsetHeight).toString() + "px";
	                    newPreview.appendChild(oPreviewImg);
	                }
	                oPreviewImg.src = oFREvent.target.result;
	            };

	            return function () {
	                var aFiles = document.getElementById("cityfile").files;		// 파일 입력 폼
	                if (aFiles.length === 0) { return; }
	                if (!rFilter.test(aFiles[0].type)) { alert("You must select a valid image file!"); return; }
	                oFReader.readAsDataURL(aFiles[0]);
	            }

	        }
	        if (navigator.appName === "Microsoft Internet Explorer") {
	            return function () {
	                document.getElementById("preview").filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.getElementById("cityfile").value;

	            }
	        }
	    })();
		</script>
		
		정보
		<textarea rows="10" cols="20" name="info" maxlength="160"><%=pcb.getInfo()%></textarea>
	
		<div class="btn_div">
		<input type="submit"  value="수정" >
		<input type="reset"  value="다시쓰기" >
		</div>
		
	</form>
</div>

<!-- 뒤로가기 버튼 -->
<input type="button" class="button special" value="뒤로가기" onclick="history.back()">

</section>

<div class="clear"></div>

</body>
</html>