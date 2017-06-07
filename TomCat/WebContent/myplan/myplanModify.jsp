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

<html>
<head>
<!-- 스타일 불러오기 -->
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/map/modifyNewFile7.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<style>
#reg {
	width: 100%;
	/* 	border: 1px solid red; */
	font-size: 0.8em;
}

tr {
	width: 100%;
	padding: 0;
}

.setdate {
	width: calc(100%/ 3);
	margin: auto;
	/* 	border: 1px solid green; */
}

.set_plan {
	width: cal(100%/ 3);
	vertical-align: middle;
	margin: auto;
}

/* .x_wrap { */
/* 	margin-left: 250px; */
/* 	overflow-x: scroll; */
/* 	overflow-y: auto; */
/* 	width: 1080px; */
/* 	height: 700px; */
/* 	white-space:nowrap; */
/* 	float: left; */
/* } */

/* .inner_x_wrap { */
/* 	width: 200px; */
/* 	float: left; */
/* 	height:698px; */
/* 	border: 1px solid red; */
/* } */

/* .x_wrap select { */
/* 	height: 20em; */
/* } */
.myplanContainer #pln_list select {
	width: 100%;
}

table td {
	vertical-align: middle;
}
</style>
</head>

<body>


	<%
		String id = (String) session.getAttribute("id");

		//ajax를 위해서 모델 1 방식으로 진행할 코드

		MyPlanBasketDAO basketdao = new MyPlanBasketDAO();
		MyPlanBasketBean mpbb = new MyPlanBasketBean();

		Vector vector = basketdao.getBasketList(id);
		// 		// List basketList = vector 첫번째데이터
		List basketList = (List) vector.get(0);
		// 		// List goodsList = vector 두번째데이터
		List goodsList = (List) vector.get(1);

		//ajax를 위해서 모델 1 방식으로 진행할 코드. 끝.

		//diff_day 일간
		int diff_day = Integer.parseInt(request.getParameter("diff_day"));

		//1이면 plan a, 2이면 plan b, 3이면 plan c
		int plan = Integer.parseInt(request.getParameter("plan"));

		//from, to 날짜값 받아오기.
		String from = request.getParameter("from");
		String to = request.getParameter("to");
	%>




	<form action="./MyPlanModifyAction.pln" method="post"
		style="background-color: white; color: black;" name=reg id="reg">

		<div style="width: 800px;">

			<table>
				<tr>
					<%
						if (from != null & to != null) {
					%>
					<td class="setdate" onchange="from_to()">출발일 : <input
						type="date" name="fromDate" id="fromDate" required="required"
						value="<%=from%>"> <br> 도착일 : <input type="date"
						name="toDate" id="toDate" required="required" value="<%=to%>">
						<%
							} else {
						%>
					<td class="setdate" onchange="from_to()">출발일 : <input
						type="date" name="fromDate" id="fromDate" required="required">
						<br> 도착일 : <input type="date" name="toDate" id="toDate"
						required="required">
						
					</td>
					<%
						}
					%>
					<td class="set_plan" id="set_plan" onchange="from_to()"><select
						name="plan_nr" id="plan_nr" required="required">
							<option value="1" <%if(plan == 1){%> selected <%} %>>Plan A</option>
							<option value="2" <%if(plan == 2){%> selected <%} %>>Plan B</option>
							<option value="3" <%if(plan == 3){%> selected <%} %>>Plan C</option>
					</select></td>
					<td><input type="submit" value="일정수정"><br> <input
						type="reset" value="다시등록"></td>

				</tr>
<input type="hidden" value="<%=diff_day %>" name="diff_day">
			</table>
			<!-- 장소 넣고 빼고 들어갈 공간. -->


			<div class="clear" />

			<div
				style="position: absolute; left: 1px; width: 250px; height: 500px; background-color: white;">

				<select name=a style="width: 100%; height: 35em;" multiple>

					<%
						if (basketList != null) {
							for (int i = 0; i < basketList.size(); i++) {

								TravelBean tb = (TravelBean) goodsList.get(i);
								MyPlanBasketBean mpbb2 = (MyPlanBasketBean) basketList.get(i);
								/*  여행지(상품) DB Bean */
					%>
					<option value="<%=mpbb2.getMyplans_id()%>"><%=tb.getName()%></option>
					<%
						}
						}
					%>

				</select>

			</div>


			<div border=0 cellpadding=0 cellspacing=0 class="x_wrap"
				style="position: relative; width:500px; overflow: auto; left: 270px; height: 610px;">


				<%
					if (diff_day != 0) {
						for (int i = 1; i <= diff_day; i++) {
				%>




				<div class="inner_x_wrap" style="border:1px solid blue">
					<div><%=i%>
						일차. css가 필요합니다.
					</div>
					
					
					
					<div
						style="width: 12%; float: left; vertical-align: middle; margin: auto;">
						&nbsp;<input class=button type=button value=' > '
							onclick="gor('b<%=i%>','res<%=i%>', 'plan_nr<%=i %>', '<%=plan%>', 'day_nr<%=i%>', '<%=i%>')">&nbsp; <br>
						&nbsp;<input class=button type=button value=' < '
							onclick="gol('b<%=i%>','res<%=i%>', 'plan_nr<%=i %>', '<%=plan%>', 'day_nr<%=i%>', '<%=i%>')">&nbsp;
					</div>
					
					
					
					<div style="width: 70%; float: left;">
						<select name="b<%=i%>" size=5 style="width: 100%; height:10em;">
							
						</select>
					</div>
					
					<input type='text' name='res<%=i %>' placeholder="mpbb2.getMyplans_id()">
					<input type='text' name='plan_nr<%=i %>' placeholder="plan_nr">
					<input type='text' name='day_nr<%=i %>' placeholder="day_nr">
					
					<div style="width: 12%; float: left; margin: auto;">
						&nbsp;<input class=button type=button value=' ↑ '
							onclick="gou('b<%=i%>','res<%=i%>')">&nbsp; <br>
						&nbsp; <input class=button type=button value=' ↓ '
							onclick="god('b<%=i%>','res<%=i%>')">&nbsp;
					</div>
				</div>

<hr>

				<div class="clear"></div>

				<%
					}
					}
				%>


			</div>

			<!-- 장소 넣고 빼고 들어갈 공간. 끝.-->





		</div>
	</form>

</body>

</html>

