<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@page import="net.plan.db.PlanNationCommentBean"%>
<%@page import="java.util.List"%>
<%@page import="net.plan.db.PlanCommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");

	// 세션값 가져오기
	String id = (String)session.getAttribute("id");

	// 파라미터 값 가져오기
	String nation = request.getParameter("nation");
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null) {
		pageNum="1";
	}
	int currentPage = Integer.parseInt(pageNum);
	
	// 한 페이지에 출력할 리스트 갯수
	int pageSize = 5;
	
	// 리스트 가져오기
    PlanCommentDAO pcdao = new PlanCommentDAO();
	List<PlanNationCommentBean> list = pcdao.getListComment(nation);
%>

<%if(list==null) {
	%>
		<tr><td>리뷰가 없습니다.</td></tr>
	<%
}else {
	// 리스트로 출력할 갯수
	int begin = 0;
	if(currentPage > 1) {
		begin = currentPage * pageSize;
	}
	int end = list.size();
	if(currentPage > 1) {
		if(list.size()-begin < pageSize) {
			end = list.size();
		}else {
			end = begin + pageSize;
		}
	}
	
	PlanNationCommentBean pncb = null;
	for(int i=begin; i<end; i++) {
		pncb = list.get(i);
		%>
		<tr>
			<td>
			<%
			// 닉네임을 이용해 프로필 사진 찾기
			MemberDAO mdao = new MemberDAO();
			MemberBean mb = mdao.getMemberNick(pncb.getNick());
			MemberBean sessionIdMb = mdao.getMember(id);
			%>
			<img src="./upload/images/profileImg/<%=mb.getProfile() %>" onerror="this.src='./images/error/noImage.png'"><!-- 프로필 이미지 -->
			<span class="c_nick"><%=pncb.getNick() %></span>  <span class="c_date"><%=pncb.getDate() %></span> <br>
			<span class="c_eval"><%=pncb.getEval() %></span><br>
			<span class="c_content"><%=pncb.getContent() %></span>
			</td>
			<td>
				<%
				if(mb.getId().equals(id)) {
					%>
					<a href="#">수정</a><br>
					<%
				}
				if(mb.getId().equals(id) || sessionIdMb.getAuth()==0) {
					%>
					<a href="#">삭제</a>
					<%
				}
				%>
			</td>
		</tr>
	<%
	}
}
%>