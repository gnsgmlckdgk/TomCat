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
			// 세션값 가져오기
			String id = (String)session.getAttribute("id");	// 관리자 아이디
			if(id==null) {
				response.sendRedirect("./Main.me");
			}
			
			// 현제 페이지 번호
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
		
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
									<td class="img_td"> <img src="./upload/images/profileImg/<%=mb.getProfile() %>"> </td>
									<td class="id_td"><span><%=mb.getId() %>(<%=mb.getNick() %>)</span></td>
									<td class="delete_td">
										<%
										if(id.equals(mb.getId())) {	// 현재 로그인한 관리자 아이디와 가져온 관리자 아이디와 같다면
										%>
											<span><a href="./MemberDelete.me">탈퇴</a></span>	<!-- 회원탈퇴 페이지로 -->
										<%	
										}else {
											%>
												<span><a href="javascript:deleteMemberPass('<%=mb.getId() %>')">탈퇴</a></span>
											<%
										}
										%>
									</td>	
									<td class="auth_select_box">
										<div>
										<label>권한</label>
										<select name="auth" id="<%=mb.getId() %>" onchange="auth_change('<%=mb.getId()%>', this.options[this.selectedIndex].value);">
											<option value="admin" <%if(mb.getAuth()==0){%>selected style="font-weight: bold;"<%}%>>관리자</option>
											<option value="user" <%if(mb.getAuth()==1){%>selected style="font-weight: bold;"<%}%>>사용자</option>
										</select>
										</div>
									</td>
								</tr>
								<%
							}
						}
						%>
					</table>
					
					<%
					// 페이징
					int pageBlock = Integer.parseInt(String.valueOf(request.getAttribute("pageBlock")));
					int pageCount = Integer.parseInt(String.valueOf(request.getAttribute("pageCount")));
					int startPage = Integer.parseInt(String.valueOf(request.getAttribute("startPage")));
					int endPage = Integer.parseInt(String.valueOf(request.getAttribute("endPage")));
					%>
					<div class="page">
						<%
						if(currentPage > pageBlock) {
							%><a href="./MemberManager.me?pageNum=<%=startPage-pageBlock %>">[이전]</a><%	
						}
						for(int i=startPage; i<=endPage; i++) {
							%><%if(currentPage==i){%>
							<a href="./MemberManager.me?pageNum=<%=pageNum %>" style="font-weight: bold; background-color: #f0f0f0;"><%=i %></a>
							<%}else {%><a href="./MemberManager.me?pageNum=<%=pageNum %>"><%=i %></a><%}%><%
						}
						if(pageCount > endPage) {
							%><a href="./MemberManager.me?pageNum=<%=startPage+pageBlock %>">[다음]</a><%
						}
						%>
					</div>
					
					<script type="text/javascript">
					/* 관리자가 회원을 탈퇴시킬때 비밀번호 한번더 확인 */
					function deleteMemberPass(id) {
						window.open('./AdminPassCertification.me?id='+id+'&pageNum=<%=pageNum %>', '_blank', 
						'toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, directories=no, width=600, height=350, top=200, left=400');
					}
					
					/* 권한 설정이 변경되었을때 */
					function auth_change(id, auth) {
						
						// DB 권한을 변경함
						$.ajax({
							type: 'POST',
							url: './MemberAuthChange.me',
							data: {'id' : id, 'auth' : auth},
							dataType: 'text',
							async: false,
							success: function(data){
								console.log(data);
							},
							error: function(error){
								alert(error);
							}
						});
					}
					
					</script>
					
			</div> <!-- content_member_memberManager -->
		</div>	<!-- content -->
	
	</div>
</section>

<div class="clear"></div>

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />