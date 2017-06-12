<%@page import="java.util.Vector"%>
<%@page import="net.myplanBasket.db.MyPlanBasketBean"%>
<%@page import="net.myplanBasket.db.MyPlanBasketDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="net.images.db.ImagesBean"%>
<%@page import="net.plan.db.PlanCityBean"%>
<%@page import="net.plan.db.PlanSouvenirBean"%>
<%@page import="net.plan.db.PlanTravelBean"%>
<%@page import="net.plan.db.PlanCountryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./assets/css/plan/planSpot.css"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<!--이미지 슬라이드 플러그인 -->
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.5.1/fotorama.css" type="text/css" />
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.5.1/fotorama.js"></script>


<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" />
<%
	//추천장소 정보
	PlanTravelBean ptb = (PlanTravelBean)request.getAttribute("ptb");
	
	//도시이름 가져오기
	PlanCityBean pcb = (PlanCityBean)request.getAttribute("pcb");
	
	//선물리스트 가져오기
	List souvenirList = (List)request.getAttribute("souvenirList");
	
	//관광지 이미가져오기
	ImagesBean ib = (ImagesBean)request.getAttribute("ib");
	
	//아이디 
	String id =(String)session.getAttribute("id");

	//바뀌는 배경을 초 단위로 하기 위해서 현재 시간 불러오기.
	Calendar cal = Calendar.getInstance();
	int second = cal.get(Calendar.SECOND)%4;//배경 갯수에 따라서 나누는 값 바꾸기
%>

<script type="text/javascript">
var toggleBtn = 0;

	/* 처음 화면 */
	$(window).load(function(){
		$(document).ready(function(){
			//처음에 1월 자동선택
			$('input#first').css('background-color','#f32853');
			$('.blog_Spot').css('background-color','#f32853');
			$('#Spot_epilogue').css('display','none');
			$('#daumView').css('display','block');
			
			$('#writeBtn').click(function(){
				if(toggleBtn==0) {
					$('.reviewWriterDiv').removeClass('animated fadeOutUp').addClass('animated fadeInDown');
					$('.reviewWriterDiv').css('display', 'inline-block');
					
					toggleBtn = 1;
				}else {
					$('.reviewWriterDiv').removeClass('animated fadeInDown').addClass('animated fadeOutUp');
					setTimeout(function(){
						$('.reviewWriterDiv').hide();
					}, 700)
					toggleBtn = 0;
				}
			});
			
			$('.blog_Spot').click(function(){
				$('.Spot_epilogue').css('background-color','#323037');
				$(this).css('background-color','#f32853');
				$('#Spot_epilogue').css('display','none');
				$('#daumView').css('display','block');
			});
			
			$('.Spot_epilogue').click(function(){
				$('.blog_Spot').css('background-color','#323037');
				$(this).css('background-color','#f32853');
				$('#daumView').css('display','none');
				$('#Spot_epilogue').css('display','block');
			
				
			});
			
			$('input.month').click(function(){
				$('input.month').css('background-color','#323037');//진한회색	
				$(this).css('background-color','#f32853');//핑크색
				var month=$(this).val();
				//다른 월 선택시 부르기
				$.ajax({
					type:'post',
					url:'./plan/travelStyle.jsp',
					data:{month : month, city_name:'<%=pcb.getName()%>'},
					success:function(data){
						$('div.month_img').empty(data);
						$('div.month_img').append(data);
					},
					error:function(xhr, status, error){
						alert(error);
					}
				});
			});
		});
		$.ajax({ //1월 검색값 불러오기(월, 도시이름 넘겨줌)
			type:'post',
			url:'./plan/travelStyle.jsp',
			data:{month:'1월', city_name:'<%=pcb.getName()%>'},
			success:function(data){
				$('div.month_img').append(data);
			},
			error:function(xhr, status, error){
				alert(error);
			}
		});
		
		$.ajax({
			type: 'post',
			url: './plan/planComment/planSpotCommentList.jsp',
			data : {spot:'<%=ptb.getName()%>'},
			success: function(data) {
				$('div.comment .review_list').empty();
				$('div.comment .review_list').append(data);
			},
			error: function(xhr, status, error) {
				alert(error);
		    } 
		});
	});
</script>

<!-- include jQuery library -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<!-- include Cycle plugin -->
<script type="text/javascript" src="http://malsup.github.com/jquery.cycle.all.js"></script>

<div class="clear"></div>

<!-- 배경-->
<%if(second==3) {%>
<section id="banner" class="region_one b_back<%=second%>">
<%} else if(second==2) {%>
<section id="banner" class="region_one b_back<%=second%>">
<%} else if(second==1) {%>
<section id="banner" class="region_one b_back<%=second%>">
<%} else { %>
<section id="banner" class="region_one b_back">
<%} %>
<!-- 본문 -->
<div class = "planSpot">
<h2>
	<%=ptb.getName() %><span><%=ptb.getAddress() %></span>

<!-- 찜하기 -->

<%
		MyPlanBasketDAO mpbd = new MyPlanBasketDAO();

		Vector idPlanList = mpbd.getBasketList(id);
		List basketList = (List)idPlanList.get(0);
		List goodsList = (List)idPlanList.get(1);
		
				if (id != null) {
					
					int swit = 0;	// 이미 찜을 했다면 1, 찜을 한적이 없으면 0
					
					for(int i = 0; i < basketList.size(); i++) {
						MyPlanBasketBean mpbb = (MyPlanBasketBean)basketList.get(i);
						
						if(mpbb.getTravel_id()==ptb.getTravel_id()) {
							swit = 1;
						}
					}
					
					if(swit == 0) {	// 찜을 한적이 없음
						%>
						<img alt="찜하기" src="./images/Spot/plus.png" title="이장소 찜하기" name="zzim"
					onclick="zzim_add('<%=ptb.getTravel_id()%>')"/>
						<%
					}else {	// 이미 찜을 함
						%>
						<img alt="찜하기" src="./images/Spot/minus.png" title="이장소 찜삭제" name="zzim"
					onclick="zzim_delete('<%=ptb.getTravel_id()%>')"/>
						<%
					}
				}else if (id == null) {
				%>
				<img alt="찜하기" src="./images/Spot/plus.png" title="이장소 찜하기" name="zzim_noId" onclick="popupToggle()"/>
				<%
				}
				%> 
	
	
</h2>


<!-- 장소 이미지(임시 이미지) -->

<div class="img_info">
	<div class="travel_img" >
	<%
	if(ib!=null){
	%>
 		<img alt="관광지 이미지" src="./images/plan/nation/<%=ib.getFile()%>" width="450px" height="300px">
 	<%
	}else{	
 	%>
 	<img alt="관광지 이미지" src="./images/pic01.jpg" width="450px" height="300px">
 	<%
	}
 	%>
 	</div>
 	<!-- 추가정보(검색설명) -->
	<div class="tr_info">
	<div class="map">
			<!-- 수현씨 지도 부분 -->
			<iframe width="100%" height="100%" frameborder="0" style="border: 0;"
				src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAwZMwcmxMBI0VQAUkusmqbMVHy-b4FuKQ&q=<%=ptb.getName()%>" allowfullscreen>
			</iframe>
		</div>
	</div>
</div>
<h1>&nbsp▶&nbsp<%=ptb.getInfo() %></h1>

<!-- 장소 설명(db에서 받아온 설명) -->

</div>
</section>



<section class = "planSpot">

<!-- 월별 옷차림(검색) -->
<div class="clear"></div>
<div class = "planSpot">

<h3>월별 옷차림 &nbsp<br><span>계절에 맞는 이 지역 코디를 검색해 보세요</span></h3>
<hr>
<div class="All_mon">
<input type="button"  value="1월" class="month" id="first">
<input type="button" value="2월" class="month">
<input type="button" value="3월" class="month" >
<input type="button" value="4월" class="month" >
<input type="button" value="5월" class="month" >
<input type="button" value="6월" class="month">
<input type="button" value="7월" class="month" >
<input type="button" value="8월" class="month" >
<input type="button" value="9월" class="month">
<input type="button" value="10월" class="month" >
<input type="button" value="11월" class="month">
<input type="button" value="12월" class="month" > 
</div>
<div class="clear"></div>

<div class="month_img">

</div>
</div>
<div class="clear"></div>

<!-- 선물리스트(1위 2위 3위)(db에서 받아오기) -->
<section class="giftList">
<div class = "planSpot">
<h3>선물 리스트<br><span>이 지역을 여행하신다면 한번 구매해보세요</span></h3>
<hr>
<!-- <img alt="이전" src="./images/Spot/arrow2.png"> -->

<%
if(souvenirList.size()==0){
	%>
	<div class="souvenir">
	<h4>등록된 기념품이 없습니다</h4>
	</div>
	<%
}%>
<div class="souvenir_list">
<%
	for(int i=0; i<souvenirList.size();i++){
		PlanSouvenirBean psb = (PlanSouvenirBean)souvenirList.get(i);
	%>
	
	
	<table class="souvenir" style="float: left; width: 300px; margin-right: 50px;">
		
			<tr style="background: none; border: none"><td style="text-align: center;"><%=psb.getName() %></td></tr>
			<tr style="background: none; border: none"><td style="text-align: center;"><img alt="" src="./upload/images/souvenir/<%=psb.getImg()%>" width="200" height="200" style="border: 1px solid #999;"></td></tr>
			<tr style="background: none; border: none"><td style="text-align: center;"><%=psb.getInfo() %></td></tr>
		
	</table>
	
	
	<%
	}
%>
</div>
<!-- <img alt="이후" src="./images/Spot/arrow.png">
 -->
 </div>
</section>

<!-- 장소에 대한 후기 작성(시간나면) -->
<div class="clear"></div>
<section style="height:800px;">
<div class="planSpot">
	<h3>
		<span style="color: #f44066; font-size: 28px;"><%=ptb.getName()%></span>의
		여러 <span style="color: #f44066; font-size: 28px;">후기</span>들을 알아보세요 <br>
	</h3>
	<hr>
	<div class="blog_epil">
		<div class="blog_Spot">
			<span class="text">블로그 후기</span>
		</div>
		<div class="Spot_epilogue">
			<span class="text" name="loc2">직접 작성한 여행 후기</span>
		</div>
		<div class="clear"></div>

		<script src="./assets/js/plan/planSpotSearch.js"></script>


		<div class="feature-grid">

			<!-- 이미지 서치 시작.-->
			<script src="./assets/js/plan/daumSearch3.js?ver=1"></script>
			<div id="daumForm">
				<input id="daumSearch" type="hidden"
					value="<%=ptb.getName()%>+여행후기"
					onkeydown="javascript:if(event.keyCode == 13) daumSearch.search();" />
				<!-- 				<input id="daumSubmit" onclick="javascript:daumSearch.search()" -->
				<!-- 					type="submit" value="검색" /> -->
			</div>
			<div id="daumView"
				style="display: block; height: 800px; margin-left: 2px; margin-top: 5px;">
				<div id="daumImage"></div>
			</div>
			<div id="daumScript" style="display: block;">
				<div id="daumImageScript"></div>
			</div>
		</div>
		<!-- 블로그 후기 나타나는 div -->
		<div class="clear"></div>

		<!-- 후기 작성 추가 -->
		<div id="Spot_epilogue"
			style="height: 800px; margin-left: 10px; margin-top: 5px;">

			<div class="comment">

				<div class="review_list">
					<!-- 리뷰 리스트 오는 자리 -->
					<!-- 페이지 번호 오는 자리 -->
				</div>
				<div class="comment_right">
					<%
						if (id != null) {
					%>
					<input type="button" value="리뷰쓰기" id="writeBtn"
						class="button alt writeBtn">
					<%
						}
					%>
					<!-- 숨겨진 공간 -->
					<div class="reviewWriterDiv">
						<form action="javascript:writeComplete()" method="post">
							<select id="eval">
								<option value="-1" style="font-weight: 900; color: #6B66FF">평가하기</option>
								<option value="1" style="color: orange;">좋아요!</option>
								<option value="2" style="color: blue;">괜찮아요.</option>
								<option value="3" style="color: red;">별로에요!</option>
							</select>
							<textarea rows="5" cols="5" maxlength="1000" name="content"></textarea>
							<div class="formBtnDiv">
								<input type="submit" value="작성완료" class="submitBtn"> <input
									type="reset" value="다시쓰기" class="resetBtn">
							</div>

						</form>

					</div>
					<!-- 리뷰작성 div(숨겨진 공간) -->

					<%
						if (id == null) {
					%>
					<div class="comment_member">
						<!-- 로그인, 회원가입 DIV -->
						<span>도움이 필요하신가요?<br>로그인하여 커뮤니티에 참여해 보세요!
						</span><br>
						<div class="comment_member_btn">
							<input type="button" value="로그인" onclick="popupToggle()">
							<input type="button" value="회원가입"
								onclick="location.href='./MemberJoin.me';">
						</div>
					</div>
					<!-- .comment_member -->
					<%
						}
					%>
				</div>
				<!-- .comment_right -->

				<div class="clear"></div>
			</div>
			<!-- .comment -->

		</div>
	</div>




</div>
</section>
</section>
<div class="clear"></div>
		<!-- 후기작성 스크립트 -->	
			<script type="text/javascript">
			
			

			/* 리뷰 작성완료 DB작업 */
			function writeComplete() {
				var con = $('textarea').val();
				var sel = $('#eval').val();
				if(con.length == 0) {
					alert("글을 입력해주세요.");
					return;
				}
				if(sel == -1) {
					alert("평가하기를 해주세요.");
					return;
				}
				
				$.ajax({
					type: 'post',
					url: './plan/planComment/planSpotCommentWrite.jsp',
					data : {spot:'<%=ptb.getName()%>', content : con, eval : sel},
					async: false,
					success: function(data) {
						$('textarea').val('');
						$('.reviewWriterDiv').css('display', 'none');
						toggleBtn = 0;
					},
					error: function(xhr, status, error) {
						alert(error);
				    } 
				});
				
				spotCommentList(1);
			}
			
			/* 페이징 변경이나 다른 작업 후 다시 리뷰 리스트를 로딩할때 */
			function spotCommentList(pageNum) {
				$.ajax({
					type: 'post',
					url: './plan/planComment/planSpotCommentList.jsp',
					data : {spot:'<%=ptb.getName()%>', pageNum : pageNum},
					success: function(data) {
						$('div.comment .review_list').empty();
						$('div.comment .review_list').append(data);
					},
					error: function(xhr, status, error) {
						alert(error);
				    }
				});
				location.href="#loc2";
			}
			
			/* 리뷰 삭제하기 */
			function spotCommentDelete(num, pageNum) {
				
				var con = confirm("리뷰를 삭제하시겠습니까?");
				
				if(con == true) {
					$.ajax({
						type: 'post',
						url: './plan/planComment/planSpotCommentDelete.jsp',
						data : {num : num},
						success: function(data) {
							alert("삭제 되었습니다.");
							spotCommentList(pageNum);
						},
						error: function(xhr, status, error) {
							alert(error);
					    }
					});
				}
			}
			

			//찜 버튼 누르면 내 일정에 담김.
			function zzim_add(travel_id) {
				$.ajax({
					type : 'POST',
					url : './MyPlanBasketAdd.pln',
					data : {
						'travel_id' : travel_id
					},
					dataType : 'text',
					async : false,
					success : function(data) {
						console.log(data)
					}
				});
				location.reload(true);
			}//찜 버튼 끝.
			
			// 찜취소 버튼 누르면 내일정에서 삭제
			function zzim_delete(travel_id) {
				$.ajax({
					type : 'POST',
					url : './MyPlanBasketDelete.pln',
					data : {
						'travel_id' : travel_id,
						'id' : '<%=id %>'
					},
					dataType : 'text',
					async : false,
					success : function(data) {
						console.log(data);
					}
				});
				location.reload(true);
			}

			//비로그인 상태에서 찜버튼을 누르면 로그인 창 활성화.
			function zzim_noId() {
				popupToggle()
			}
			
			
			</script>
			
	

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />