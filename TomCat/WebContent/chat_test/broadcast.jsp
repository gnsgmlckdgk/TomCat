
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = "";
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}

	String nick = "";
	if (session.getAttribute("nick") != null) {
		nick = (String) session.getAttribute("nick");
	} else {
		nick = "NULL";
	}
%>

함께해요 게시판에 붙일예정.
<br>
http://nowonbun.tistory.com/285
<br>
http://m.mkexdev.net/337
<br>
http://cocomo.tistory.com/271
<br>
귓속말 기능 : http://j3rmy.tistory.com/3
<br>
<hr>
채팅방 입장 비밀번호. 귓속말(혹은 쪽지)
<br>
textarea가 아닌 div 사용해서 카카오톡처럼 만들기.
<br>
채팅방 이미지 전송.
<br>


<!-- onkeydown을 통해서 엔터키로도 입력되도록 설정. -->
<input id="inputMessage" type="text"
	onkeydown="if(event.keyCode==13){send();}" />
<input type="submit" value="send" onclick="send();" />
<div id="messageWindow2" style="padding:10px 0;height: 20em; overflow: auto; background-color: #a0c0d7;"></div>


<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket('ws://192.168.2.17:8080/TomCat/broadcasting');
	//var webSocket = new WebSocket('ws://localhost:8080/프로젝트명/broadcasting');
	var inputMessage = document.getElementById('inputMessage');

	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	webSocket.onmessage = function(event) {
		onMessage(event)
	};

	//	OnClose는 웹 소켓이 끊겼을 때 동작하는 함수.
	function onClose(event){
var div=document.createElement('div');
		
		//접속했을 때 접속자들에게 알릴 내용.
		webSocket.send("<%=nick%> is DisConnected\n");
	}

	//	OnMessage는 클라이언트에서 서버 측으로 메시지를 보내면 호출되는 함수.
	function onMessage(event) {
		
		//messageWindow2에 붙이기
		var div=document.createElement('div');
		
		div.style["width"]="auto";
		div.style["word-wrap"]="break-word";
		div.style["display"]="inline-block";
		div.style["background-color"]="#fcfcfc";
		div.style["border-radius"]="3px";
		div.style["padding"]="3px";
		div.style["margin-left"]="3px";

		
		div.innerHTML = event.data;
		document.getElementById('messageWindow2').appendChild(div);
		
		//clear div 추가		
		var clear=document.createElement('div');
		div.style["clear"]="both";
		document.getElementById('messageWindow2').appendChild(clear);
		
		//textarea 스크롤 아래로.
		messageWindow2.scrollTop = messageWindow2.scrollHeight;
		
	}

	//	OnOpen은 서버 측에서 클라이언트와 웹 소켓 연결이 되었을 때 호출되는 함수.
	function onOpen(event) {
		
		//접속했을 때, 내 영역에 보이는 글.
		
		var div=document.createElement('div');
		
		div.style["width"]="auto";
		div.style["word-wrap"]="break-word";
		div.style["display"]="inline-block";
		div.style["background-color"]="#fcfcfc";
		div.style["border-radius"]="3px";
		div.style["padding"]="3px";
		div.style["margin-left"]="3px";
		
		div.innerHTML = "connected";
		document.getElementById('messageWindow2').appendChild(div);
		
		var clear=document.createElement('div');
		div.style["clear"]="both";
		document.getElementById('messageWindow2').appendChild(clear);
		
		//접속했을 때 접속자들에게 알릴 내용.
		webSocket.send("<%=nick%> is connected\n");
	}

	//	OnError는 웹 소켓이 에러가 나면 발생을 하는 함수.
	function onError(event) {
		alert("chat_server connecting error " + event.data);
	}
	
	// send 함수를 통해서 웹소켓으로 메시지를 보낸다.
	function send() {
			
		
		
		//	서버에 보낼때 날아가는 값.
		webSocket.send("<%=nick%> : " + inputMessage.value);
		
		// 채팅화면 div에 붙일 내용
		var div=document.createElement('div');
		div.style["width"]="auto";
		div.style["word-wrap"]="break-word";
		div.style["float"]="right";
		div.style["display"]="inline-block";
		div.style["background-color"]="#ffea00";
		div.style["padding"]="3px";
		div.style["border-radius"]="3px";
		div.style["margin-right"]="3px";
		div.innerHTML = inputMessage.value;
		document.getElementById('messageWindow2').appendChild(div);

		//clear div 추가
		var clear = document.createElement('div');
		div.style["clear"] = "both";
		document.getElementById('messageWindow2').appendChild(clear);

		//	?
		//inputMessage.value = "";

		//	inputMessage의 value값을 지운다.
		inputMessage.value = '';

		//	textarea의 스크롤을 맨 밑으로 내린다.
		messageWindow2.scrollTop = messageWindow2.scrollHeight;
		
	}
</script>


