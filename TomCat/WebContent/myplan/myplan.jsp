
<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@page import="net.travel.admin.db.TravelBean"%>
<%@page import="net.myplanBasket.db.MyPlanBasketBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<!-- 스타일 불러오기 -->
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/map/myplanNew.css" />
<link rel="stylesheet" href="assets/css/myplan/pay_button.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
 $(function(){
	$(".btn").click(function(){
		var effect = 'slide';
		var options ='left';
		var duration = 500;
		$('#pln_list').toggle(effect, options, duration);
	}); 
});  
//일정수정 버튼 클릭시 오른쪽으로 슬라이드  
 $(function(){
	 //datepicker 한국어로 사용하기 위한 언어설정
   	$.datepicker.setDefaults($.datepicker.regional['ko']); 
    // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
    // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

	//시작일
	$('#fromDate').datepicker({
		showOn: "focus",
		dateFormat:"yy-mm-dd",
		changeMonth:true,
		onClose: function(selectedDate){
            // 시작일(fromDate) datepicker가 닫힐때
            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#toDate").datepicker( "option", "minDate", selectedDate );
		}
	});

    
    //종료일
    $('#toDate').datepicker({
   	 	 showOn: "focus", 
         dateFormat: "yy-mm-dd",
         changeMonth: true,
         onClose: function( selectedDate ) {
             // 종료일(toDate) datepicker가 닫힐때
             // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
             $("#fromDate").datepicker( "option", "maxDate", selectedDate );
         } 
   	});
	/* $( '.datepicker').datepicker({
		altField: ".selecter"
	}); */
});  
//날짜 선택하기 
</script>
</head>
<body>
	<%
		String gold = (String) request.getAttribute("gold");
		String id = (String) session.getAttribute("id");

		List basketList = (List) request.getAttribute("basketList");
		List goodsList = (List) request.getAttribute("goodsList");
		int plan_nr = Integer.parseInt(request.getParameter("plan_nr"));
		
		String dep_lat =  (String) request.getParameter("dlat");
		String dep_lng =  (String) request.getParameter("dlng");
		String arr_lat =  (String) request.getParameter("alat");
		String arr_lng =  (String) request.getParameter("alng");
		
/* 		int init_nr=0; */
 		int plan_item_nr=0; 
	%>
	<%-- 	<h1>
		여행장바구니<%=basketList.size()%><%=goodsList.size()%></h1> --%>


	<div class="container" >
		<div class="myplan-list" >
				<h3>
				<a href='./MyPlan.pln?plan_nr=100'><img src="./images/myplans/all.png" width="35px" height="35px" style="vertical-align:bottom"></a>
				<a href='./MyPlan.pln?plan_nr=1'><img src="./images/myplans/1.png" width="35px" height="35px" style="vertical-align:bottom"></a>
				<a href='./MyPlan.pln?plan_nr=2'><img src="./images/myplans/2.png" width="35px" height="35px" style="vertical-align:bottom"></a>
				<a href='./MyPlan.pln?plan_nr=3'><img src="./images/myplans/3.png" width="35px" height="35px" style="vertical-align:bottom"></a>
				<!-- onclick = "location.href ='./MyPlan.pln?plan_nr=100'" modify해결하고 jqeury로 펼치기 설정 -->
								
				<button class="btn" >일정만들기</button>
				</h3>
				<table border="1" >
					<tr>
						<td>plan</td>
						<td>item</td>
						<td width="400px">name</td>
						<%
						if(plan_nr!=100){
							%>	
						<td width="100px">경로</td>
						<%
						}
						%>
					</tr>
					<%
 					for (int i = 0; i < basketList.size(); i++) {
						MyPlanBasketBean mpbb = (MyPlanBasketBean) basketList.get(i);
						if (plan_nr != mpbb.getPlan_nr() & plan_nr != 100)
							continue;
						plan_item_nr=plan_item_nr+1;
						
					} 
					
					
					int button_nr=0;
					float[][] route=new float[plan_item_nr][2]; 
					
					for (int i = 0; i < basketList.size(); i++) {
							MyPlanBasketBean mpbb = (MyPlanBasketBean) basketList.get(i);
							TravelBean tb = (TravelBean) goodsList.get(i);
					
							if (plan_nr != mpbb.getPlan_nr() & plan_nr != 100)
								continue;
					%>
					<tr>
						<td><%=mpbb.getPlan_nr()%></td>
						<td><%=mpbb.getItem_nr()%></td>
						<td><%=tb.getName()%></td>
						<%
						if(plan_nr!=100){
							%>
						<td>
							<%
							route[button_nr][0] = tb.getLatitude();
							route[button_nr][1] = tb.getLongitude();  
							if(button_nr!=0){
							%>	
							<a href='./MyPlan.pln?plan_nr=<%=plan_nr%>&dlat=<%=route[button_nr-1][0]%>&dlng=<%=route[button_nr-1][1]%>&alat=<%=route[button_nr][0]%>&alng=<%=route[button_nr][1]%>'>
	  						<img src="./images/myplans/bus_trans.png" width="30px" height="30px" style="vertical-align:bottom"> </a> 
  							<%
  							}
							button_nr=button_nr+1;			
	  						%>
						</td>
						<%
						}
						%>
					</tr>	
						<%
						}
						%>
				</table>

			
			<%
				if (basketList.size() == 0) {
					%>				
			아직 일정을 추가하지 않으셨군요! <br> 여행지를 검색해서 찜해보세요. <br> <br>
			여행지가 추가되면서,<br> 일정별로 방문순서를 계획할 수 있어요<br> <br> 또한 여행경로도
			확인 가능하다는 사실!<br> 그 놀라운 서비스를 확인하러 Go~ Go~<br>
			<%
				}
			%>
		</div>
		<div id="map" class="f1" ></div><!-- map -->		
		<div id="pln_list"><!-- 일정수정 버튼 시 오른쪽 슬라이드 시작 -->
			<form id="pln_form" action="./MyPlanModify.pln" method="post" name="fr">
				<input type="text" name="fromDate" id="fromDate" value="시작일"
					style="	background-image: url('myplan/pn_cal_btn.png');
							background-repeat: no-repeat;
							background-position: 110px 13px;"> 
				<input type="text" name="toDate" id="toDate" value="종료일"
					style="	background-image: url('myplan/pn_cal_btn.png');
							background-repeat: no-repeat;
							background-position: 110px 13px;">
				<select name="plan_nr">
					<option value="choice">여행 타이틀을 선택하세요</option>
					<option value="1" >일정A</option>
					<option value="2">일정B</option>
					<%if(gold.equals("유료회원")){ %>
						<option value="일정C">일정C</option>
					<%}%>
				</select>
				
					<%if(gold.equals("무료회원")){ %>
						<input type="submit" value="상세일정만들기" class="pln_sub_free">
						<input type="button" class="pln_sub_btn_free" onclick="location.href='./PayAction.pln?approval=0&id=<%=id %>'" value="일정C 사용하기">
					<%} else {%>
						<input type="submit" value="상세일정만들기" class="pln_sub">	
					<%} %>
				
			</form>  		
		</div><!-- 일정수정 버튼 시 오른쪽 슬라이드 시작-->

   <div id="right-panel">    </div>

	</div><!-- container 끝 -->



	<script>
      var map;

      // Create a new blank array for all the listing markers.
      var markers = [];
      var tr_location =[];  
      var tr_title =[];  
      
      
      function initMap() {
        // Create a styles array to use with the map.
       
        // Constructor creates a new map - only center and zoom are required.
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 35.159658, lng: 129.043302},
          	zoom: 13,
         	mapTypeControl: false
        });

       var largeInfowindow = new google.maps.InfoWindow();
       var highlightedIcon = makeMarkerIcon('FFFF24');
					       
      					       
          <%String MarkerColor;
			String TitlePlan;
			if (basketList.size() != 0) {

				for (int i = 0; i < basketList.size(); i++) {
					MyPlanBasketBean mpbb = (MyPlanBasketBean) basketList.get(i);
					TravelBean tb = (TravelBean) goodsList.get(i);
					if (plan_nr != mpbb.getPlan_nr() & plan_nr != 100)
						continue;

					switch (mpbb.getPlan_nr()) {
						case 1 :
							MarkerColor = "6799FF"; //light blue
							TitlePlan = "A";
							break;
						case 2 :
							MarkerColor = "F361DC"; //pink
							TitlePlan = "B";
							break;
						case 3 :
							MarkerColor = "8041D9"; //purple
							TitlePlan = "C";
							break;
						case 4 :
							MarkerColor = "47C83E"; //green
							TitlePlan = "D";
							break;
						default :
							MarkerColor = "F15F5F"; //red
							TitlePlan = "E";
							break;
					}%>

	        var defaultIcon = makeMarkerIcon('<%=MarkerColor%>');
	    

         	var lat = <%=tb.getLatitude()%>;
	    	var lng = <%=tb.getLongitude()%>;
	    	var position = new google.maps.LatLng(lat,lng); 

	    	var title = '일정<%=TitlePlan%>-'+'<%=i + 1%>'+'번째 방문지: '+'<%=tb.getName()%>';
			// Create a marker per location, and put into markers array.
			var marker = new google.maps.Marker({
				position : position,
				title : title,
				animation : google.maps.Animation.DROP,
				icon : defaultIcon,
				id :
	<%=i%>
		});

			// Push the marker to our array of markers.
			markers.push(marker);
			// Create an onclick event to open the large infowindow at each marker.
			marker.addListener('click', function() {
				populateInfoWindow(this, largeInfowindow);
			});
	<%} //for문%>
			showListings();
			
			 <%
		      if(plan_nr!=100 & dep_lat!=null & dep_lng!=null & arr_lat!=null & arr_lng!=null){

			 	String route_dep = dep_lat + ", " + dep_lng;
			 	String route_arr= arr_lat + ", " + arr_lng;
			 	%>
			 	
			 	
			 var directionsService = new google.maps.DirectionsService; //필수
		       var directionsDisplay = new google.maps.DirectionsRenderer({
							           draggable: true,
							           map: map,
							           panel: document.getElementById('right-panel')
							         });
							        
		     
			 
			 
				 
		       directionsDisplay.addListener('directions_changed', function() {
		           computeTotalDistance(directionsDisplay.getDirections());
		         });
		       						displayRoute('<%=route_dep%>', '<%=route_arr%>', directionsService, directionsDisplay);

							       function displayRoute(origin, destination, service, display) {
							           service.route({
							             origin: origin,
							             destination: destination,
							            // waypoints: [{location: '35.158408, 129.062038'}],
							             travelMode: 'TRANSIT',
							             avoidTolls: true
							           }, function(response, status) {
							             if (status === 'OK') {
							               display.setDirections(response);
							             } else {
							               alert('Could not display directions due to: ' + status);
							             }
							           });
							         }
			
			
			
			
	<%} 
			}//if 문%>
		}//function initMap() 

		// This function will loop through the markers array and display them all.

		function showListings() {
			var bounds = new google.maps.LatLngBounds();
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(map);
				bounds.extend(markers[i].position);
			}
			map.fitBounds(bounds);
		}

		function populateInfoWindow(marker, infowindow) {
			// Check to make sure the infowindow is not already opened on this marker.
			if (infowindow.marker != marker) {
				// Clear the infowindow content to give the streetview time to load.
				infowindow.setContent('');
				infowindow.marker = marker;
				// Make sure the marker property is cleared if the infowindow is closed.
				infowindow.addListener('closeclick', function() {
					infowindow.marker = null;
				});
				var streetViewService = new google.maps.StreetViewService();
				var radius = 50;
				// In case the status is OK, which means the pano was found, compute the
				// position of the streetview image, then calculate the heading, then get a
				// panorama from that and set the options
				function getStreetView(data, status) {
					if (status == google.maps.StreetViewStatus.OK) {
						var nearStreetViewLocation = data.location.latLng;
						var heading = google.maps.geometry.spherical
								.computeHeading(nearStreetViewLocation,
										marker.position);
						infowindow.setContent('<div>' + marker.title
								+ '</div><div id="pano"></div>');
						var panoramaOptions = {
							position : nearStreetViewLocation,
							pov : {
								heading : heading,
								pitch : 30
							}
						};
						var panorama = new google.maps.StreetViewPanorama(
								document.getElementById('pano'),
								panoramaOptions);
					} else {
						infowindow.setContent('<div>' + marker.title + '</div>'
								+ '<div>No Street View Found</div>');
					}
				}
				// Use streetview service to get the closest streetview image within
				// 50 meters of the markers position
				streetViewService.getPanoramaByLocation(marker.position,
						radius, getStreetView);
				// Open the infowindow on the correct marker.
				infowindow.open(map, marker);
			}
		}

		// This function takes in a COLOR, and then creates a new marker
		// icon of that color. The icon will be 21 px wide by 34 high, have an origin
		// of 0, 0 and be anchored at 10, 34).
		function makeMarkerIcon(markerColor) {
			var markerImage = new google.maps.MarkerImage(
					'http://chart.googleapis.com/chart?chst=d_map_spin&chld=1.15|0|'
							+ markerColor + '|40|_|%E2%80%A2',
					new google.maps.Size(21, 34), new google.maps.Point(0, 0),
					new google.maps.Point(10, 34), new google.maps.Size(21, 34));
			return markerImage;
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHAu8kwLgLcIk1oWIKpJhyOQQTK6RBLNI&v=3&callback=initMap">
	</script>

</body>


<div class="clear"></div>
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
</html>