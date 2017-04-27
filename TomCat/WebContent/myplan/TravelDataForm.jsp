<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>

<h1>여행장소 db 입력용 임시 페이지</h1>

<form action="TravelDataPro.jsp" method="post" name="fr">




타입 - p(명소),r(맛집),h(호텔) 3개중에(p,r,h 중) 하나만 넣으세요 :<input type="text" name="type"><br>
국가코드(kr, jp, ph) 3개중에 하나만 넣으세요:<input type="text" name="country_code"><br>
도시코드(seoul, busan, tokyo, osaca, manila, cebu) 6개중에 하나만 넣으세요 :<input type="text" name="city_code"><br>
명칭(ex 조선비치호텔) : <input type="text" name="name"><br>

lat : <input type="text" name="latitude"><br>
lng : <input type="text" name="longitude"><br> 
lat,lng 값은 <a href="https://www.google.co.kr/maps" target="blank">구글맵</a>에서 특정 장소 검색후 <br>
marker 가 뜨면 마우스 우클릭하여 "이곳이 궁금한가요?" 클릭하면 lat, lng 정보 확인가능<br>
화면 좌측에 해당장소의 주소 복사해서 아래 주소칸에 넣으세요<br>
 
장소소개 : <input type="text" name="info"><br>
주소 : <input type="text" name="address"><br>

<input type="submit" value="정보저장">
</form>
</body>
</html>
