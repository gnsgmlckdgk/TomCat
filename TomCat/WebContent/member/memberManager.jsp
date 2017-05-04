<%@page import="net.member.db.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 회원관리 페이지(관리자) -->
<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- Main -->
<section id="main" class="wrapper">
	<div class="container">

		<!-- 서브메뉴 -->
		<jsp:include page="subMenu/memberManager.jsp"/>
		
		<!-- 컨텐츠 -->
		<%
			// 회원리스트 가져오기
			List<MemberBean> memberList = (List)request.getAttribute("memberList");
			MemberBean mb = null;
		%>
		<div class="content">
			<div class="content_member_memberManager">
				<h1>회원 관리</h1>
					
					<table>
						<tr>
							<th>프로필사진</th><th>아이디(닉네임)</th><th>회원탈퇴</th><th>권한설정</th>
						</tr>
						<%
						if(memberList.size() != 0) {
							for(int i=0; i<memberList.size(); i++) {
								mb = memberList.get(i);
								%>
								<tr>
									<td>
									
									<img src="./upload/images/profileImg/<%=mb.getProfile() %>" width="100px" height="100px">
									
									</td>
									
									<td><%=mb.getId() %>(<%=mb.getNick() %>)</td><td>회원탈퇴버튼</td><td>권한설정 select박스</td>
								</tr>
								<%
							}
						}
						%>
						
					</table>
				
			</div> <!-- content_member_info -->
		</div>	<!-- content -->
	
	</div>
</section>

<div class="clear"></div>

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />