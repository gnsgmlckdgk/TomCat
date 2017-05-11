
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
<link rel="stylesheet" href="assets/css/map/map.css" />

<body>


	<style>
.container {
	height: 100%;
	position: relative;
}

#map {
	bottom: 0px;
	height: 100%;
	left: 375px;
	position: absolute;
	right: 0px;
	border: 1px solid #999999;
	border-radius: 10px;
}

.myplan-list {
	background: #fff;
	border: 1px solid #999;
	border-radius: 3px;
	height: 100%;
	line-height: 35px;
	padding: 10px 10px 30px 10px;
	text-align: left;
	width: 353px;
}

#pano {
	width: 220px;
	height: 220px;
}

.text {
	font-size: 12px;
}
</style>

	<%
		String id = (String) request.getParameter("id");
		String nick = (String) request.getParameter("nick");

		if (id == null) {
			response.sendRedirect("./Main.me?loginCheck=0");
			out.print("로그인이 되지 않았습니다.");
		}

		List basketList = (List) request.getAttribute("basketList");
		List goodsList = (List) request.getAttribute("goodsList");
		int plan_nr = Integer.parseInt(request.getParameter("plan_nr"));
	%>
	<h1>
		여행장바구니<%=basketList.size()%><%=goodsList.size()%></h1>


	<div class="container">
		<div class="myplan-list">

			<h3><a href="./MyPlan.pln?plan_nr=100">나의 여행 일정 목록</a> &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;[<a href="./MyPlanModify.pln?plan_nr=<%=plan_nr %>">수정</a>]</h3>
			
				<ul class="actions small">
					<li><a href="./MyPlan.pln?plan_nr=1" class="button special small">일정A</a></li>
					<li><a href="./MyPlan.pln?plan_nr=2" class="button small">일정B</a></li>
					<li><a href="./MyPlan.pln?plan_nr=3" class="button alt small">일정C</a></li>
				</ul>
		<div>
		    	<table border="1">
		 			<tr><td>plan_nr</td><td>item_nr</td><td>name</td></tr>
		 			
			
			  	<%
			 	  for(int i=0;i<basketList.size();i++){
					MyPlanBasketBean mpbb=(MyPlanBasketBean)basketList.get(i);
					TravelBean tb=(TravelBean)goodsList.get(i);
						if(plan_nr!= mpbb.getPlan_nr()&plan_nr!=100  ) continue;
						%>
						
						<tr>
						<td><%=mpbb.getPlan_nr() %></td>
						<td><%=mpbb.getItem_nr() %></td>
						<td><%=tb.getName()%></td>

					</tr>	   
						
									
				<%
				
		 		 }
		  	 	%></table>

			</div>
		</div>
		<div id="map"></div>
	</div>

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
     

              <%
		String MarkerColor;
	 	String TitlePlan;
       
	 	for(int i=0;i<basketList.size();i++){
	 	 	MyPlanBasketBean mpbb=(MyPlanBasketBean)basketList.get(i);
	 	 	TravelBean tb=(TravelBean)goodsList.get(i);
		 	 	if(plan_nr!= mpbb.getPlan_nr()&plan_nr!=100  ) continue;
	 		
 	 		
	 	 	switch (mpbb.getPlan_nr()) {
	 	 	case 1 : MarkerColor="6799FF"; //light blue
	 	 			 TitlePlan="A"; 
	 	 			 break;	
	 	 	case 2 : MarkerColor="F361DC"; //pink
	 	 			 TitlePlan="B"; 
	 	 			 break;	
	 	 	case 3 : MarkerColor="8041D9"; //purple
	 	 			 TitlePlan="C"; 
	 	 			 break;	
	 	 	case 4 : MarkerColor="47C83E"; //green
	 	 			 TitlePlan="D"; 
	 	 			 break;	
			default: MarkerColor="F15F5F"; //red
					 TitlePlan="E"; 
					 break;	
	 	 	}
	 	 	
	 	   %>

	        var defaultIcon = makeMarkerIcon('<%=MarkerColor%>');
	    

         	var lat = <%=tb.getLatitude()%>;
	    	var lng = <%=tb.getLongitude()%>;
	    	var position = new google.maps.LatLng(lat,lng); 

	    	var title = '일정<%=TitlePlan%>-'+'<%=i+1%>'+'번째 방문지: '+'<%=tb.getName()%>';
         // Create a marker per location, and put into markers array.
          var marker = new google.maps.Marker({
        	position: position,
            title: title,
            animation: google.maps.Animation.DROP,
            icon: defaultIcon,
            id: <%=i%>
          });
         
          // Push the marker to our array of markers.
          markers.push(marker);
          // Create an onclick event to open the large infowindow at each marker.
          marker.addListener('click', function() {
            populateInfoWindow(this, largeInfowindow);
          });
      	<%
	 	 
	 	}%> 
       showListings();
      
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

	<!-- 결제 테스트 구역(코드 보안을 해지한 상태.) -->

	<form action="https://www.paypal.com/cgi-bin/webscr" method="post"
		target="_top">
		<input type="hidden" name="cmd" value="_xclick">
		<input type="hidden" name="business" value="37UUQW9BH8GDA">
		<input type="hidden" name="custom" value="<%=id%>">
		<input type="hidden" name="lc" value="GA">
		<input type="hidden" name="item_name" value="샘플 바로 구매 버튼">
		<input type="hidden" name="amount" value="0.01">
		<input type="hidden" name="currency_code" value="USD">
		<input type="hidden" name="button_subtype" value="services">
		<input type="hidden" name="no_note" value="0">
		<input type="hidden" name="cn" value="판매자를 위한 특수 지침을 추가하세요.">
		<input type="hidden" name="no_shipping" value="2">
		<input type="hidden" name="rm" value="1">
		<input type="hidden" name="return" value="http://localhost:9080/TomCat/MyPlan.pln?plan_nr=1">
		<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted">
		<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
		<img alt="" border="0" src="https://www.paypalobjects.com/ko_KR/i/scr/pixel.gif" width="1" height="1">
	</form>


	<!-- 결제 테스트 구역 끝 -->


</body>


<div class="clear"></div>
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
</html>