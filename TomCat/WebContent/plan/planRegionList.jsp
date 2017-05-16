<%@page import="net.plan.db.PlanTravelBean"%>
<%@page import="net.plan.db.PlanDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//파라미터 값 가져오기.
	String region = request.getParameter("region"); // 리스트의 링크 값
	String search = request.getParameter("search");	// 검색값
	if(search==null) {
		search="";
	}
	
	//객체 생성
	PlanDAO pdao = new PlanDAO();

	/* 게시글 가져오기 */
	//DB에 등록된 글의 개수.
	int count = 0;
	if("".equals(search)) {	// 검색값이 없으면
		count = pdao.getTravelCount(region);
	}else {	// 검색값이 있으면
		count = pdao.getTravelCount(region, search); 
	}

	// 한페이지에 보여줄 글의 개수
	int pageSize = 5;

	// 현페이지가 몇페이지인지 가져오기(기본 1페이지)
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null)
		pageNum = "1"; // pageNum없으면 무조건 1페이지
	int currentPage = Integer.parseInt(pageNum);

	// 시작글 구하기 1 11 21 31 ... <= pageNum, pageSize 조합
	int startRow = (currentPage - 1) * pageSize + 1;

	// 끝행구하기
	int endRow = currentPage * pageSize;

	// 도시 리스트 가져오기
	List<PlanTravelBean> ptbList = null;
	if (count > 0) {
		if("".equals(search)) {	// 검색값 없으면
			ptbList = pdao.getTravelList(startRow, pageSize, region);
		}else {	// 검색값 있으면
			ptbList = pdao.getTravelList(startRow, pageSize, region, search);
		}	
	}

	/* 페이징 */
	// 필요한 전체 페이지 수
	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	// 한페이지에 출력할 페이지 수
	int pageBlock = 5;
	// 시작 페이지
	int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
	;
	// 끝 페이지
	int endPage = startPage + pageBlock - 1;
	if (endPage > pageCount) {
		endPage = pageCount;
	}
%>

<!-- 검색폼 -->
<div class="search_div">
	<form action="javascript:regionListChange('<%=pageNum %>');" method="post">
		<img src="./images/member/search_l2.png" class="search_img">
		<input type="text" name="search" id="search" value="<%=search %>" placeholder="search...">
		<input type="submit" value="검색" class="button alt">
	</form>
</div>
					
<div class="clear"></div>

<table>
	<%
		PlanTravelBean ptb = null;
		if (count > 0) {
			for (int i = 0; i < ptbList.size(); i++) {
				ptb = ptbList.get(i);
	%>
	<tr onclick="location.href='./PlanRegion.pl?region=<%=ptb.getName()%>';">
		<td class="img_td"
			style="background-image: url('./images/plan/nation/<%=ptb.getCity_code()%>.jpg'); background-size: cover;"></td>
		<td class="txt_td">
			<p style="font-size: 1.2em; font-weight: bold; color: black;"><%=ptb.getName()%></p>
			<p style="font-size: 0.7em;"><%=ptb.getCity_code()%></p>
			<p style="font-size: 1.0em; color: #6B66FF; line-height: 20px; letter-spacing: -1px; word-spacing: 4px;"><%=ptb.getInfo()%></p>
		</td>
	</tr>
	<%
		}
		} else {
	%>
	<tr>
		<td colspan="2"><p>찾으시는 정보가 없습니다.</p></td>
	</tr>
	<%
		}
	%>
</table>

<%
	// 페이징
%>
<div class="page">
	<%
		if (currentPage > pageBlock) {
	%><a href="javascript:regionListChange('<%=startPage - pageBlock%>', '<%=search%>');">[이전]</a>
	<%
		}
		for (int i = startPage; i <= endPage; i++) {
	%><a href="javascript:regionListChange('<%=i%>', '<%=search%>');"
		<%if (currentPage == i) {%>
		style="background-color: #ccc;" <%}%>><%=i%></a>
	<%
		}
		if (pageCount > endPage) {
	%><a href="javascript:regionListChange('<%=startPage + pageBlock%>', '<%=search%>');">[다음]</a>
	<%
		}
	%>
</div>