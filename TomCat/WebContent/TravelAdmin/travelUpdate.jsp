<%@page import="net.plan.db.PlanCityBean"%>
<%@page import="net.plan.db.PlanCountryBean"%>
<%@page import="java.util.List"%>
<%@page import="net.travel.admin.db.TravelBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<!-- Scripts -->
	<script src="./assets/js/jquery.min.js"></script>
	<script src="./assets/js/skel.min.js"></script>
	<script src="./assets/js/util.js"></script>
	<script src="./assets/js/main.js"></script>

	<!-- 스타일 -->
	<link rel="stylesheet" href="./assets/css/main.css?ver=4"/>
		
	<style type="text/css">
		.clear {
			clear: both;
		}
		.tupdateMain {
			font-size: 14px;
		}
		.tupdateContainer {	/* 내용물 전체 */
			width: 1080px;
			margin: -60px auto;
		}
		.tupdateContainer label {
			margin-top: 10px;
			margin-bottom: -7px;
			font-size: 16px;
		}
		.tupdateContainer .btndiv {	/* 버튼들 */
			text-align: center;
		}
		
		/* 이미지 */
		div.imgBox {
			width: 800px;
		}
		div.imgBox div.beforeImg {
			width: 350px;
			float: left;
			margin-left: 30px;
		}
		div.imgBox div.afterImg {
			width: 350px;
			float: left;
			margin-left: 30px;
		}
		div.imgBox span {
			font-weight: bold;
		}
		
	</style>	
		
</head>
<body>
	<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	// 파라미터 값 가져오기
	TravelBean tb = (TravelBean)request.getAttribute("travelBean");
	List<PlanCountryBean> countyList = (List)request.getAttribute("countyList");	// 국가 리스트
	List<PlanCityBean> cityList = (List)request.getAttribute("cityList");	// 국가코드
	String travelImgPath = (String)request.getAttribute("travelImgPath");	// 관광지 이미지 경로
	
	%>
	<section class="tupdateMain">	<!-- 전체 -->
	
	<div class="tupdateContainer">	<!-- 내용물 전체 -->
		
		<form action="./TravelAdminUpdateAction.td" method="post" enctype="multipart/form-data">
		
			<!-- travel_id -->
			<input type="hidden" name="travel_id" value="<%=tb.getTravel_id()%>">
			
			<label>타입</label>
			<select name="type">
				<option value="p" <%if(tb.getType().equals("p")){%>selected<%}%>>명소(place)</option>
				<option value="r" <%if(tb.getType().equals("r")){%>selected<%}%>>맛집(restaurant)</option>
				<option value="h" <%if(tb.getType().equals("h")){%>selected<%}%>>호텔(hotel)</option>
			</select>
			
			<label>국가</label>
			<%-- <select class="nationSel" name="country_code">
				<%
				if(countyList.size()!=0) {
					for(int i=0; i<countyList.size(); i++) {
						PlanCountryBean pcb = countyList.get(i);
						%>	
							<option value="<%=pcb.getCountry_code()%>" <%if(tb.getCountry_code().equals(pcb.getCountry_code())){%>selected<%}%>><%=pcb.getName() %></option>					
						<%
					}
				}
				%>
			</select> --%>
			<input type="text" name="country_code" value="<%=tb.getCountry_code()%>" readonly="readonly">
			
			<label>도시</label>
				<script type="text/javascript">
					$('.nationSel').change(function(){
						var sel = $('.nationSel').val();
						$.ajax({
							 type: 'POST',
				               url: './TravelAdmin/ajax/getCityList.jsp',
				               data: {country_code : sel},
				               success: function(data) {
				                    //$('.citySel').empty();
				                    //$('.citySel').append(data);
				               }
						});
					});
				</script>
			<%-- <select class="citySel" name="city_code">
				<!-- 도시리스트 들어오는곳 -->
				<%
				if(cityList.size()!=0) {
					for(int i=0; i<cityList.size(); i++) {
						PlanCityBean pcb = cityList.get(i);
						%>	
							<option value="<%=pcb.getCity_code()%>" <%if(tb.getCity_code().equals(pcb.getCity_code())){%>selected<%}%>><%=pcb.getName() %></option>					
						<%
					}
				}
				%>
			</select> --%>
			<input type="text" name="<%=tb.getCity_code() %>" value="<%=tb.getName() %>" readonly="readonly">
			
			<label>여행지 이미지</label>
				<script type="text/javascript">
				// fakepath로 이미지 경로가 뜨기 때문에 실제 경로를 알아내기 위한 코드들(이미지파일 제약조건 포함), 이미지 미리보기
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
							var aFiles = document.getElementById("travelImg").files; // 파일 입력 폼
							if (aFiles.length === 0) {
								return;
							}
							if (!rFilter.test(aFiles[0].type)) {
								alert("이미지 파일만 선택해주세요!");
								$('#travelImg').val('');
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
				</script>
				
				<input type="file" name="file" id="travelImg" onchange="loadImageFile();">
				
				<div class="imgBox">
					<div class="beforeImg"><span>현재 이미지</span><img src="./images/plan/nation/<%=travelImgPath%>" width="300" height="200" onerror="this.src='./images/error/noImage.png';"></div>
					<div class="afterImg"><span>변경할 이미지</span><div id="previewImg" style="width: 300px; height: 200px;"><!-- 이미지 변경 시 미리보기 --></div></div>
					<div class="clear"></div>
				</div>
				
				<div class="clear"></div>
			
			<label>명칭</label>
				<input type="text" name="name" value="<%=tb.getName()%>" required>
			
			<label>주소</label>
				<input type="text" name="address" value="<%=tb.getAddress()%>" required>
			
			<label>장소소개</label>
				<textarea rows="5" cols="5" name="info"><%=tb.getInfo() %></textarea>
			
			<label>lat</label>
				<input type="text" name="lat" value="<%=tb.getLatitude()%>" required>
			
			<label>lng</<label>
				<input type="text" name="lng" value="<%=tb.getLongitude()%>" required>
			
			<p>
				lat,lng 값은 <a href="https://www.google.co.kr/maps" target="blank">구글맵</a>에서 특정 장소 검색후 <br>
				marker 가 뜨면 마우스 우클릭하여 "이곳이 궁금한가요?" 클릭하면 lat, lng 정보 확인가능<br>
				화면 좌측에 해당장소의 주소 복사해서 아래 주소칸에 넣으세요
			</p>
			
			<div class="btndiv">
				<input type="submit" value="수정완료">
				<input type="reset" value="다시쓰기"><br><br>
				<input type="button" value="뒤로가기" class="button special" onclick="history.back()">
			</div>
			
		</form>
		
	</div>
	
	</section>

</body>
</html>