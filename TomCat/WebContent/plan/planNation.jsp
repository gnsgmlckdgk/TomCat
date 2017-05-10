
<%@page import="net.plan.db.PlanCityBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<!-- Banner -->
<!-- <section id="banner"> -->

<%
	String nation = request.getParameter("nation");	// 국가명
	String id = (String) session.getAttribute("id");
%>
<!-- One 지역명 및 설명-->
<section id="banner">
	<div class="container 75%">
		<div class="row 200%">
			<div class="6u 12u$(medium)">
				<h2><%=nation%>
					
				</h2>
				<p>
					Perspiciatis 펄스피치아티스 <br>doloremque recusandae dolor
				</p>
				<br>
				<p>
					http://blog.acronym.co.kr/337 <br>
					https://ko.wikipedia.org/wiki/%EB%89%B4%EC%9A%95
				</p>
				<br>
				<p>이 부분까지 위키피디아에서 파싱???</p>
				
			</div>
			<div class="6u$ 12u$(medium)">
				<!-- 수현씨 지도 부분 -->
				<iframe width="600" height="450" frameborder="0" style="border: 0"
					src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAwZMwcmxMBI0VQAUkusmqbMVHy-b4FuKQ&q=<%=nation%>"
					allowfullscreen> </iframe>
			</div>
			<!-- 수현씨 지도 부분 끝 -->
		</div>
	</div>
</section>

<!-- Two 국가의 지역 리스트 -->
<section id="nation_two" class="wrapper style2 special">
<%
	List<PlanCityBean> pcbList = (List)request.getAttribute("pcbList");
	PlanCityBean pcb = null;

	int count = Integer.parseInt(String.valueOf(request.getAttribute("count")));	// 게시글 갯수
	String pageNum = request.getParameter("pageNum");	// 현재 페이지
	if(pageNum==null) {
		pageNum="1";
	}
	int currentPage = Integer.parseInt(pageNum);
%>
	<div class="container">
		<h2><%=nation%> 주요 도시</h2>
		
		<div class="city_list_div">
			<table>
			<%
			if(count>0) {
				for(int i=0; i<pcbList.size(); i++) {
					pcb = pcbList.get(i);
					%>
					<tr>
					<td class="img_td" style="background-image: url('./images/plan/nation/<%=pcb.getEn_name()%>.jpg'); background-size: cover;"></td>
					<td class="txt_td">
						<p style="font-size: 1.2em; font-weight: bold; color: black;"><%=pcb.getName() %></p>
						<p style="font-size: 0.7em;"><%=pcb.getEn_name() %></p>
						<p style="font-size: 1.0em; color: #6B66FF;"><%=pcb.getInfo() %></p>
					</td>
					</tr>
					<%
				}
			}else {
				%>
				<tr>
				<th colspan="2">정보가 없습니다...</th>
				</tr>
				<%
			}
			// 페이징
			int pageCount = Integer.parseInt(String.valueOf(request.getAttribute("pageCount")));
			int pageBlock = Integer.parseInt(String.valueOf(request.getAttribute("pageBlock")));
			int startPage = Integer.parseInt(String.valueOf(request.getAttribute("startPage")));
			int endPage = Integer.parseInt(String.valueOf(request.getAttribute("endPage")));
			%>
			</table>
			<div class="page">
				<%
				if(currentPage > pageBlock) {
					%><a href="./PlanNation.pl?nation=<%=nation %>&pageNum=<%=startPage-pageBlock%>">[이전]</a><%	
				}
				for(int i=startPage; i<=endPage; i++) {
					%><a href="./PlanNation.pl?nation=<%=nation %>&pageNum=<%=i%>" <%if(currentPage==i) { %>style="color: #000; background-color: #f0f0f0;"<%}%>><%=i %></a><%
				}
				if(pageCount > endPage) {
					%><a href="./PlanNation.pl?nation=<%=nation %>&pageNum=<%=startPage+pageBlock%>">[다음]</a><%
				}
				%>
			</div>
		</div>	<!-- city_list_div -->
	</div>	<!-- container -->
</section>

<!-- Three -->
<section id="three" class="wrapper style1">
	<div class="container">
		<header class="major special">
			<h2><%=nation %>
				사진
			</h2>
			<!-- <p>Feugiat sed lorem ipsum magna</p> -->
		</header>

		<div class="feature-grid">

			<!-- 이미지 서치 시작.-->

			<script src="./assets/js/plan/daumSearch3.js"></script>

			<div id="daumForm">
				<input id="daumSearch" type="hidden" value="<%=nation %>+여행"
					onkeydown="javascript:if(event.keyCode == 13) daumSearch.search();" />
				<!-- 				<input id="daumSubmit" onclick="javascript:daumSearch.search()" -->
				<!-- 					type="submit" value="검색" /> -->
			</div>

			<div id="daumView">
				<div id="daumImage"></div>
			</div>

			<div id="daumScript">
				<div id="daumImageScript"></div>
			</div>
		</div>
		<!-- 이미지 서치 끝. -->


	</div>
	</div>
</section>

<!-- Four -->
<section id="four" class="wrapper style3 special">
	<div class="container">
		<header class="major">
			<h2>Aenean elementum ligula</h2>
			<p>Feugiat sed lorem ipsum magna</p>
		</header>
		<ul class="actions">
			<li><a href="#" class="button special big">Get in touch</a></li>
		</ul>
	</div>
</section>

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />

