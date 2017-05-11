<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- Banner -->
<section id="banner">

	<!-- 입력란 들어갈 곳. -->

	<link rel="stylesheet" href="assets/css/myplan/payPlanC.css" />

	<%
		String id = (String) session.getAttribute("id");
		String nick = (String) session.getAttribute("nick");
		int gold_price = 97000;
		int discount_price = 0;
		int send_fee = 3000;
	%>
	<h2>결제</h2>
	<form action="./PayAction.pln" method="post">

		<div>
			<h4>결제하실 정보</h4>
			<table>
				<tr>
					<th>선택사항</th>
					<th>상품금액</th>
					<th>수량</th>
					<th>할인</th>
					<th>할인금액</th>
					<th>주문금액</th>
					<th>배송정보</th>
				</tr>
				<tr>
					<td>일정C</td>
					<td><%=gold_price%>원</td>
					<td>1</td>
					<td>-</td>
					<td><%=discount_price%>원</td>
					<td><b><%=gold_price - discount_price%>원</b></td>
					<td><%=send_fee%>원</td>
				</tr>
			</table>
			<br>

			<h4>배송 정보</h4>
			<table>
				<tr>
					<th>주문하시는 분</th>
					<td>
						<table class="innerTable">
							<tr>
								<td>이름</td>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="email"></td>
							</tr>
							<tr>
								<td>휴대폰 번호</td>
								<td><input type="text" name="email"></td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<th>받으시는 분</th>
					<td>
						<table class="innerTable">
							<tr>
								<td>이름</td>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<td>휴대폰 번호</td>
								<td><input type="text" name="email"></td>
							</tr>
							<tr>
								<td>받으실 주소</td>
								<td><input type="text" name="address"
									value="어엇 폼만 만드려 했는데 할게 늘어나네?"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th>배송메시지</th>
					<td><input type="text" name="message"></td>
				</tr>
				<tr>
					<th>총배송비</th>
					<td><%=send_fee%>원</td>
				</tr>
			</table>

			<h4>할인혜택</h4>
			현재 적용 가능한 할인혜택이 없습니다. <br>
			<br>
			<br>
			<h4>결제수단</h4>
			<div class="pay_way">
				<input type="radio" name="pay_way" value="1" /> 신용카드<br> <input
					type="radio" name="pay_way" value="2" /> 실시간 계좌이체<br> <input
					type="radio" name="pay_way" value="3" /> 무통장<br> <input
					type="radio" name="pay_way" value="4" /> 휴대폰 결제<br> <input
					type="radio" name="pay_way" value="5" /> 신용, 믿음<br>
			</div>
			<div>신용카드 결제</div>


		</div>


		<div class="banner">
			<h4>최종 결제 정보</h4>
			<table>
				<tr>
					<th>상품금액</th>
					<td><%=gold_price%>원</td>
				</tr>
				<tr>
					<th>할인금액</th>
					<td><%=discount_price%>원</td>
				</tr>
				<tr>
					<th>배송비</th>
					<td><%=send_fee%>원</td>
				</tr>
				<tr class="last_fee">
					<th colspan="2">총 결제금액</th>
				</tr>
				<tr class="last_fee">
					<th colspan="2" class="right"><%=gold_price - discount_price + send_fee%>원</th>
				</tr>
			</table>
			<br> <input type="submit" style="width: 100%" value="구매하기">
		</div>


	</form>



	<!-- 입력란 들어갈 곳. 끝. -->

</section>

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />