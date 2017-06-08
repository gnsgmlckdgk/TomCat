<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>




<!--이미지 슬라이드 플러그인 -->

<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.5.1/fotorama.css"
	type="text/css" />

<script
	src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.5.1/fotorama.js"></script>

</head>
<body>
	<%
		//한글처리
		request.setCharacterEncoding("utf-8");

		//파라미터 값 가져오기(월, 도시)
		String month = request.getParameter("month");
		String city_name=request.getParameter("city_name");

		//도시 파라미터 가져오기
		if (month == null) {
			month = "1월";
		}
	%>
	<script type="text/javascript">
		var search = function() {
			$.ajax({
				url : "http://apis.daum.net/search/image",
				dataType : "jsonp",
				type : "post",
				jsonp : "callback",
				data : {
					apikey : "5aad815bb793e165b8de68b1d3e26d3467e96367", //다음 API KEY 입력
					q : $("#q").val(), // search keyword
					result : "16", // result set length
					pageno : $("#pageno").val(), // pageNo
					output : "json" // JSONP type format json
				},

				success : function(r) {
					var list = r.channel.item;
					var fr = "";
					for ( var i in list) {
						fr += "<a href=\""+ list[i].image +"\">" +
						"<img src=\""+ list[i].thumbnail +"\"></a>";
					}
					fr = "<div data-nav='thumbs'>" + fr + "</div>";
					$("#fr").html(fr);
					$("#pageno").val(parseInt($("#pageno").val()));
				}
			});
			$.ajax({
				url : "http://apis.daum.net/search/image",
				dataType : "jsonp",
				type : "post",
				jsonp : "callback",
				data : {
					apikey : "5aad815bb793e165b8de68b1d3e26d3467e96367", //다음 API KEY 입력
					q : $("#q").val(), // search keyword
					result : "16", // result set length
					pageno : $("#pageno2").val(), // pageNo
					output : "json" // JSONP type format json
				},

				success : function(r) {
					var list = r.channel.item;
					var fr = "";
					for ( var i in list) {
						fr += "<a href=\""+ list[i].image +"\">" +
						"<img src=\""+ list[i].thumbnail +"\"></a>";
					}
					fr = "<div data-nav='thumbs'>" + fr + "</div>";
					$("#fr2").html(fr);
					$("#pageno2").val(parseInt($("#pageno2").val()));
				}
			});
			return false;
		}
		$(function() {
			$("#go").click(search());
			$("#q").bind("change", function() {
				$("#pageno").val(0);
			});
			$("#q").bind("keypress", function(event) {
				if (event.which === 13) {

					search();
				}
			})
		});
	</script>
</head>

<body>

	<form onsubmit="return search()">
		 <input id="q" type="hidden" value="<%=city_name %> <%=month%> 코디">  
		 <input id="pageno" type="hidden" value="1"> 
		 <input id="go" type="hidden" value="Go">
		 <input id="pageno2" type="hidden" value="3">
	</form>
	<div id="fr" style="padding-left: 20px;">
	
	</div>
	<div id="fr2" style="padding-left: 20px;">
	
	</div>
	<div class="clear"></div>


</body>
</html>