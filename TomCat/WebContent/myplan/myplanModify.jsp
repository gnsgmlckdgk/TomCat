<%@page import="net.myplanBasket.action.DateList"%>
<%@page import="java.util.Vector"%>
<%@page import="net.myplanBasket.db.MyPlanBasketDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="temp.MyPlanBean"%>
<%@page import="net.travel.admin.db.TravelBean"%>
<%@page import="net.myplanBasket.db.MyPlanBasketBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- 스타일 불러오기 -->
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/map/modifyNewFile7.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
</head>


<script>
	$(function() {
		$("#left_box2").click(function() {
			var effect = 'slide';
			var options = 'left';
			var duration = 500;
			$('#right_box').toggle(effect, options, duration);
		});
	});

	$(function() {
		$("#left_box2_detail").sortable();
		$("#left_box2_detail").disableSelection();
	});

	/* 
	 $(document).ready(function(datelist){
	
	 var left_box1_detail li=$(this).val();
	 $('date').empty();
	 $('date').append(function(){
	
	 });
	 }); */

	if (document.test.planMaker.selectedIndex != 0) {
		alert("과목을 선택하세요");
		document.test.se.focus();
		return false;
	}//if

	$(document).ready(function() {
		//name:홍길동 age:21파라미터 넘겨서
		//string2.jsp 결과처리 내용가져오기
		$('#testPlanner').click(function() {

			$.ajax('myplanModify_selectBox.jsp', {
				data : {
					name : '홍길동',
					age : 21
				},
				success : function(data) {
					//select 뒷부분 추가
					alert("testtest");
					$('#testsel').append(data);
				}
			});

		});
	});
</script>
<body>
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
	<%
		String id = (String) session.getAttribute("id");

		//ajax를 위해서 모델 1 방식으로 진행할 코드


		MyPlanBasketDAO basketdao = new MyPlanBasketDAO();
		MyPlanBasketBean mpbb = new MyPlanBasketBean();

		Vector vector = basketdao.getBasketList(id);
		// List basketList = vector 첫번째데이터
		List basketList = (List) vector.get(0);
		// List goodsList = vector 두번째데이터
		List goodsList = (List) vector.get(1);

		//datelist
		DateList t = new DateList();
		//int tt = t.getDiffDay(fromdate, todate);
		// 		List datelist = datelist = new ArrayList();
		// 		datelist.add(fromdate);
		// 		datelist.add(todate);
		// 		datelist = t.Date(fromdate, todate);
		//datelist. 끝.

		//ajax를 위해서 모델 1 방식으로 진행할 코드. 끝.
	%>

</body>

<form action="./MyPlanModifyAction.pln" method="post">


<!-- 	<div class="wrap" style="max-width: 1080px; margin: auto;"> -->
<div style="max-width: 1080px; margin: auto;">
		<%-- 		<input type="hidden" value="<%=plan_nr%>" name="plan_nr"> --%>
		<%-- 		<input type="hidden" value="<%=fromDate%>" name="first_day"> --%>
		<%-- 		<input type="hidden" value="<%=fromDate%>" name="first_day"> --%>
		<!-- 라스튿이 -->





			출발일 :
			<input type="date" name="fromDate" required="required">
			<br> 도착일 :
			<input type="date" name="toDate" required="required">

			<select name="plan_nr" id="plan_nr" required="required">
				<option value="1">Plan A</option>
				<option value="2">Plan B</option>
				<option value="3">Plan C</option>
			</select>

			<!-- 첫째날과 마지막날 사이 -->
			<%
				//for (int j = 1; j < datelist.size() + 2; j++) {
				for (int j = 1; j < 4; j++) {
			%>
			<tr>
				<th><%=j%> 일차</th>
				<td><select name="<%=j%>">
						<option value="null">---선택하세요---</option>
						<%
							if (basketList != null) {
									for (int i = 0; i < basketList.size(); i++) {
										TravelBean tb = (TravelBean) goodsList.get(i); /*  여행지(상품) DB Bean */
						%>
						<option value="<%=tb.getName()%>"><%=tb.getName()%></option>
						<%
							}
								}
						%>
				</select></td>
			</tr>
			<%
				}
			%>
			<!-- 첫째날과 마지막날 사이 끝.-->
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/gnsgmlckdgk/TomCat
			<tr>
				<td colspan="7"><input type="submit" value="일정수정"> <input
					type="reset" value="다시등록"></td>
			</tr>
		</table>
	</div>
</form>


<div class="clear"></div>

