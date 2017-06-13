<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 참조할 사이트 -->
<!-- http://www.elandmall.com/main/initMain.action -->

<!-- Footer -->
<footer id="footer">
	<%
		String id = (String)session.getAttribute("id");
	%>
	<div class="footContainer">
		<div class="left">
			<h4>before you go</h4>
			<ul>
				<li><a href="./PlanMain.pl">여행지</a></li>
				<li><a href="./QandAList.qna">일정 Q&A</a></li>
				<li><a href="./BoardList.bo">인생샷그램</a></li>
				<%if(id==null){%>
					<li><a href="popupToggle()">함께해요</a></li>
					<li><a href="popupToggle()">일정 관리</a></li>
				<%}else {%>
					<li><a href="./BoardList1.bb?plan_nr=100">함께해요</a></li>
					<li><a href="./MyPlan.pln?plan_nr=100">일정관리</a></li>
				<%}%>
				
			</ul>
		</div>
		
		<div class="center">
			<h4>회사 정보</h4>
			<ul>
				<li><a href="./QandACompanyIntro.qna">회사소개</a></li>
				<li><a href="./QandAHowToUse.qna">이용방법</a></li>
				<li><a href="./QandAadvertise.qna">광고 및 제휴</a></li>
			</ul>
		</div>
		
		<div class="right">
			<h4>고객센터</h4>
			<ul>
				<li><a href="./QandAWrite.qna">문의하기</a></li>
			</ul>
		</div>
		
		<div class="footer_logo">
			<a href="http://www.mangoboard.net/MangoPublish.do?id=USRTPL_000125568" target="blank"><strong style="color: yellow;">Before</strong> you go...</a>
		</div>
		
		<div class="clear"></div>
	</div>

</footer>

</body>
</html>