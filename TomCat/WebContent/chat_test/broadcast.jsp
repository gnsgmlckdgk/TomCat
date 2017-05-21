<!-- Header -->
<jsp:include page="../inc/header.jsp" />


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
	}
%>



<section id="banner">
	<fieldset>
		함께해요 게시판에 붙일예정.<br>
		http://nowonbun.tistory.com/285<br>
		http://m.mkexdev.net/337<br>
		http://cocomo.tistory.com/271<br>
		
		<textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea><br />
		
		<!-- onkeydown을 통해서 엔터키로도 입력되도록 설정. -->
		<input id="inputMessage" type="text" onkeydown="if(event.keyCode==13)send();"/>
		<input type="submit" value="send" onclick="send()"/>
		
	</fieldset>
</section>



<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket('ws://localhost:8080/TomCat/broadcasting');
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

	//	OnClose는 웹 소켓이 끊겼을 때 동작하는 함수.(여기서는 미사용.)

	//	OnMessage는 클라이언트에서 서버 측으로 메시지를 보내면 호출되는 함수.
	function onMessage(event) {
		textarea.value += event.data + "\n";
	}

	//	OnOpen은 서버 측에서 클라이언트와 웹 소켓 연결이 되었을 때 호출되는 함수.
	function onOpen(event) {
		textarea.value += "connected \n";
	}

	//	OnError는 웹 소켓이 에러가 나면 발생을 하는 함수.
	function onError(event) {
		alert("connecting error " + event.data);
	}
	
	// send 함수를 통해서 웹소켓으로 메시지를 보낸다.
	function send() {
		
		//	현재 채팅창에 출력될 값
		textarea.value += "<%=nick%> : " + inputMessage.value + "\n";
		
		//	서버에 보내줄때 날아가는 값.
		webSocket.send("<%=nick%> : " + inputMessage.value);

		inputMessage.value = "";
	}
	
</script>


