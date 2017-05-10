<%@page import="temp.MyPlanBean"%>
<%@page import="net.travel.admin.db.TravelBean"%>
<%@page import="net.myplanBasket.db.MyPlanBasketBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<!-- Header -->
<jsp:include page="../inc/header.jsp" />
<!-- 스타일 불러오기 -->
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/map/myplanModify.css" />

<body>
	<%
		List basketList=(List)request.getAttribute("basketList");
		List goodsList=(List)request.getAttribute("goodsList");
		String id = (String) session.getAttribute("id");
		int plan_nr = Integer.parseInt(request.getParameter("plan_nr"));
		
	%>

<h1>일정편집</h1>
<form action="./MyPlanModifyAction.pln" method="post">
<input type="hidden">
<table border="1" class="tg">

	
	<%if(plan_nr==1){%>일정A<%} %>
    <%if(plan_nr==2){%>일정B<%} %>
    <%if(plan_nr==3){%>일정C<%} %> 
	<% 	
	for(int i=0;i<basketList.size();i++){
	MyPlanBasketBean mpbb = (MyPlanBasketBean)basketList.get(i);
	TravelBean tb=(TravelBean)goodsList.get(i);
	if(mpbb.getId().equals(id)){
	if(mpbb.getPlan_nr()== plan_nr){
	%>
	

  	<tr>
    <th class="tg-031e" rowspan="2">
   	<%=mpbb.getDay_nr()%>째날
    </th>
    <th class="tg-031e">낮</th>
    <td class="tg-yw4l">
    <select name="category">
	<option value="outwear" <%if(tb.getName().equals("자갈치")){%>selected<%}%>>자갈치</option>
	<option value="fulldress" <%if(tb.getName().equals("용두산")){%>selected<%}%>>용두산</option>
	<option value="Tshirts" <%if(tb.getName().equals("태종대")){%>selected<%}%>>태종대</option>
	<option value="shirts" <%if(tb.getName().equals("조선비치호텔")){%>selected<%}%>>조선비치호텔</option>
	<option value="pants" <%if(tb.getName().equals("아이티윌")){%>selected<%}%>>아이티윌</option>
	<option value="shoes" <%if(tb.getName().equals("부산시민공원")){%>selected<%}%>>부산시민공원</option>
	</select>
	</td>
	 <td class="tg-yw4l">
	<select name="category">
	<option value="outwear" <%if(tb.getName().equals("자갈치")){%>selected<%}%>>자갈치</option>
	<option value="fulldress" <%if(tb.getName().equals("용두산")){%>selected<%}%>>용두산</option>
	<option value="Tshirts" <%if(tb.getName().equals("태종대")){%>selected<%}%>>태종대</option>
	<option value="shirts" <%if(tb.getName().equals("조선비치호텔")){%>selected<%}%>>조선비치호텔</option>
	<option value="pants" <%if(tb.getName().equals("아이티윌")){%>selected<%}%>>아이티윌</option>
	<option value="shoes" <%if(tb.getName().equals("부산시민공원")){%>selected<%}%>>부산시민공원</option>
	</select></td>
	 <td class="tg-yw4l">
	<select name="category">
	<option value="outwear" <%if(tb.getName().equals("자갈치")){%>selected<%}%>>자갈치</option>
	<option value="fulldress" <%if(tb.getName().equals("용두산")){%>selected<%}%>>용두산</option>
	<option value="Tshirts" <%if(tb.getName().equals("태종대")){%>selected<%}%>>태종대</option>
	<option value="shirts" <%if(tb.getName().equals("조선비치호텔")){%>selected<%}%>>조선비치호텔</option>
	<option value="pants" <%if(tb.getName().equals("아이티윌")){%>selected<%}%>>아이티윌</option>
	<option value="shoes" <%if(tb.getName().equals("부산시민공원")){%>selected<%}%>>부산시민공원</option>
	</select></td>
	 <td class="tg-yw4l">
	<select name="category">
	<option value="outwear" <%if(tb.getName().equals("자갈치")){%>selected<%}%>>자갈치</option>
	<option value="fulldress" <%if(tb.getName().equals("용두산")){%>selected<%}%>>용두산</option>
	<option value="Tshirts" <%if(tb.getName().equals("태종대")){%>selected<%}%>>태종대</option>
	<option value="shirts" <%if(tb.getName().equals("조선비치호텔")){%>selected<%}%>>조선비치호텔</option>
	<option value="pants" <%if(tb.getName().equals("아이티윌")){%>selected<%}%>>아이티윌</option>
	<option value="shoes" <%if(tb.getName().equals("부산시민공원")){%>selected<%}%>>부산시민공원</option>
	</select></td>
    

  	</tr>
 	<tr>
  	<th class="tg-yw4l">밤</th>
    <td class="tg-yw4l">
	<select name="category">
	<option value="outwear" <%if(tb.getName().equals("자갈치")){%>selected<%}%>>자갈치</option>
	<option value="fulldress" <%if(tb.getName().equals("용두산")){%>selected<%}%>>용두산</option>
	<option value="Tshirts" <%if(tb.getName().equals("태종대")){%>selected<%}%>>태종대</option>
	<option value="shirts" <%if(tb.getName().equals("조선비치호텔")){%>selected<%}%>>조선비치호텔</option>
	<option value="pants" <%if(tb.getName().equals("아이티윌")){%>selected<%}%>>아이티윌</option>
	<option value="shoes" <%if(tb.getName().equals("부산시민공원")){%>selected<%}%>>부산시민공원</option>
	</select></td>
   <td class="tg-yw4l">
	<select name="category">
	<option value="outwear" <%if(tb.getName().equals("자갈치")){%>selected<%}%>>자갈치</option>
	<option value="fulldress" <%if(tb.getName().equals("용두산")){%>selected<%}%>>용두산</option>
	<option value="Tshirts" <%if(tb.getName().equals("태종대")){%>selected<%}%>>태종대</option>
	<option value="shirts" <%if(tb.getName().equals("조선비치호텔")){%>selected<%}%>>조선비치호텔</option>
	<option value="pants" <%if(tb.getName().equals("아이티윌")){%>selected<%}%>>아이티윌</option>
	<option value="shoes" <%if(tb.getName().equals("부산시민공원")){%>selected<%}%>>부산시민공원</option>
	</select></td>
	 <td class="tg-yw4l">
	<select name="category">
	<option value="outwear" <%if(tb.getName().equals("자갈치")){%>selected<%}%>>자갈치</option>
	<option value="fulldress" <%if(tb.getName().equals("용두산")){%>selected<%}%>>용두산</option>
	<option value="Tshirts" <%if(tb.getName().equals("태종대")){%>selected<%}%>>태종대</option>
	<option value="shirts" <%if(tb.getName().equals("조선비치호텔")){%>selected<%}%>>조선비치호텔</option>
	<option value="pants" <%if(tb.getName().equals("아이티윌")){%>selected<%}%>>아이티윌</option>
	<option value="shoes" <%if(tb.getName().equals("부산시민공원")){%>selected<%}%>>부산시민공원</option>
	</select></td>
	 <td class="tg-yw4l">
	<select name="category">
	<option value="outwear" <%if(tb.getName().equals("자갈치")){%>selected<%}%>>자갈치</option>
	<option value="fulldress" <%if(tb.getName().equals("용두산")){%>selected<%}%>>용두산</option>
	<option value="Tshirts" <%if(tb.getName().equals("태종대")){%>selected<%}%>>태종대</option>
	<option value="shirts" <%if(tb.getName().equals("조선비치호텔")){%>selected<%}%>>조선비치호텔</option>
	<option value="pants" <%if(tb.getName().equals("아이티윌")){%>selected<%}%>>아이티윌</option>
	<option value="shoes" <%if(tb.getName().equals("부산시민공원")){%>selected<%}%>>부산시민공원</option>
	</select></td>
	</tr>
	
 	<%
	}
	}
	}
  	%>
	

	<tr><td colspan="7"><input type="submit" value="일정수정">
	<input type="reset" value="다시등록"></td></tr>
</table>
</form>
</body>

<div class="clear"></div>
<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />
</html>