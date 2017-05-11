<%@page import="net.plan.db.PlanDAO"%>
<%@page import="net.plan.db.PlanCityBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//파라미터 값 가져오기.
	String nation = request.getParameter("nation"); // 검색한 값, 리스트의 링크 값
	
	//객체 생성
	PlanDAO pdao = new PlanDAO();

	/* 게시글 가져오기 */
	//DB에 등록된 글의 개수.
	int count = pdao.getCityCount(nation);

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
	List<PlanCityBean> pcbList = null;
	if (count > 0) {
		pcbList = pdao.getCityList(nation, startRow, pageSize);
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

<table>
	<%
		PlanCityBean pcb = null;
		if (count > 0) {
			for (int i = 0; i < pcbList.size(); i++) {
				pcb = pcbList.get(i);
	%>
	<tr onclick="location.href='./PlanRegion.pl?region=<%=pcb.getName()%>';">
		<td class="img_td"
			style="background-image: url('./images/plan/nation/<%=pcb.getEn_name()%>.jpg'); background-size: cover;"></td>
		<td class="txt_td">
			<p style="font-size: 1.2em; font-weight: bold; color: black;"><%=pcb.getName()%></p>
			<p style="font-size: 0.7em;"><%=pcb.getEn_name()%></p>
			<p style="font-size: 1.0em; color: #6B66FF; line-height: 20px; letter-spacing: -1px; word-spacing: 4px;"><%=pcb.getInfo()%></p>
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
	%><a href="javascript:cityListChange('<%=startPage - pageBlock%>');">[이전]</a>
	<%
		}
		for (int i = startPage; i <= endPage; i++) {
	%><a href="javascript:cityListChange('<%=i%>');"
		<%if (currentPage == i) {%>
		style="background-color: #ccc;" <%}%>><%=i%></a>
	<%
		}
		if (pageCount > endPage) {
	%><a href="javascript:cityListChange('<%=startPage + pageBlock%>');">[다음]</a>
	<%
		}
	%>
</div>