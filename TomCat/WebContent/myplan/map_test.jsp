<%@page import="net.myplan.db.MyPlanBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%
	List<MyPlanBean> MyPlanList = (List)request.getAttribute("MyPlan");

	%>
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<!-- 스타일 불러오기 -->
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="./assets/css/map/map.css" />
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</head>

<body>
	<div class="clear"></div>
	<!-- Main -->
	<div class="tit_map">
		<h2>여행일정 한 눈에 보기</h2>
	</div>
	<div id="map"></div>
	<div id="right-panel">
    <b>출발지</b>
    <br>
    <select id="start">
      <option value=1>해운대</option>
      <option value=1>용두산</option>
      <option value=1>태종대</option>
    </select>
    <b>경유지</b>
    <br>
    <select id="waypoints">
      <option value=1>해운대</option>
      <option value=1>용두산</option>
      <option value=1>태종대</option>
    </select>
    <b>도착지</b>
    <select id="end">
      <option value=1>해운대</option>
      <option value=1>용두산</option>
      <option value=1>태종대</option>
    </select>
    <br>
    <input type="submit" id="submit" value="여행 경로보기">&nbsp;&nbsp;
    <input type="submit" value="일정에 추가하기">
    <br>
    <div id="directions-panel"></div>
    </div>
    
    <script>
    function initMap() {
	  var directionsService = new google.maps.DirectionsService;
	  var directionsDisplay = new google.maps.DirectionsRenderer;
	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 15,
	    center: {
	      lat: 35.158422,
	      lng: 129.160595
	    }
	  });
	  directionsDisplay.setMap(map);
	
	  document.getElementById('submit').addEventListener('click', function() {
	    calculateAndDisplayRoute(directionsService, directionsDisplay);
	  });
	}
	
	function calculateAndDisplayRoute(directionsService, directionsDisplay) {
	  var waypts = [];
	  var checkboxArray = document.getElementById('waypoints');
	  for (var i = 0; i < checkboxArray.length; i++) {
	    if (checkboxArray.options[i].selected) {
	      waypts.push({
	        location: checkboxArray[i].value,
	        stopover: true
	      });
	    }
	  }
	}
    </script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwZMwcmxMBI0VQAUkusmqbMVHy-b4FuKQ&callback=initMap">
	</script>
</body>
<div class="clear"></div>
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
</html>
    