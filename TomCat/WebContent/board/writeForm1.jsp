<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<section class="wrapper">

<head>
<link href="./assets/css/list.css?ver=10" rel="stylesheet" type="text/css">
<%
	String nick = (String) session.getAttribute("nick"); // 닉네임
	String location =(String) request.getParameter("location");
%>

<style>
	.wide{
		max-width: 1080px;
		margin: auto;
		
	}
</style>

</head>
<body id="ima">

	<div class="wide">

<iframe width="100%" height="400" frameborder="0" style="border: 0"
	src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAwZMwcmxMBI0VQAUkusmqbMVHy-b4FuKQ&q=<%=location%>" allowfullscreen>
</iframe>

<div class="form1">
	<form action="./BoardWriteAction1.bb" method="post" name="fr">
<b>글쓴이: <input type="text" name="nick_name" value=<%=nick%> readonly id="texta"><br></b>
<b>제목: <input type="text" name="subject" id="subject"  required><br></b>
<b>내용: <textarea rows="10" cols="20" name="content"  id="texta">
이름:
나이:
여행지:
		</textarea><br></b>
		<input type="checkbox" checked="checked" name="chk_location" id="chk_location" onchange="checkbox_change()"><label for="chk_location" id="texta">현재위치 보이기</label>
		<input type="text" value="<%=location %>" name="location" id="location" readonly="readonly">
		<input type="submit" value="올리기">
	</form>
	</div>
	</div>
	
	
	
	<!-- 현재 위치 기록 여부 체크박스 -->
	<script type="text/javascript">
	

	
	function checkbox_change(){
		
		var checkbox;
		
		var location = document.getElementById("location");
		
		if(chk_location.checked){
			location.value = '<%=location%>';
		} else {
			location.value = 'NULL';
		}
		
	}

</script>
	<!-- 현재 위치 기록 여부 체크박스 끝 -->
	

<!-- Footer --> <jsp:include page="../inc/footer.jsp" />
</section>
</body>
