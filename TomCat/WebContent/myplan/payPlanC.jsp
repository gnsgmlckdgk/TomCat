<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- Banner -->
<section id="banner">

	<!-- 입력란 들어갈 곳. -->

<%
String id = (String) session.getAttribute("id");
String nick = (String) session.getAttribute("nick");
%>

<form action="./PayAction.pln" method="post">
	<h2>결제</h2>
	<div>
		<h4>결제하실 정보</h4>
		<table>
			<tr>
				<th>상품명/선택사항</th>
				<th>상품금액</th>
				<th>수량</th>
				<th>할인</th>
				<th>할인금액</th>
				<th>주문금액</th>
				<th>배송정보</th>
			</tr>
			<tr>
				<td>일정C</td>
				<td>100,000원</td>
				<td>1</td>
				<td>-</td>
				<td>-</td>
				<td><b>100,000원</b></td>
				<td>-</td>
			</tr>
		</table>
		<br>
		
		<h4>배송 정보</h4>
		<table>
			<tr>
				<th>주문하시는 분</th>
				<td>
					<table>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="email"></td>
						</tr>
						<tr>
							<td>휴대폰 번호</td>
							<td><input type="number" name="email"></td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<th>받으시는 분</th>
				<td>
					<table>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name"></td>
						</tr>
						<tr>
							<td>휴대폰 번호</td>
							<td><input type="number" name="email"></td>
						</tr>
						<tr>
							<td>받으실 주소</td>
							<td><input type="text" name="address" value="어엇 폼만 만드려 했는데 할게 늘어나네?"></td>
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
				<td>-</td>
			</tr>
		</table>
	
		<h4>할인혜택</h4>
		현재 할인혜택이 없습니다.
	
		<h4>결제수단</h4>
		
	
	</div>
	<input type="submit" value="구매하기">
</form>

	

	<!-- 입력란 들어갈 곳. 끝. -->

</section>

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />