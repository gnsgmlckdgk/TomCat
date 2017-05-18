<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <link rel="stylesheet" href="assets/css/myplan/payPlanC.css" /> -->
<%
	int i = Integer.parseInt(request.getParameter("i"));
%>

<%
	if (i == 1) {
%>
<div class="pay_way_div">
	<div class="pay_way_title">신용카드</div>

	<table>
		<tr>
			<th>카드선택</th>
			<td><select name="card_choice">
					<option value="">카드종류를 선택해주세요.</option>
					<option value="bc">비씨카드</option>
					<option value="kb">국민카드</option>
					<option value="nh">농협카드</option>
			</select></td>
		</tr>

		<tr>
			<th>할부선택</th>
			<td><select name="card_choice">
					<option value="">일시불</option>
					<option value="month">3개월</option>
					<option value="year">3년</option>
					<option value="light-year">3광년</option>
			</select></td>
		</tr>
	</table>
</div>
<%
	} else if (i == 2) {
%>
<div class="pay_way_title">무통장</div>
<br>
<%
	} else if (i == 3) {
%>
<div class="pay_way_title">휴대폰 결제</div>
<br>
<%
	} else if (i == 4) {
%>
<div class="pay_way_title">믿음</div>
<br>
<%
	}
%>