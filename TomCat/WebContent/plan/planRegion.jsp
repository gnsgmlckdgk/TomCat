<%@page import="net.plan.db.PlanImageBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- Banner -->
<!-- <section id="banner"> -->

<link rel="stylesheet" href="./assets/css/map/map.css" />
<%
	String region = request.getParameter("region");
%>


<!-- One 지역명 및 설명-->
<section id="one" class="wrapper style1">
	<div class="container 75%">
		<div class="row 200%">
			<div class="6u 12u$(medium)">
				<header class="major">
					<h2><%=region%>
						설명
					</h2>
					<p>
						Perspiciatis 펄스피치아티스 <br>doloremque recusandae dolor
					</p><br>
					<p>
					http://blog.acronym.co.kr/337 <br>
					https://ko.wikipedia.org/wiki/%EB%89%B4%EC%9A%95
				</p><br>
				<p>이 부분까지 위키피디아에서 파싱?</p>
				
				</header>
			</div>
			<div class="6u$ 12u$(medium)">
				<!-- 수현씨 지도 부분 -->
				<iframe
				  width="600"
				  height="450"
				  frameborder="0" style="border:0"
				  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAwZMwcmxMBI0VQAUkusmqbMVHy-b4FuKQ&q=<%=region %>" allowfullscreen>
				</iframe>
				</div>
			<!-- 수현씨 지도 부분 끝 -->
		</div>
	</div>
</section>

<!-- Two -->

<%
	List planImageList = (List) request.getAttribute("boardList");
	int count = ((Integer) request.getAttribute("count")).intValue();
	String pageNum = (String) request.getAttribute("pageNum");
	int pageSize = ((Integer) request.getAttribute("pageSize")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
%>

<section id="two" class="wrapper style2 special">
	<div class="container">
		<header class="major">
			<h2>관광지 . 맛집 . 숙소</h2>
			<p><%=count%>개의 추천지역이
				<%=region%>에 있습니다!
			</p>
			<br> <input type="button" class="button alt fit"
				onclick="location.href='#'" value="내가 작성하기" /> <br>
			<%
				if (count != 0) {
			%>
			<input type="button" value="전체" name="spotFilter"> <input
				type="button" value="관광지" name="spotFilter"> <input
				type="button" value="맛집" name="spotFilter"> <input type="button"
				value="숙소" name="spotFilter">
			<%
				}
			%>
		</header>
		<div class="row 150%">

			<%
				//planImageList를 뿌려준다.
				if (planImageList != null) {
					for (int i = 0; i < planImageList.size(); i++) {
						PlanImageBean pib = (PlanImageBean) planImageList.get(i);
			%>
			<div class="6u 12u$(xsmall)">
				<div class="image fit captioned">
					<img class="img_sld1 w3-animate-fading"
						src="./upload/<%=pib.getFile()%>"
						alt="<%=region%> <%=pib.getType()%>" />
					<!-- <img class="img_sld1 w3-animate-fading" src="./images/pic03.jpg" alt="" /> -->

					<!-- img_sld1 클래스에 대한 이미지 슬라이드 시작 -->
					<!-- <script src="./assets/js/plan/image_slide.js"></script> -->
					<!-- img_sld1 클래스에 대한 이미지 슬라이드 끝 -->
					<h3>
						[<%=region%>
						<%=pib.getType()%>]<br>
						<%=pib.getImg_info()%><br>
						<ul class="actions">
							<li><a href="#" class="button special icon fa-download">찜</a></li>
						</ul>
					</h3>
				</div>
			</div>
			<%
				}
				}
			%>
		</div>

		<%
			if (count != 0) {
				//전체 페이지수 구하기 게시판 
				//글 50개 한화면에 보여줄 글개수 10개일경우 => 전체 5 페이지
				//글 56개 한화면에 보여줄 글개수 10개일경우 => 전체 6 페이지
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				//한 화면에 보여줄 페이지 번호 개수
				int pageBlock = 10;
				//시작페이지 번호 1~10 => 1    11~20 => 11   21~30 => 21
				int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
				//		1		  = ((     2          - 1)/pageBlock)*pageBlock+1;
				//		1		  = ((     9          - 1)/pageBlock)*pageBlock+1;
				//		11		  = ((     12          - 1)/pageBlock)*pageBlock+1;
				//		11		  = ((     19          - 1)/pageBlock)*pageBlock+1;
				//끝페이지 번호
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount) {
					endPage = pageCount;
				}
				//이전
				if (startPage > pageBlock) {
		%><a href="./PlanRegion.pl?pageNum=<%=startPage - pageBlock%>">[이전]</a>
		<%
			}
				// 1~10
				for (int i = startPage; i <= endPage; i++) {
		%><a href="./PlanRegion.pl?pageNum=<%=i%>">[<%=i%>]
		</a>
		<%
			}
				//다음
				if (endPage < pageCount) {
		%><a href="./PlanRegion.pl?pageNum=<%=startPage + pageBlock%>">[다음]</a>
		<%
			}

			}
		%>
	</div>
</section>

<!-- Three -->
<section id="three" class="wrapper style1">
	<div class="container">
		<header class="major special">
			<h2><%=region%>
				사진
			</h2>
			<p>Feugiat sed lorem ipsum magna</p>
		</header>

		<div class="feature-grid">

			<!-- 이미지 서치 시작.-->

			<script src="./assets/js/plan/daumSearch3.js"></script>

			<div id="daumForm">
				<input id="daumSearch" type="hidden" value="<%=region%>+여행"
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

