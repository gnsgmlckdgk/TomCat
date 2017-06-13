<%@page import="net.board.db.boardBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@page import="net.reply1.db.Reply1Bean"%>
<%@page import="java.util.Calendar"%>
<%@page import="net.Board1.db.BoardBean"%>
<%@page import="net.member.db.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<link href="./assets/css/list.css?ver=8" rel="stylesheet" type="text/css">

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" href="./assets/css/animate/animate.min.css"/>
</head>

<body class="fadein"  id="ima" >

<jsp:include page="../inc/header.jsp" />

<!-- Header -->
<section id="main">

   <!-- 버튼 : 위로 -->
   <button type="button" class="btn_up_layer">
      <img src="./board/up.png">
   </button>

   <script type="text/javascript">
      /* 위로
       스크롤이 특정 위치로 이동하면 위로버튼이 나타난다.
       위로버튼을 클릭하면 상단으로 이동
       */
      function btn_mv_up(oj) {
         if (!oj)
            return false;
         var o = $(oj);
         var p = $(window).scrollTop();
         if (p > 300) {
            o.fadeIn('slow');
         } // 위로버튼이 나타나는 위치 지정
         else if (p < 300) {
            o.fadeOut('slow');
         } // 위로버튼을 숨기는 위치 지정
      }

      // 위로 버튼
      $(document).scroll(function() {
         btn_mv_up('.btn_up_layer');
      }).on('click', '.btn_up_layer', function() {
         $("html, body").animate({
            scrollTop : 0
         }, 'slow');
      });
   </script>



<!-- giolocation 위치값 받기. 모바일환경에서도 작동. -->
<script type="text/javascript">  
  if (!!navigator.geolocation) 
  {
    navigator.geolocation.getCurrentPosition(successCallback,errorCallback);  
  }
  else
  {
    alert("이 브라우저는 Geolocation를 지원하지 않습니다");
  }
    
  function successCallback(position)
  {
    var lat = position.coords.latitude;
    var lng = position.coords.longitude;
    
    document.getElementById("location").value = lat + ", "+lng;
  }
  
  function errorCallback(error)
  {
    alert(error.message);
  }
</script>
<!-- giolocation 위치값 받기 끝-->
   
<!--                       세션값을 가져옵니다 -->
   <div class="q">
      <%
         // request.setAttribute("boardList", boardList);
         // request.setAttribute("pageNum", pageNum);
         // request.setAttribute("count", count);
         // request.setAttribute("pageCount", pageCount);
         // request.setAttribute("pageBlock", pageBlock);
         // request.setAttribute("startPage", startPage);
         // request.setAttribute("endPage", endPage);
         String nick=(String) session.getAttribute("nick");
         String id = (String) session.getAttribute("id");
         List boardList = (List) request.getAttribute("boardList");
         String pageNum = (String) request.getAttribute("pageNum");
         int count = ((Integer) request.getAttribute("count")).intValue();
         int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
         int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
         int startPage = ((Integer) request.getAttribute("startPage")).intValue();
         int endPage = ((Integer) request.getAttribute("endPage")).intValue();
         List<Reply1Bean> replyList = (List<Reply1Bean>) request.getAttribute("replyList");

         //jsp 날짜 구하기
         Calendar cal = Calendar.getInstance();
         //jsp 날짜 구하기 끝.
         
         
         
         if(id!=null){
      %>
<!--                            글쓰기 버튼 -->
      <form method="post" action="./BoardWrite1.bb" class="write">
         <input type="hidden" id="location" name="location" value="aaa">
         <input type="submit" value="글쓰기"  id="mit">
      </form>
      <%} %>
      
      <div class="w">
         <%
            //  boardList 
            for (int i = 0; i < boardList.size(); i++) {
               //자바빈(BoardBean) 변수 =배열한칸 접근   배열변수.get()
               BoardBean bb = (BoardBean) boardList.get(i);
               
                  System.out.println("이고이고2"+bb.getNum());
                  System.out.println("보드리스트사이즈:"+boardList.size());

               MemberDAO mdao = new MemberDAO();
               MemberBean mb = mdao.getMemberNick(bb.getNick_name());  
                  
               String content=bb.getContent();
               if(content!=null){
               content=bb.getContent().replace("\r\n", "<br>");
               }
               
         %>


         <div class="e"  id="<%=i%>" style="position: relative;">

            <!--  제목 -->
            <div id="sub">
               <%=bb.getSubject()%>
            </div>

            <!-- 내용 -->
            <div id="con">
               <%=content%><br>
<%--                현재 위치 <%=bb.getLocation() %> --%>
            </div>
<!--                <div class="clear"> -->
               
            <div id="2_inner_left" style="width: 30%;">
               <!-- 프로필 -->
               <div id="file">
<!--                   <img src="./upload/images/profileImg/pl.png"> -->

            <img src="./upload/images/profileImg/<%=mb.getProfile()%>">
               </div>

               <!-- 닉네임,날짜 -->
               <div id="nick">
                  <%=bb.getNick_name()%>
               </div>

               <!--  날짜 -->
               <!-- 현재 날짜와 글이 작성된 날짜를 비교해서, 언제 쓴 글인지 알기 쉽도록 한다. -->
               <div id="date">
                  <%
                     if (cal.get(Calendar.YEAR) == bb.getDate().getYear() + 1900) {
                        if (cal.get(Calendar.MONTH) == bb.getDate().getMonth()) {
                           if (cal.get(Calendar.DATE) == bb.getDate().getDate()) {
                                 
                  %>
                             	오늘
                  <%
                           } else {
                  %>
                              <%=cal.get(Calendar.DATE) - bb.getDate().getDate()%>일전
                  <%
                           }
                        } else {
                  %>
                           <%=cal.get(Calendar.MONTH) - bb.getDate().getMonth()%>달전
                  <%
                        }            
                     } else {
                  %>
                        <%=bb.getDate().getYear() + 1900%>년 <br>
                        <%=bb.getDate().getMonth()%>월
                        <%=bb.getDate().getDate()%>일
                        <%=bb.getDate().getHours()%>시
                                                
                  <%
                     }
                  %>
               </div>
               <!-- 날짜 끝. -->
               
               <div class="if">
               <!-- 수현씨 지도 부분 -->
               <%if(bb.getLocation() != null && !bb.getLocation().equals("null")) {%>
               
            <iframe width="100%" height="200px" frameborder="0" style="border: 0; margin:auto;"
               src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAwZMwcmxMBI0VQAUkusmqbMVHy-b4FuKQ&q=<%=bb.getLocation()%>" allowfullscreen>
            </iframe>
            <%} %>
            <!-- 수현씨 지도 부분 끝 -->
         </div>
<!--          세션에 있는 닉값  -->
<!--          글에있는 닉값 비교 -->
         
               
            </div>
            <div class="upde">
            <%if(nick.equals(bb.getNick_name())){ %>
            <% %>            
<input type="button" value="수정" onclick="location.href='./BoardUpdate1.bb?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
<input type="button" value="삭제" onclick="button_event(); location.href='./BoardDelete1.bb?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">

<script type="text/javascript">

function button_event(){

   if (confirm("정말 삭제하시겠습니까??") == false){    //확인

       document.form.submit();

   }else{   //취소

       return;

   }

   }

</script>

<%} %>

<input type="button" value="댓글" id="dat" class="comment<%=i%>" onclick="commentList('<%=bb.getNum()%>');">
   
</div>                                                                              
         <div id="plybb<%=bb.getNum()%>" class="replybb animated slideInLeft"   style="display: none">
                     
<%--             <%for(int q=0; q<replyList.size(); q++){ %>       --%>
               <%
//                Reply1Bean rr=replyList.get(q);
               %>   
               <div id="dat1<%=bb.getNum()%>">
<!--                댓글 닉네임 -->
               <div id="rp_nick">
<%--               <%=rr.getNick()%> --%>
              </div>
              
<!--               댓글 날짜      -->
              <div id="rp_date">
<%--               <%=rr.getDate() %> --%>
              </div>
              
<!--               댓글 내용      -->
              <div id="rp_con">
<%--               <%=rr.getContent()%> --%>
                 </div>
                 </div>
<%--                     <% }%>       --%>
<!--               num값 id값  textarea-->
   
         
         </div>
         </div>          
 
         <%
         }      
         %>

      </div>
   </div>

<div id="page1">
<%
//페이지 출력
if(count!=0){
   // 전체 페이지수 구하기   게시판 글 50개 한화면에 보여줄 글개수 10 => 5 전체페이지 +0=>5
         //  게시판 글 56개 한화면에 보여줄 글개수 10 => 5 전체페이지 +1(나머지)=>6 
   // 한 화면에 보여줄 페이지 번호 개수 
   // 시작페이지 번호구하기   1~10=>1   11~20=>11  21 ~30 => 21
   
   // 끝페이지 번호 구하기  
   //이전
   if(startPage>pageBlock){
      %><a id="page2" href="./BoardList1.bb?pageNum=<%=startPage-pageBlock%>" style="text-decoration:none; color:black;">[이전]</a><%
   }
   // 1..10  11..20  21...30
   for(int i=startPage;i<=endPage;i++){
      %><b><a id="page2"  href="./BoardList1.bb?pageNum=<%=i%>" style="text-decoration:none; color:black;">『<%=i%>』</a></b><%
   }
   // 다음
   if(endPage < pageCount){
      %><a id="page2"  href="./BoardList1.bb?pageNum=<%=startPage+pageBlock%>" style="text-decoration:none; color:black;">[다음]</a><%
   }
}
%>
</div>
</section>


<%if(id!=null){ %>

   <div id="chat">
 
      <script type="text/javascript">
      //  채팅을 불러온다.
      $(window).load(function() {
         $.ajax({
            type: 'post',
            url: './Chat.ct',
            success: function(data) {
               $('#chat').append(data);
            },
            error: function(xhr, status, error) {
                 alert(error);
             }   
         });
      });

       </script>
      <%}%>
</div>
<!-- 댓글 슬라이드 -->
<script type="text/javascript">
$(".upde").click(function(){
   if($(this).parents(".e").find(".replybb").css("display")  == 'none'){
      $(this).parents(".e").find(".replybb").css("display","block");
      }else{
         $(this).parents(".e").find(".replybb").css("display","none");
      }

});

function commentList(num) {
	 $.ajax('./board/replyAjax1.jsp',{
        data:{num: num},
        success:function(data){
     	   $('#dat1'+num).empty();
           $('#dat1'+num).append(data);
        }
     });
}

</script>  

<!-- Footer -->
 <jsp:include page="../inc/footer.jsp" />
</body>     
</html>