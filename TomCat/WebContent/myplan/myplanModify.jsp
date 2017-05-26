<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="temp.MyPlanBean"%>
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
<link rel="stylesheet" href="assets/css/map/modifyNewFile1.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
</head>
<script>
/* $(function(){
	$("#left_box1").click(function(){
		var effect = 'slide';
		var options ='left';
		var duration = 500;
		$('#left_box2').toggle(effect, options, duration);
	}); 
}); */ /* 사용안함  나중에 쓸일이 있을지 몰라 그대로 둠 */

$(function(){
	$("#left_box2").click(function(){
		var effect = 'slide';
		var options ='left';
		var duration = 500;
		$('#right_box').toggle(effect, options, duration);
	}); 
});


$( function() {
    $( "#left_box2_detail" ).sortable();
    $( "#left_box2_detail" ).disableSelection();
  } );
  
  
</script>
<body>
	<%
		List basketList = (List) request.getAttribute("basketList");
		List goodsList = (List) request.getAttribute("goodsList");
		String id = (String) session.getAttribute("id");

		int plan_nr = Integer.parseInt(request.getParameter("plan_nr"));
		

		String fromDate = (String) request.getParameter("fromDate");
		String toDate = (String) request.getParameter("toDate");
		List datelist = (List)request.getAttribute("datelist");
		System.out.println(fromDate);
		
		
		
		String dep_lat =  (String) request.getParameter("dlat");
		String dep_lng =  (String) request.getParameter("dlng");
		String arr_lat =  (String) request.getParameter("alat");
		String arr_lng =  (String) request.getParameter("alng");
    
		%>

		<!-- <form action="./MyPlanModifyAction.pln" method="post" ></form> -->
		<%-- <input type="text" name="plan_nr" value="<%=plan_nr%>"> --%>
		<div class="wrap">
			<div id="left_box1">
				<!-- box1 -->
				<ul id="left_box1_detail">
					<!-- myplanModify.css -->
					<li id="size"><%if (plan_nr == 1) {%>일정A<%}%><%if (plan_nr == 2) {%>일정B<%}%></li>
					<li>전체일정보기</li>
					<li><%=fromDate%></li>
					<%for(int i=0;i<datelist.size();i++){ %>
					<li>
						<%=datelist.get(i) %>
					</li>		
						<% } %>
					<li><%=toDate%></li>
				</ul>
			</div>
			<div id="left_box2">
				<!-- box2 찜 바구니, 날짜마다 바구니 다르게 할 예정 ajax 찾는중-->
				<ul id="left_box2_detail">
					<%-- <%
						for (int i = 0; i < goodsList.size(); i++) {
							TravelBean tb = (TravelBean) goodsList.get(i);
					%>
						<li><%=tb.getName()%></li>
						<%
							}
						%> --%>
					<!-- 빈 공간으로 두고 right box에서 찜하기 버튼 눌러서 리스트 채울 예정 -->
					<li><%=fromDate %></li>
					<li><button style="border: 1px solid red;">경로최적화</button><!-- 가능할지 의문?  --></li>
					<li>1</li>
					<li>2</li>
					<li>3</li>
					<li>4</li>	
					<li>5</li>
					<li>6</li>
					<li>7</li>
					<li>8</li>
				</ul>	
			</div>	
			<div id="right_box">
				<!-- box3 도시 찜 버튼 -->
				<ul id="right_box_detail">
					<li><form action="#" method="get">
						<input type="text" name="region" placeholder="장소검색" style="background:#fff;"> 
						<input type="button" value="검색" class="button special"></form>
					</li><!-- 성우씨 찜하기 기능 -->
				</ul>
			</div>
			<div id="map" class="f1" ></div><!-- map -->	
		</div>
		
	
		
		
		
		
		
		<!--  myplan.jsp 페이지에서 지도 code 가져옴,  수정예정 -->
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
            center: {lat: 35.096706, lng: 129.03049},
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

<%-- 	
		<table border="1" >
					<tr>
						<td>plan_nr</td>
						<td>item_nr</td>
						<td>name</td>
					</tr>
				
					<%
						for (int i = 0; i < basketList.size(); i++) {
							MyPlanBasketBean mpbb = (MyPlanBasketBean) basketList.get(i);
							TravelBean tb = (TravelBean) goodsList.get(i);
						/* 	if (plan_nr != mpbb.getPlan_nr() & plan_nr != 100)
								continue; */
					%>
					<tr>
						<td><%=mpbb.getPlan_nr()%></td>
						<td><%=mpbb.getItem_nr()%></td>
						<td><%=tb.getName()%></td>
					</tr>
					<%
						}
					%>
		</table> --%>
<%-- <table border="1" class="tg" >
	<%if(plan_nr==1){%>일정A<%} %>
    <%if(plan_nr==2){%>일정B<%} %>
    <%if(plan_nr==3){%>일정C<%} %> 
	<% 	
	for(int i=0;i<basketList.size();i++){
	MyPlanBasketBean mpbb = (MyPlanBasketBean)basketList.get(i);
	TravelBean tb=(TravelBean)goodsList.get(i);
	if(mpbb.getId().equals(id)){
	if(mpbb.getPlan_nr()== plan_nr){
	%>
  	<tr>
    <th class="tg-031e" rowspan="2">
   	<%=mpbb.getDay_nr()%>째날
    </th>
    <th class="tg-031e">낮</th>
    <td class="tg-yw4l"></td>
	<td class="tg-yw4l"></td>
	<td class="tg-yw4l"></td>
	<td class="tg-yw4l"></td>
  	</tr>
 	<tr>
 	<th class="tg-yw4l">밤</th>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l"></td>
	<td class="tg-yw4l"></td>
	<td class="tg-yw4l"></td>
	</tr>
	<tr><td colspan="7"><input type="submit" value="일정수정">
	<input type="reset" value="다시등록"></td>
	</tr>
 	<%
	}
	}
	}
  	%>
</table> --%>
<div class="clear"></div>
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
</html>