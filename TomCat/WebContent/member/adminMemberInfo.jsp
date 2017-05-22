<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<style type="text/css">
		/* 나중에 외부파일로 옮길 예정 */
		div.adminMemberInfo {	/* 서브메뉴 + 주내용 */
			
		}
		div.adminMemberInfo h1 {	/* 제목 */
			border-bottom: 1px solid #ccc;
			padding: 12px;
			margin-bottom: 10px;
			font-size: 1.4em;
		}
		div.adminMemberInfo div.inner_content {	/* 제목뺀 내용들 */
			max-width: 700px;
			margin: 0 auto;
		}
		div.adminMemberInfo img {	/* 프로필 이미지 */
			display: block;
			margin: 0 auto 30px auto;
		}
		div.adminMemberInfo tr {
			display: block;
			width: 100%;
		}
		div.adminMemberInfo th {
			width: 100px;
		}
		div.adminMemberInfo td {
			width: 300px;
		}
		div.adminMemberInfo td input[type="text"] {	/* 닉네임 폼 */
			border: none;
			background-color: #fff;
		}
		div.adminMemberInfo input[type="button"] {
			display: block;
			margin: 20px auto;
		}
		
	</style>
</head>

<!-- 회원정보 보기(관리자) -->
<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<%
	// 세션값 확인
	String id = (String)session.getAttribute("id");
	if(id==null || id=="") {
		response.sendRedirect("./Main.me");
		return;
	}
	
	// 파라미터 값 가져오기
	MemberBean mb = (MemberBean)request.getAttribute("memberInfo");
	if(mb==null) {
		response.sendRedirect("./Main.me");
		return;
	}

%>

<!-- Main -->
<section id="main" class="wrapper memberManager">
		
		<div class = "container adminMemberInfo">
			<!-- 서브메뉴 -->
			<jsp:include page="subMenu/memberManager.jsp" />
			
			<!-- 주내용 -->
			<div class="content">

				<h1>회원 정보관리</h1>
				
				<!-- 제목 뺀 내용 -->
				<div class="inner_content">
				
				<!-- 프로필 사진 -->
				<img src="./upload/images/profileImg/<%=mb.getProfile() %>" onerror="this.src='./images/error/noImage.png'">	
				
				<!-- 닉네임만 수정가능하게(불건전 닉네임 방지) -->
				<table>
					<tr>
						<th>회원등급</th>
						<td><%if(mb.getAuth()==0) { %>
						<span style="color: red; font-weight: bold; text-shadow: 1px 1px 1px black;">관리자</span>
							<%}else if(mb.getGold()==1){%>
						<span style="color: gold; font-weight: bold; text-shadow: 1px 1px 1px black;">골드회원</span>
							<%}else{%>일반회원<%}%>					
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><%=mb.getId() %></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><input type="text" name="nick" value="<%=mb.getNick()%>"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><%=mb.getName() %></td>
					</tr>
					<tr>
						<th>성별</th>
						<td><%=mb.getGender() %></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><%=mb.getTel() %></td>
					</tr>
					<tr>
						<th>가입날짜</th>
						<td><%=mb.getReg_date() %></td>
					</tr>
				</table>
				
				</div><!-- inner_content -->
				
				<input type="button" value="뒤로가기" onclick="history.back();" class="button special">
				
			</div><!-- content -->
		</div>	<!-- adminMemberInfo -->
		
</section>

<!-- Footer -->
<div class="clear"></div>
<jsp:include page="../inc/footer.jsp" />

</html>
