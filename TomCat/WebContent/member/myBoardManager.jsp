<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 내가 쓴 글 관리 페이지 -->
<!-- Header -->
<jsp:include page="../inc/header.jsp" />

<!-- Main -->
<section class="memberManager">
	<div class="memberContainer">	<!-- 서브메뉴 + 내용물 -->

		<!-- 서브메뉴 -->
		<jsp:include page="subMenu/memberManager.jsp"/>
		
		<!-- 컨텐츠 -->
		<div class="memberContent">	<!-- 내용물 -->
			
			<header>
				<h1>내가 작성한 글</h1><hr>
			</header>
			
			<div class="myBoardManager">	<!-- 게시판들 -->
			
			<div class="qnaBoard">	<!-- Q&A게시판 -->
<!-- 			<script type="text/javascript">
				$(document).ready(function(){
					/* 페이지 처음 실행시 게시글 목록 조회 */
					$.ajax({
						type:"POST",
		       		 url:"./member/getBoardList/qnaBoardList.jsp",
		       		 data : {},
		       		 success: function(data){
		         		$('.qnaBoard .table').append(data);
		      		  },
		        		error: function(xhr, status, error) {
		           		 alert(error);
		       		 }   
					});
				});
			</script> -->
				
				<h2>Q&A게시판</h2>
				
				<div class="table">추후 추가예정</div>
				
			</div> <!-- qnaBoard -->
			
			<div class="gramBoard">	<!-- 인생샷그램 -->
			<script type="text/javascript">
				$(document).ready(function(){
					/* 페이지 처음 실행시 게시글 목록 조회 */
					$.ajax({
						type:"POST",
		       		 url:"./member/getBoardList/gramBoardList.jsp",
		       		 data : {},
		       		 success: function(data){
		         		$('.gramBoard .table').append(data);
		      		  },
		        		error: function(xhr, status, error) {
		           		 alert(error);
		       		 }   
					});
				});
			</script>
				
				<h2>인생샷그램</h2>
				
				<div class="table"></div>
				
			</div> <!-- "gramBoard" -->
			
			<div class="togetherBoard">	<!-- 함께해요 -->
			<script type="text/javascript">
				$(document).ready(function(){
					/* 페이지 처음 실행시 게시글 목록 조회 */
					$.ajax({
						 type:"POST",
		       			 url:"./member/getBoardList/togetherBoardList.jsp",
		       			 data : {},
		       		 	success: function(data){
		         			$('.togetherBoard .table').append(data);
		      		  },
		        		error: function(xhr, status, error) {
		           		 alert(error);
		       		 }   
					});
				});
			</script>
				<h2>함께해요</h2>
				
				<div class="table"></div>
			
			</div> <!-- togetherBoard -->
			
			<div class="nationComu">	<!-- 국가 커뮤니티 -->
			<script type="text/javascript">
				$(document).ready(function(){
					/* 페이지 처음 실행시 게시글 목록 조회 */
					$.ajax({
						type:"POST",
		       		 url:"./member/getBoardList/nationCommentList.jsp",
		       		 data : {},
		       		 success: function(data){
		         		$('.nationComu .table').append(data);
		      		  },
		        		error: function(xhr, status, error) {
		           		 alert(error);
		       		 }   
					});
				});
			</script>	
				<h2>국가 커뮤니티</h2>
				
				<div class="table"></div>
				
			</div> <!-- nationComu -->
			
			<div class="regionComu">	<!-- 도시 커뮤니티 -->
			<script type="text/javascript">
				$(document).ready(function(){
					/* 페이지 처음 실행시 게시글 목록 조회 */
					$.ajax({
						type:"POST",
		       		 url:"./member/getBoardList/regionCommentList.jsp",
		       		 data : {},
		       		 success: function(data){
		         		$('.regionComu .table').append(data);
		      		  },
		        		error: function(xhr, status, error) {
		           		 alert(error);
		       		 }   
					});
				});
			</script>	
				<h2>도시 커뮤니티</h2>
					
				<div class="table"></div>
				
			</div> <!-- regionComu -->
		
			</div>	<!-- myBoardManager -->
		</div>	<!-- memberContent -->
	
	</div>	<!-- memberContainer -->
</section>	<!-- memberManager -->

<div class="clear"></div>

<!-- Footer -->
<jsp:include page="../inc/footer.jsp" />