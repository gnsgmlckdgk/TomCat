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
		
</head>
<body>
	<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	// 파라미터 값 가져오기
	TravelBean tb = (TravelBean)request.getAttribute("travelBean");
	List<PlanCountryBean> countyList = (List)request.getAttribute("countyList");	// 국가 리스트
	
	%>
	<section class="tupdateMain">	<!-- 전체 -->
	
	<div class="tupdateContainer">	<!-- 내용물 전체 -->
		
		<form action="" method="post" enctype="multipart/form-data">
			
			<label>타입</label>
			<select>
				<option value="p" <%if(tb.getType().equals("p")){%>selected<%}%>>명소(place)</option>
				<option value="r" <%if(tb.getType().equals("r")){%>selected<%}%>>맛집(restaurant)</option>
				<option value="h" <%if(tb.getType().equals("h")){%>selected<%}%>>호텔(hotel)</option>
			</select>
			
			<label>국가</label>
			<select class="nationSel">
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
			</select>
			
			<label>도시</label>
			<script type="text/javascript">
				
				$('.nationSel').change(function(){
					var sel = $(this).val();
					
					$.ajax({
						type:"POST",
				        url:"./TravelAdmin/ajax/getCityList.jsp",
				        data : {country_code : sel},
				        dataType : "html",
				        success: function(data){
				            $('.citySel').empty();
				            $('.citySel').append(data);
				        },
				        error: function(xhr, status, error) {
				            alert(error);
				        }
					});
				});
				
				
				$(document)ready(function(){
					var sel = <%=tb.getCountry_code()%>;
					$.ajax({
						type:"POST",
					       url:"./TravelAdmin/ajax/getCityList.jsp",
					       data : {country_code : sel},
					       dataType : "html",
					       success: function(data){
					           $('.citySel').empty();
					           $('.citySel').append(data);
					       },
					       error: function(xhr, status, error) {
					           alert(error);
					       }
					});
				});

			</script>
			<select class="citySel">
				<!-- 도시리스트 들어오는곳 -->
			</select>
			
			<label>여행지 이미지</label>
		
			<label>명칭</label>
			
			<label>주소</label>
		
			<label>장소소개</label>
		
			<label>lat</label>
			
			<label>lng</<label>
		
			<p>
				lat,lng 값은 <a href="https://www.google.co.kr/maps" target="blank">구글맵</a>에서 특정 장소 검색후 <br>
				marker 가 뜨면 마우스 우클릭하여 "이곳이 궁금한가요?" 클릭하면 lat, lng 정보 확인가능<br>
				화면 좌측에 해당장소의 주소 복사해서 아래 주소칸에 넣으세요
			</p>
			
		</form>
	
	</div>
	
	</section>

</body>
</html>